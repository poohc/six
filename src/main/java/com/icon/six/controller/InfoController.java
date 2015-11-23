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
@RequestMapping("info")
public class InfoController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping(value="infoMain.do")
	public ModelAndView infoMain(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("info/info_main");
		
		//메인 화면 게시판 게시물 가져오기
		String[] boardNameArray = {CommonConstant.INFOFREEREC_BOARD,CommonConstant.INFOSECTECH_BOARD,
							       CommonConstant.INFOTHEME_BOARD,CommonConstant.INFOSTOCKBRIEFING_BOARD,
							       CommonConstant.INFOGINTERVIEW_BOARD,CommonConstant.INFOREALSTOCK_BOARD};
		
		mav.addObject("boardList",boardService.selectMainBoardList(boardNameArray));
		
		return mav;
	}
	
	@RequestMapping(value="infoFreeRec.do")
	public ModelAndView infoFreeRec(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("info/info_freeRec");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.INFOFREEREC_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/info/infoFreeRecView.do");
				mav.addObject("writePage","/info/infoFreeRecWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "infoFreeRecView.do")
	public ModelAndView infoFreeRecView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("info/info_freeRec_view");
		
		requestMap.put("boardName", CommonConstant.INFOFREEREC_BOARD);	
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
		
		mav.addObject("listPage","/info/infoFreeRec.do");
		mav.addObject("updateAction","/info/infoFreeRecUpdate.do");
		mav.addObject("deleteAction","/info/infoFreeRecDeleteProcess.do");
		mav.addObject("replyAddAction","/info/infoFreeRecReplyAdd.do");
		mav.addObject("replyDelAction","/info/infoFreeRecReplyDel.do");
		mav.addObject("replyUpdAction","/info/infoFreeRecReplyUpdate.do");
		
		return mav;
	}
	
	@RequestMapping(value="infoFreeRecWrite.do")
	public ModelAndView infoFreeRecWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("info/info_freeRec_write");
		mav.addObject("listPage","/info/infoFreeRec.do");
		mav.addObject("insertAction","/info/infoFreeRecWriteProcess.do");
		
		return mav;
	}
	
	@RequestMapping(value="infoFreeRecUpdate.do")
	public ModelAndView infoFreeRecUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("info/info_freeRec_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.INFOFREEREC_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/info/infoFreeRecUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		
		return mav;
	}	
	
	@RequestMapping(value="infoFreeRecWriteProcess.do")
	public void infoFreeRecWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.INFOFREEREC_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/info/infoFreeRec.do");
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
	
	@RequestMapping(value="infoFreeRecUpdateProcess.do")
	public void infoFreeRecUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.INFOFREEREC_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/info/infoFreeRec.do");
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
	
	@RequestMapping(value="infoFreeRecDeleteProcess.do")
	public void infoFreeRecDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.INFOFREEREC_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/info/infoFreeRec.do");
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
	
	@RequestMapping(value = "infoFreeRecReplyAdd.do")
	public ModelAndView infoFreeRecReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.INFOFREEREC_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/info/infoFreeRecView.do");
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
	
	@RequestMapping(value = "infoFreeRecReplyDel.do")
	public ModelAndView infoFreeRecReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.INFOFREEREC_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/info/infoFreeRecView.do");
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
	
	@RequestMapping(value = "infoFreeRecReplyUpdate.do")
	public ModelAndView infoFreeRecReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.INFOFREEREC_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/info/infoFreeRecView.do");
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
	
	@RequestMapping(value="infoSecTech.do")
	public ModelAndView infoSecTech(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("info/info_secTech");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.INFOSECTECH_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/info/infoSecTechView.do");
				mav.addObject("writePage","/info/infoSecTechWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "infoSecTechView.do")
	public ModelAndView infoSecTechView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("info/info_secTech_view");
		
		requestMap.put("boardName", CommonConstant.INFOSECTECH_BOARD);	
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
		
		mav.addObject("listPage","/info/infoSecTech.do");
		mav.addObject("updateAction","/info/infoSecTechUpdate.do");
		mav.addObject("deleteAction","/info/infoSecTechDeleteProcess.do");
		mav.addObject("replyAddAction","/info/infoSecTechReplyAdd.do");
		mav.addObject("replyDelAction","/info/infoSecTechReplyDel.do");
		mav.addObject("replyUpdAction","/info/infoSecTechReplyUpdate.do");
		
		return mav;
	}
	
	@RequestMapping(value="infoSecTechWrite.do")
	public ModelAndView infoSecTechWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("info/info_secTech_write");
		mav.addObject("listPage","/info/infoSecTech.do");
		mav.addObject("insertAction","/info/infoSecTechWriteProcess.do");
		
		return mav;
	}
	
	@RequestMapping(value="infoSecTechUpdate.do")
	public ModelAndView infoSecTechUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("info/info_secTech_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.INFOSECTECH_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/info/infoSecTechUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		
		return mav;
	}	
	
	@RequestMapping(value="infoSecTechWriteProcess.do")
	public void infoSecTechWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.INFOSECTECH_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/info/infoSecTech.do");
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
	
	@RequestMapping(value="infoSecTechUpdateProcess.do")
	public void infoSecTechUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.INFOSECTECH_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/info/infoSecTech.do");
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
	
	@RequestMapping(value="infoSecTechDeleteProcess.do")
	public void infoSecTechDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.INFOSECTECH_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/info/infoSecTech.do");
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
	
	@RequestMapping(value = "infoSecTechReplyAdd.do")
	public ModelAndView infoSecTechReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.INFOSECTECH_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/info/infoSecTechView.do");
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
	
	@RequestMapping(value = "infoSecTechReplyDel.do")
	public ModelAndView infoSecTechReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.INFOSECTECH_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/info/infoSecTechView.do");
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
	
	@RequestMapping(value = "infoSecTechReplyUpdate.do")
	public ModelAndView infoSecTechReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.INFOSECTECH_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/info/infoSecTechView.do");
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
	
	@RequestMapping(value="infoTheme.do")
	public ModelAndView infoTheme(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("info/info_theme");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.INFOTHEME_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/info/infoThemeView.do");
				mav.addObject("writePage","/info/infoThemeWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "infoThemeView.do")
	public ModelAndView infoThemeView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("info/info_theme_view");
		
		requestMap.put("boardName", CommonConstant.INFOTHEME_BOARD);	
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
		
		mav.addObject("listPage","/info/infoTheme.do");
		mav.addObject("updateAction","/info/infoThemeUpdate.do");
		mav.addObject("deleteAction","/info/infoThemeDeleteProcess.do");
		mav.addObject("replyAddAction","/info/infoThemeReplyAdd.do");
		mav.addObject("replyDelAction","/info/infoThemeReplyDel.do");
		mav.addObject("replyUpdAction","/info/infoThemeReplyUpdate.do");
		
		return mav;
	}
	
	@RequestMapping(value="infoThemeWrite.do")
	public ModelAndView infoThemeWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("info/info_theme_write");
		mav.addObject("listPage","/info/infoTheme.do");
		mav.addObject("insertAction","/info/infoThemeWriteProcess.do");
		
		return mav;
	}
	
	@RequestMapping(value="infoThemeUpdate.do")
	public ModelAndView infoThemeUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("info/info_theme_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.INFOTHEME_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/info/infoThemeUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		
		return mav;
	}	
	
	@RequestMapping(value="infoThemeWriteProcess.do")
	public void infoThemeWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.INFOTHEME_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/info/infoTheme.do");
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
	
	@RequestMapping(value="infoThemeUpdateProcess.do")
	public void infoThemeUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.INFOTHEME_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/info/infoTheme.do");
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
	
	@RequestMapping(value="infoThemeDeleteProcess.do")
	public void infoThemeDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.INFOTHEME_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/info/infoTheme.do");
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
	
	@RequestMapping(value = "infoThemeReplyAdd.do")
	public ModelAndView infoThemeReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.INFOTHEME_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/info/infoThemeView.do");
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
	
	@RequestMapping(value = "infoThemeReplyDel.do")
	public ModelAndView infoThemeReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.INFOTHEME_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/info/infoThemeView.do");
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
	
	@RequestMapping(value = "infoThemeReplyUpdate.do")
	public ModelAndView infoThemeReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.INFOTHEME_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/info/infoThemeView.do");
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
	
	@RequestMapping(value="infoRealStock.do")
	public ModelAndView infoRealStock(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("info/info_realStock");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.INFOREALSTOCK_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/info/infoRealStockView.do");
				mav.addObject("writePage","/info/infoRealStockWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "infoRealStockView.do")
	public ModelAndView infoRealStockView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("info/info_realStock_view");
		
		requestMap.put("boardName", CommonConstant.INFOREALSTOCK_BOARD);	
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
		
		mav.addObject("listPage","/info/infoRealStock.do");
		mav.addObject("updateAction","/info/infoRealStockUpdate.do");
		mav.addObject("deleteAction","/info/infoRealStockDeleteProcess.do");
		mav.addObject("replyAddAction","/info/infoRealStockReplyAdd.do");
		mav.addObject("replyDelAction","/info/infoRealStockReplyDel.do");
		mav.addObject("replyUpdAction","/info/infoRealStockReplyUpdate.do");
		
		return mav;
	}
	
	@RequestMapping(value="infoRealStockWrite.do")
	public ModelAndView infoRealStockWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("info/info_realStock_write");
		mav.addObject("listPage","/info/infoRealStock.do");
		mav.addObject("insertAction","/info/infoRealStockWriteProcess.do");
		
		return mav;
	}
	
	@RequestMapping(value="infoRealStockUpdate.do")
	public ModelAndView infoRealStockUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("info/info_realStock_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.INFOREALSTOCK_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/info/infoRealStockUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		
		return mav;
	}	
	
	@RequestMapping(value="infoRealStockWriteProcess.do")
	public void infoRealStockWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.INFOREALSTOCK_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/info/infoRealStock.do");
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
	
	@RequestMapping(value="infoRealStockUpdateProcess.do")
	public void infoRealStockUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.INFOREALSTOCK_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/info/infoRealStock.do");
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
	
	@RequestMapping(value="infoRealStockDeleteProcess.do")
	public void infoRealStockDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.INFOREALSTOCK_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/info/infoRealStock.do");
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
	
	@RequestMapping(value = "infoRealStockReplyAdd.do")
	public ModelAndView infoRealStockReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.INFOREALSTOCK_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/info/infoRealStockView.do");
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
	
	@RequestMapping(value = "infoRealStockReplyDel.do")
	public ModelAndView infoRealStockReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.INFOREALSTOCK_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/info/infoRealStockView.do");
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
	
	@RequestMapping(value = "infoRealStockReplyUpdate.do")
	public ModelAndView infoRealStockReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.INFOREALSTOCK_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/info/infoRealStockView.do");
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
	
	@RequestMapping(value="infoStockBriefing.do")
	public ModelAndView infoStockBriefing(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("info/info_stockBriefing");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.INFOSTOCKBRIEFING_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/info/infoStockBriefingView.do");
				mav.addObject("writePage","/info/infoStockBriefingWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "infoStockBriefingView.do")
	public ModelAndView infoStockBriefingView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("info/info_stockBriefing_view");
		
		requestMap.put("boardName", CommonConstant.INFOSTOCKBRIEFING_BOARD);	
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
		
		mav.addObject("listPage","/info/infoStockBriefing.do");
		mav.addObject("updateAction","/info/infoStockBriefingUpdate.do");
		mav.addObject("deleteAction","/info/infoStockBriefingDeleteProcess.do");
		mav.addObject("replyAddAction","/info/infoStockBriefingReplyAdd.do");
		mav.addObject("replyDelAction","/info/infoStockBriefingReplyDel.do");
		mav.addObject("replyUpdAction","/info/infoStockBriefingReplyUpdate.do");
		
		return mav;
	}
	
	@RequestMapping(value="infoStockBriefingWrite.do")
	public ModelAndView infoStockBriefingWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("info/info_stockBriefing_write");
		mav.addObject("listPage","/info/infoStockBriefing.do");
		mav.addObject("insertAction","/info/infoStockBriefingWriteProcess.do");
		
		return mav;
	}
	
	@RequestMapping(value="infoStockBriefingUpdate.do")
	public ModelAndView infoStockBriefingUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("info/info_lcenter_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.INFOSTOCKBRIEFING_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/info/infoStockBriefingUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		
		return mav;
	}	
	
	@RequestMapping(value="infoStockBriefingWriteProcess.do")
	public void infoStockBriefingWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.INFOSTOCKBRIEFING_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/info/infoStockBriefing.do");
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
	
	@RequestMapping(value="infoStockBriefingUpdateProcess.do")
	public void infoStockBriefingUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.INFOSTOCKBRIEFING_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/info/infoStockBriefing.do");
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
	
	@RequestMapping(value="infoStockBriefingDeleteProcess.do")
	public void infoStockBriefingDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.INFOSTOCKBRIEFING_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/info/infoStockBriefing.do");
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
	
	@RequestMapping(value = "infoStockBriefingReplyAdd.do")
	public ModelAndView infoStockBriefingReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.INFOSTOCKBRIEFING_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/info/infoStockBriefingView.do");
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
	
	@RequestMapping(value = "infoStockBriefingReplyDel.do")
	public ModelAndView infoStockBriefingReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.INFOSTOCKBRIEFING_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/info/infoStockBriefingView.do");
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
	
	@RequestMapping(value = "infoStockBriefingReplyUpdate.do")
	public ModelAndView infoStockBriefingReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.INFOSTOCKBRIEFING_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/info/infoStockBriefingView.do");
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
	
	@RequestMapping(value="infoGInterview.do")
	public ModelAndView infoGInterview(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("info/info_gInterview");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.INFOGINTERVIEW_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/info/infoGInterviewView.do");
				mav.addObject("writePage","/info/infoGInterviewWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "infoGInterviewView.do")
	public ModelAndView infoGInterviewView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("info/info_gInterview_view");
		
		requestMap.put("boardName", CommonConstant.INFOGINTERVIEW_BOARD);	
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
		
		mav.addObject("listPage","/info/infoGInterview.do");
		mav.addObject("updateAction","/info/infoGInterviewUpdate.do");
		mav.addObject("deleteAction","/info/infoGInterviewDeleteProcess.do");
		mav.addObject("replyAddAction","/info/infoGInterviewReplyAdd.do");
		mav.addObject("replyDelAction","/info/infoGInterviewReplyDel.do");
		mav.addObject("replyUpdAction","/info/infoGInterviewReplyUpdate.do");
		
		return mav;
	}
	
	@RequestMapping(value="infoGInterviewWrite.do")
	public ModelAndView infoGInterviewWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("info/info_gInterview_write");
		mav.addObject("listPage","/info/infoGInterview.do");
		mav.addObject("insertAction","/info/infoGInterviewWriteProcess.do");
		
		return mav;
	}
	
	@RequestMapping(value="infoGInterviewUpdate.do")
	public ModelAndView infoGInterviewUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("info/info_gInterview_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.INFOGINTERVIEW_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/info/infoGInterviewUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		
		return mav;
	}	
	
	@RequestMapping(value="infoGInterviewWriteProcess.do")
	public void infoGInterviewWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.INFOGINTERVIEW_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/info/infoGInterview.do");
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
	
	@RequestMapping(value="infoGInterviewUpdateProcess.do")
	public void infoGInterviewUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.INFOGINTERVIEW_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/info/infoGInterview.do");
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
	
	@RequestMapping(value="infoGInterviewDeleteProcess.do")
	public void infoGInterviewDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.INFOGINTERVIEW_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/info/infoGInterview.do");
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
	
	@RequestMapping(value = "infoGInterviewReplyAdd.do")
	public ModelAndView infoGInterviewReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.INFOGINTERVIEW_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/info/infoGInterviewView.do");
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
	
	@RequestMapping(value = "infoGInterviewReplyDel.do")
	public ModelAndView infoGInterviewReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.INFOGINTERVIEW_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/info/infoGInterviewView.do");
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
	
	@RequestMapping(value = "infoGInterviewReplyUpdate.do")
	public ModelAndView infoGInterviewReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.INFOGINTERVIEW_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/info/infoGInterviewView.do");
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
