package com.icon.six.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.icon.six.constant.CommonConstant;
import com.icon.six.service.BoardService;
import com.icon.six.util.StringUtil;

@Controller
@RequestMapping("academy")
public class AcademyController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping(value="academyMain.do")
	public ModelAndView academyMain(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_main");
		
		//메인 화면 게시판 게시물 가져오기
		String[] boardNameArray = {CommonConstant.LEARNCENTER_BOARD,CommonConstant.LEARNSTRATEGY_BOARD,
							       CommonConstant.SNOTE_BOARD,CommonConstant.NSUBSCRIBE_BOARD};
		
		mav.addObject("boardList",boardService.selectMainBoardList(boardNameArray));
		
		return mav;
	}
	
	@RequestMapping(value="academyLearningCenter.do")
	public ModelAndView academyLearningCenter(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_lcenter");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.LEARNCENTER_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/academy/academyLearningCenterView.do");
				mav.addObject("writePage","/academy/academyLearningCenterWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "academyLearningCenterView.do")
	public ModelAndView academyLearningCenterView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("academy/academy_lcenter_view");
		
		requestMap.put("boardName", CommonConstant.LEARNCENTER_BOARD);	
		Map<String, Object> resultMap = boardService.selectBoardViewInfo(requestMap);
		
		if(resultMap.get("boardInfoMap") != null){
			
			Map<String, Object> boardInfoMap = new HashMap<String, Object>(); 
			boardInfoMap = (Map<String, Object>) resultMap.get("boardInfoMap");
			
			mav.addObject("list",boardInfoMap.get("list"));
			mav.addObject("page",boardInfoMap.get("page"));
		}
		
		mav.addObject("fileList",resultMap.get("fileList"));
		mav.addObject("boardInfo",resultMap.get("boardInfo"));
		mav.addObject("currentPage", resultMap.get("currentPage"));
		
		mav.addObject("listPage","/academy/academyLearningCenter.do");
		mav.addObject("updateAction","/academy/academyLearningCenterUpdate.do");
		mav.addObject("deleteAction","/academy/academyLearningCenterDeleteProcess.do");
		mav.addObject("replyAddAction","/academy/academyLearningCenterReplyAdd.do");
		mav.addObject("replyDelAction","/academy/academyLearningCenterReplyDel.do");
		mav.addObject("replyUpdAction","/academy/academyLearningCenterReplyUpdate.do");
		
		
		return mav;
	}
	
	@RequestMapping(value="academyLearningCenterWrite.do")
	public ModelAndView academyLearningCenterWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_lcenter_write");
		mav.addObject("listPage","/academy/academyLearningCenter.do");
		mav.addObject("insertAction","/academy/academyLearningCenterWriteProcess.do");
		
		return mav;
	}
	
	@RequestMapping(value="academyLearningCenterUpdate.do")
	public ModelAndView academyLearningCenterUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_lcenter_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.LEARNCENTER_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/academy/academyLearningCenterUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		
		return mav;
	}	
	
	@RequestMapping(value="academyLearningCenterWriteProcess.do")
	public void academyLearningCenterWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.LEARNCENTER_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/academy/academyLearningCenter.do");
				} else {
					// TODO 에러페이지
					response.sendRedirect("/main/error.do");
				}
			} else {
				// TODO 에러페이지
				response.sendRedirect("/main/error.do");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="academyLearningCenterUpdateProcess.do")
	public void academyLearningCenterUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.LEARNCENTER_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/academy/academyLearningCenter.do");
				} else {
					//TODO 에러 페이지
					response.sendRedirect("/main/error.do");
				}
				
			} else {
				// TODO 에러페이지 처리
				response.sendRedirect("/main/error.do");
			}
			
		} catch (IOException e) {
			// TODO 에러 페이지 처리
			
		}	
	}
	
	@RequestMapping(value="academyLearningCenterDeleteProcess.do")
	public void academyLearningCenterDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.LEARNCENTER_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/academy/academyLearningCenter.do");
				} else {
					//TODO 에러 페이지
					response.sendRedirect("/main/error.do");
				}
				
			} else {
				// TODO 에러페이지 처리
				response.sendRedirect("/main/error.do");
			}
			
		} catch (IOException e) {
			// TODO 에러 페이지 처리
			
		}	
	}
	
	@RequestMapping(value = "academyLearningCenterReplyAdd.do")
	public ModelAndView academyLearningCenterReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.LEARNCENTER_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/academy/academyLearningCenterView.do");
				 mav.addObject("seq",resultMap.get("seq"));
			 } else {
				 // TODO 에러처리
				 response.sendRedirect("/main/error.do");
			 }
			 
		} catch (Exception e) {
			// TODO: 에러처리
			
		}
		return mav;
		
	}
	
	@RequestMapping(value = "academyLearningCenterReplyDel.do")
	public ModelAndView academyLearningCenterReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.LEARNCENTER_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/academy/academyLearningCenterView.do");
				 mav.addObject("seq",resultMap.get("seq"));
			 } else {
				 // TODO 에러처리
				 response.sendRedirect("/main/error.do");
			 }
			
		} catch (Exception e) {
			// TODO: 에러처리
			
		}
		return mav;
		
	}
	
	@RequestMapping(value = "academyLearningCenterReplyUpdate.do")
	public ModelAndView academyLearningCenterReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.LEARNCENTER_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/academy/academyLearningCenterView.do");
				  mav.addObject("seq",resultMap.get("seq"));
			  } else {
				 // TODO 에러처리
				  response.sendRedirect("/main/error.do");
			  }
			
		} catch (Exception e) {
			// TODO: 에러처리
			
		}
		return mav;
	}
	
	@RequestMapping(value="academyInvestStrategy.do")
	public ModelAndView academyInvestStrategy(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_istrategy");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.LEARNSTRATEGY_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
				
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/academy/academyInvestStrategyView.do");
				mav.addObject("writePage","/academy/academyInvestStrategyWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "academyInvestStrategyView.do")
	public ModelAndView academyInvestStrategyView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("academy/academy_istrategy_view");
		
		requestMap.put("boardName", CommonConstant.LEARNSTRATEGY_BOARD);	
		Map<String, Object> resultMap = boardService.selectBoardViewInfo(requestMap);
		
		if(resultMap.get("boardInfoMap") != null){
			
			Map<String, Object> boardInfoMap = new HashMap<String, Object>(); 
			boardInfoMap = (Map<String, Object>) resultMap.get("boardInfoMap");
			
			mav.addObject("list",boardInfoMap.get("list"));
			mav.addObject("page",boardInfoMap.get("page"));
		}
		
		mav.addObject("fileList",resultMap.get("fileList"));
		mav.addObject("boardInfo",resultMap.get("boardInfo"));
		mav.addObject("currentPage", resultMap.get("currentPage"));
		
		mav.addObject("listPage","/academy/academyInvestStrategy.do");
		mav.addObject("updateAction","/academy/academyInvestStrategyUpdate.do");
		mav.addObject("deleteAction","/academy/academyInvestStrategyDeleteProcess.do");
		mav.addObject("replyAddAction","/academy/academyInvestStrategyReplyAdd.do");
		mav.addObject("replyDelAction","/academy/academyInvestStrategyReplyDel.do");
		mav.addObject("replyUpdAction","/academy/academyInvestStrategyReplyUpdate.do");
		
		
		return mav;
	}
	
	@RequestMapping(value="academyInvestStrategyWrite.do")
	public ModelAndView academyInvestStrategyWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_istrategy_write");
		mav.addObject("listPage","/academy/academyInvestStrategy.do");
		mav.addObject("insertAction","/academy/academyInvestStrategyWriteProcess.do");
		
		return mav;
	}
	
	@RequestMapping(value="academyInvestStrategyUpdate.do")
	public ModelAndView academyInvestStrategyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_lcenter_write");
		
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.LEARNSTRATEGY_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/academy/academyInvestStrategyUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		
		return mav;
	}	
	
	@RequestMapping(value="academyInvestStrategyWriteProcess.do")
	public void academyInvestStrategyWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.LEARNSTRATEGY_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/academy/academyInvestStrategy.do");
				} else {
					// TODO 에러페이지
					response.sendRedirect("/main/error.do");
				}
			} else {
				// TODO 에러페이지
				response.sendRedirect("/main/error.do");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value="academyInvestStrategyUpdateProcess.do")
	public void academyInvestStrategyUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.LEARNSTRATEGY_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/academy/academyInvestStrategy.do");
				} else {
					//TODO 에러 페이지
					response.sendRedirect("/main/error.do");
				}
				
			} else {
				// TODO 에러페이지 처리
				response.sendRedirect("/main/error.do");
			}
			
		} catch (IOException e) {
			// TODO 에러 페이지 처리
			
		}
		
	}
	
	@RequestMapping(value="academyInvestStrategyDeleteProcess.do")
	public void academyInvestStrategyDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.LEARNSTRATEGY_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/academy/academyInvestStrategy.do");
				} else {
					//TODO 에러 페이지
					response.sendRedirect("/main/error.do");
				}
				
			} else {
				// TODO 에러페이지 처리
				response.sendRedirect("/main/error.do");
			}
			
		} catch (IOException e) {
			// TODO 에러 페이지 처리
			
		}	
	}
	
	
	
	@RequestMapping(value = "academyInvestStrategyReplyAdd.do")
	public ModelAndView academyInvestStrategyReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.LEARNSTRATEGY_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/academy/academyInvestStrategyView.do");
				 mav.addObject("seq",resultMap.get("seq"));
			 } else {
				 // TODO 에러처리
				 response.sendRedirect("/main/error.do");
			 }
			 
		} catch (Exception e) {
			// TODO: 에러처리
			
		}
		return mav;
		
	}
	
	@RequestMapping(value = "academyInvestStrategyReplyDel.do")
	public ModelAndView academyInvestStrategyReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.LEARNSTRATEGY_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/academy/academyInvestStrategyView.do");
				 mav.addObject("seq",resultMap.get("seq"));
			 } else {
				 // TODO 에러처리
				 response.sendRedirect("/main/error.do");
			 }
			
		} catch (Exception e) {
			// TODO: 에러처리
			
		}
		return mav;
		
	}
	
	@RequestMapping(value = "academyInvestStrategyReplyUpdate.do")
	public ModelAndView academyInvestStrategyReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.LEARNSTRATEGY_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/academy/academyInvestStrategyView.do");
				  mav.addObject("seq",resultMap.get("seq"));
			  } else {
				 // TODO 에러처리
				  response.sendRedirect("/main/error.do");
			  }
			
		} catch (Exception e) {
			// TODO: 에러처리
			
		}
		return mav;
	}
	
	@RequestMapping(value="academySearchNote.do")
	public ModelAndView academySearchNote(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_snote");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.SNOTE_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/academy/academySearchNoteView.do");
				mav.addObject("writePage","/academy/academySearchNoteWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "academySearchNoteView.do")
	public ModelAndView academySearchNoteView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("academy/academy_snote_view");
		
		requestMap.put("boardName", CommonConstant.SNOTE_BOARD);	
		Map<String, Object> resultMap = boardService.selectBoardViewInfo(requestMap);
		
		if(resultMap.get("boardInfoMap") != null){
			
			Map<String, Object> boardInfoMap = new HashMap<String, Object>(); 
			boardInfoMap = (Map<String, Object>) resultMap.get("boardInfoMap");
			
			mav.addObject("list",boardInfoMap.get("list"));
			mav.addObject("page",boardInfoMap.get("page"));
		}
		
		mav.addObject("fileList",resultMap.get("fileList"));
		mav.addObject("boardInfo",resultMap.get("boardInfo"));
		mav.addObject("currentPage", resultMap.get("currentPage"));
		
		mav.addObject("listPage","/academy/academySearchNote.do");
		mav.addObject("updateAction","/academy/academySearchNoteUpdate.do");
		mav.addObject("deleteAction","/academy/academySearchNoteDeleteProcess.do");
		mav.addObject("replyAddAction","/academy/academySearchNoteReplyAdd.do");
		mav.addObject("replyDelAction","/academy/academySearchNoteReplyDel.do");
		mav.addObject("replyUpdAction","/academy/academySearchNoteReplyUpdate.do");
		
		
		return mav;
	}
	
	@RequestMapping(value="academySearchNoteWrite.do")
	public ModelAndView academySearchNoteWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_snote_write");
		mav.addObject("listPage","/academy/academySearchNote.do");
		mav.addObject("insertAction","/academy/academySearchNoteWriteProcess.do");
		
		return mav;
	}
	
	@RequestMapping(value="academySearchNoteUpdate.do")
	public ModelAndView academySearchNoteUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_snote_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.SNOTE_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/academy/academySearchNoteUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		
		return mav;
	}	
	
	@RequestMapping(value="academySearchNoteWriteProcess.do")
	public void academySearchNoteWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.SNOTE_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/academy/academySearchNote.do");
				} else {
					// TODO 에러페이지
					response.sendRedirect("/main/error.do");
				}
			} else {
				// TODO 에러페이지
				response.sendRedirect("/main/error.do");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="academySearchNoteUpdateProcess.do")
	public void academySearchNoteUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.SNOTE_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/academy/academySearchNote.do");
				} else {
					//TODO 에러 페이지
					response.sendRedirect("/main/error.do");
				}
				
			} else {
				// TODO 에러페이지 처리
				response.sendRedirect("/main/error.do");
			}
			
		} catch (IOException e) {
			// TODO 에러 페이지 처리
			
		}	
	}
	
	@RequestMapping(value="academySearchNoteDeleteProcess.do")
	public void academySearchNoteDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.SNOTE_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/academy/academySearchNote.do");
				} else {
					//TODO 에러 페이지
					response.sendRedirect("/main/error.do");
				}
				
			} else {
				// TODO 에러페이지 처리
				response.sendRedirect("/main/error.do");
			}
			
		} catch (IOException e) {
			// TODO 에러 페이지 처리
			
		}	
	}
	
	@RequestMapping(value = "academySearchNoteReplyAdd.do")
	public ModelAndView academySearchNoteReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.SNOTE_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/academy/academySearchNoteView.do");
				 mav.addObject("seq",resultMap.get("seq"));
			 } else {
				 // TODO 에러처리
				 response.sendRedirect("/main/error.do");
			 }
			 
		} catch (Exception e) {
			// TODO: 에러처리
			
		}
		return mav;
		
	}
	
	@RequestMapping(value = "academySearchNoteReplyDel.do")
	public ModelAndView academySearchNoteReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.SNOTE_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/academy/academySearchNoteView.do");
				 mav.addObject("seq",resultMap.get("seq"));
			 } else {
				 // TODO 에러처리
				 response.sendRedirect("/main/error.do");
			 }
			
		} catch (Exception e) {
			// TODO: 에러처리
			
		}
		return mav;
		
	}
	
	@RequestMapping(value = "academySearchNoteReplyUpdate.do")
	public ModelAndView academySearchNoteReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.SNOTE_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/academy/academySearchNoteView.do");
				  mav.addObject("seq",resultMap.get("seq"));
			  } else {
				 // TODO 에러처리
				  response.sendRedirect("/main/error.do");
			  }
			
		} catch (Exception e) {
			// TODO: 에러처리
			
		}
		return mav;
	}
	
	@RequestMapping(value="academyNecessarySubscribe.do")
	public ModelAndView academyNecessarySubscribe(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_nsubscribe");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.NSUBSCRIBE_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/academy/academyNecessarySubscribeView.do");
				mav.addObject("writePage","/academy/academyNecessarySubscribeWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "academyNecessarySubscribeView.do")
	public ModelAndView academyNecessarySubscribeView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("academy/academy_nsubscribe_view");
		
		requestMap.put("boardName", CommonConstant.NSUBSCRIBE_BOARD);	
		Map<String, Object> resultMap = boardService.selectBoardViewInfo(requestMap);
		
		if(resultMap.get("boardInfoMap") != null){
			
			Map<String, Object> boardInfoMap = new HashMap<String, Object>(); 
			boardInfoMap = (Map<String, Object>) resultMap.get("boardInfoMap");
			
			mav.addObject("list",boardInfoMap.get("list"));
			mav.addObject("page",boardInfoMap.get("page"));
		}
		
		mav.addObject("fileList",resultMap.get("fileList"));
		mav.addObject("boardInfo",resultMap.get("boardInfo"));
		mav.addObject("currentPage", resultMap.get("currentPage"));
		
		mav.addObject("listPage","/academy/academyNecessarySubscribe.do");
		mav.addObject("updateAction","/academy/academyNecessarySubscribeUpdate.do");
		mav.addObject("deleteAction","/academy/academyNecessarySubscribeDeleteProcess.do");
		mav.addObject("replyAddAction","/academy/academyNecessarySubscribeReplyAdd.do");
		mav.addObject("replyDelAction","/academy/academyNecessarySubscribeReplyDel.do");
		mav.addObject("replyUpdAction","/academy/academyNecessarySubscribeReplyUpdate.do");
		
		return mav;
	}
	
	@RequestMapping(value="academyNecessarySubscribeWrite.do")
	public ModelAndView academyNecessarySubscribeWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_nsubscribe_write");
		mav.addObject("listPage","/academy/academyNecessarySubscribe.do");
		mav.addObject("insertAction","/academy/academyNecessarySubscribeWriteProcess.do");
		
		return mav;
	}
	
	@RequestMapping(value="academyNecessarySubscribeUpdate.do")
	public ModelAndView academyNecessarySubscribeUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_nsubscribe_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.NSUBSCRIBE_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/academy/academyNecessarySubscribeUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		
		return mav;
	}	
	
	@RequestMapping(value="academyNecessarySubscribeWriteProcess.do")
	public void academyNecessarySubscribeWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.NSUBSCRIBE_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/academy/academyNecessarySubscribe.do");
				} else {
					// TODO 에러페이지
					response.sendRedirect("/main/error.do");
				}
			} else {
				// TODO 에러페이지
				response.sendRedirect("/main/error.do");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="academyNecessarySubscribeUpdateProcess.do")
	public void academyNecessarySubscribeUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.NSUBSCRIBE_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/academy/academyNecessarySubscribe.do");
				} else {
					//TODO 에러 페이지
					response.sendRedirect("/main/error.do");
				}
				
			} else {
				// TODO 에러페이지 처리
				response.sendRedirect("/main/error.do");
			}
			
		} catch (IOException e) {
			// TODO 에러 페이지 처리
			
		}	
	}
	
	@RequestMapping(value="academyNecessarySubscribeDeleteProcess.do")
	public void academyNecessarySubscribeDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.NSUBSCRIBE_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/academy/academyNecessarySubscribe.do");
				} else {
					//TODO 에러 페이지
					response.sendRedirect("/main/error.do");
				}
				
			} else {
				// TODO 에러페이지 처리
				response.sendRedirect("/main/error.do");
			}
			
		} catch (IOException e) {
			// TODO 에러 페이지 처리
			
		}	
	}
	
	@RequestMapping(value = "academyNecessarySubscribeReplyAdd.do")
	public ModelAndView academyNecessarySubscribeReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.NSUBSCRIBE_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/academy/academyNecessarySubscribeView.do");
				 mav.addObject("seq",resultMap.get("seq"));
			 } else {
				 // TODO 에러처리
				 response.sendRedirect("/main/error.do");
			 }
			 
		} catch (Exception e) {
			// TODO: 에러처리
			
		}
		return mav;
		
	}
	
	@RequestMapping(value = "academyNecessarySubscribeReplyDel.do")
	public ModelAndView academyNecessarySubscribeReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.NSUBSCRIBE_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/academy/academyNecessarySubscribeView.do");
				 mav.addObject("seq",resultMap.get("seq"));
			 } else {
				 // TODO 에러처리
				 response.sendRedirect("/main/error.do");
			 }
			
		} catch (Exception e) {
			// TODO: 에러처리
			
		}
		return mav;
		
	}
	
	@RequestMapping(value = "academyNecessarySubscribeReplyUpdate.do")
	public ModelAndView academyNecessarySubscribeReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.NSUBSCRIBE_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/academy/academyNecessarySubscribeView.do");
				  mav.addObject("seq",resultMap.get("seq"));
			  } else {
				 // TODO 에러처리
				  response.sendRedirect("/main/error.do");
			  }
			
		} catch (Exception e) {
			// TODO: 에러처리
			
		}
		return mav;
	}
	
}
