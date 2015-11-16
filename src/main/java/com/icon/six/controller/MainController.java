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
@RequestMapping("main")
public class MainController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping(value = "main.do")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/main");
		
		//메인 화면 게시판 게시물 가져오기
		String[] boardNameArray = {CommonConstant.MARKETFREE_BOARD,CommonConstant.MARKETISTRATEGY_BOARD,
				 			       CommonConstant.MARKETANALYSIS_BOARD,CommonConstant.MARKETPAY_BOARD,
				 			       CommonConstant.MARKETBARGAIN_BOARD,CommonConstant.MARKETADV_BOARD,
				 			       CommonConstant.LEARNCENTER_BOARD,CommonConstant.LEARNSTRATEGY_BOARD,
				 			       CommonConstant.SNOTE_BOARD,CommonConstant.INFOSECTECH_BOARD,
				 			       CommonConstant.INFOSTOCKBRIEFING_BOARD,CommonConstant.INFOGINTERVIEW_BOARD};
		
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("boardList",boardService.selectMainBoardList(boardNameArray));
		
		return mav;
	}
	
	@RequestMapping(value = "introSix.do")
	public ModelAndView introSix(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("introduce/intro_six");
		
		return mav;
	}
	
	@RequestMapping(value = "introNotice.do")
	public ModelAndView introNotice(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("introduce/intro_notice");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.INTRO_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/main/introNoticeView.do");
				mav.addObject("writePage","/main/introNoticeWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "introNoticeView.do")
	public ModelAndView introNoticeView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("introduce/intro_notice_view");
		
		requestMap.put("boardName", CommonConstant.INTRO_BOARD);	
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
		
		mav.addObject("listPage","/main/introNoticeView.do");
		mav.addObject("updateAction","/main/introNoticeUpdate.do");
		mav.addObject("deleteAction","/main/introNoticeDeleteProcess.do");
		
		return mav;
	}
	
	@RequestMapping(value = "introNoticeWrite.do")
	public ModelAndView introNoticeWrite(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("introduce/intro_notice_write");
		mav.addObject("listPage","/main/introNoticeView.do");
		mav.addObject("insertAction","/main/introNoticeWriteProcess.do");
		return mav;
	}
	
	@RequestMapping(value = "introNoticeUpdate.do")
	public ModelAndView introNoticeUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("introduce/intro_notice_write");
		
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.INTRO_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/main/introNoticeUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		
		return mav;		
	}
	
	@RequestMapping(value = "introNoticeWriteProcess.do")
	public void introNoticeWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.INTRO_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/main/introNotice.do");
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
	
	@RequestMapping(value = "introNoticeUpdateProcess.do")
	public void introNoticeUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.INTRO_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/main/introNotice.do");
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
	
	@RequestMapping(value = "introNoticeDeleteProcess.do")
	public void introNoticeDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.INTRO_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/main/introNotice.do");
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
	
	@RequestMapping(value = "introHowToPay.do")
	public ModelAndView introHowToPay(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("introduce/intro_howTopay");
		
		return mav;
	}
	
	@RequestMapping(value="introQna.do")
	public ModelAndView introQna(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("introduce/intro_qna");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.CUSTQNA_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/main/introQnaView.do");
				mav.addObject("writePage","/main/introQnaWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "introQnaView.do")
	public ModelAndView introQnaView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("introduce/intro_qna_view");
		
		requestMap.put("boardName", CommonConstant.CUSTQNA_BOARD);	
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
		
		mav.addObject("listPage","/main/introQnaView.do");
		mav.addObject("updateAction","/main/introQnaUpdate.do");
		mav.addObject("deleteAction","/main/introQnaDeleteProcess.do");
		mav.addObject("replyAddAction","/main/introQnaReplyAdd.do");
		mav.addObject("replyDelAction","/main/introQnaReplyDel.do");
		mav.addObject("replyUpdAction","/main/introQnaReplyUpdate.do");
			
		return mav;
	}
	
	@RequestMapping(value="introQnaWrite.do")
	public ModelAndView introQnaWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("introduce/intro_qna_write");
		mav.addObject("listPage","/main/introQnaView.do");
		mav.addObject("insertAction","/main/introQnaWriteProcess.do");
		return mav;
	}
	
	@RequestMapping(value="introQnaUpdate.do")
	public ModelAndView introQnaUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("introduce/intro_qna_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.CUSTQNA_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/main/introQnaUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		return mav;
	}	
	
	@RequestMapping(value="introQnaWriteProcess.do")
	public void introQnaWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.CUSTQNA_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/main/introQna.do");
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
	
	@RequestMapping(value="introQnaUpdateProcess.do")
	public void introQnaUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.CUSTQNA_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/main/introQna.do");
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
	
	@RequestMapping(value="introQnaDeleteProcess.do")
	public void introQnaDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.CUSTQNA_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/main/introQna.do");
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
	
	@RequestMapping(value = "introQnaReplyAdd.do")
	public ModelAndView introQnaReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.CUSTQNA_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/main/introQnaView.do");
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
	
	@RequestMapping(value = "introQnaReplyDel.do")
	public ModelAndView introQnaReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.CUSTQNA_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/main/introQnaView.do");
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
	
	@RequestMapping(value = "introQnaReplyUpdate.do")
	public ModelAndView introQnaReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.CUSTQNA_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/main/introQnaView.do");
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
	
	@RequestMapping(value = "freeAdvice.do")
	public ModelAndView freeAdvice(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("introduce/intro_free_advice");
		return mav;
	}
	
	@RequestMapping(value = "error.do")
	public ModelAndView errorPage(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("common/error");
		
		return mav;
	}
	
}
