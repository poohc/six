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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.icon.six.constant.CommonConstant;
import com.icon.six.service.BoardService;
import com.icon.six.util.StringUtil;

@Controller
@RequestMapping("news")
public class NewsController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping(value = "newsStock.do")
	public ModelAndView newsStock(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("news/news_stock");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.NEWSSTOCK_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/news/newsStockView.do");
				mav.addObject("writePage","/news/newsStockWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;
	}
	
	@RequestMapping(value = "newsStockView.do")
	public ModelAndView newsStockView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("news/news_stock_view");
		
		requestMap.put("boardName", CommonConstant.NEWSSTOCK_BOARD);	
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
		
		mav.addObject("listPage","/news/newsStockView.do");
		mav.addObject("updateAction","/news/newsStockUpdate.do");
		mav.addObject("deleteAction","/news/newsStockDeleteProcess.do");
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		
		return mav;
	}
	
	@RequestMapping(value = "newsStockWrite.do")
	public ModelAndView newsStockWrite(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("news/news_stock_write");
		mav.addObject("listPage","/news/newsStockView.do");
		mav.addObject("insertAction","/news/newsStockWriteProcess.do");
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		
		return mav;
	}
	
	@RequestMapping(value = "newsStockUpdate.do")
	public ModelAndView newsStockUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("news/news_stock_write");
		
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.NEWSSTOCK_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/news/newsStockUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;		
	}
	
	@RequestMapping(value = "newsStockWriteProcess.do")
	public void newsStockWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.NEWSSTOCK_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/news/newsStock.do");
				} else {
					// TODO 에러페이지
					response.sendRedirect("/main/error.do");
				}
			} else {
				// TODO 에러페이지
				response.sendRedirect("/news/error.do");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "newsStockUpdateProcess.do")
	public void newsStockUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.NEWSSTOCK_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/news/newsStock.do");
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
	
	@RequestMapping(value = "newsStockDeleteProcess.do")
	public void newsStockDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.NEWSSTOCK_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/news/newsStock.do");
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
	
	@RequestMapping(value = "newsEtc.do")
	public ModelAndView newsEtc(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("news/news_etc");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.NEWSETC_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/news/newsEtcView.do");
				mav.addObject("writePage","/news/newsEtcWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;
	}
	
	@RequestMapping(value = "newsEtcView.do")
	public ModelAndView newsEtcView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("news/news_etc_view");
		
		requestMap.put("boardName", CommonConstant.NEWSETC_BOARD);	
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
		
		mav.addObject("listPage","/news/newsEtcView.do");
		mav.addObject("updateAction","/news/newsEtcUpdate.do");
		mav.addObject("deleteAction","/news/newsEtcDeleteProcess.do");
		
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;
	}
	
	@RequestMapping(value = "newsEtcWrite.do")
	public ModelAndView newsEtcWrite(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("news/news_etc_write");
		mav.addObject("listPage","/news/newsEtcView.do");
		mav.addObject("insertAction","/news/newsEtcWriteProcess.do");
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;
	}
	
	@RequestMapping(value = "newsEtcUpdate.do")
	public ModelAndView newsEtcUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("news/news_etc_write");
		
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.NEWSETC_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/news/newsEtcUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;		
	}
	
	@RequestMapping(value = "newsEtcWriteProcess.do")
	public void newsEtcWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.NEWSETC_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/news/newsEtc.do");
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
	
	@RequestMapping(value = "newsEtcUpdateProcess.do")
	public void newsEtcUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.NEWSETC_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/news/newsEtc.do");
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
	
	@RequestMapping(value = "newsEtcDeleteProcess.do")
	public void newsEtcDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.NEWSETC_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/news/newsEtc.do");
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
}
