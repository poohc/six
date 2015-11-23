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
@RequestMapping("market")
public class MarketController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping(value="marketMain.do")
	public ModelAndView marketMain(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("market/market_main");
		
		return mav;
	}
	
	@RequestMapping(value="marketFree.do")
	public ModelAndView marketFree(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("market/market_free");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.MARKETFREE_BOARD);
				Map<String, Object> boardInfo = boardService.selectMarketBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/market/marketFreeView.do");
				mav.addObject("writePage","/market/marketFreeWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "marketFreeView.do")
	public ModelAndView marketFreeView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("market/market_free_view");
		
		requestMap.put("boardName", CommonConstant.MARKETFREE_BOARD);	
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
		
		mav.addObject("listPage","/market/marketFree.do");
		mav.addObject("updateAction","/market/marketFreeUpdate.do");
		mav.addObject("deleteAction","/market/marketFreeDeleteProcess.do");
		mav.addObject("replyAddAction","/market/marketFreeReplyAdd.do");
		mav.addObject("replyDelAction","/market/marketFreeReplyDel.do");
		mav.addObject("replyUpdAction","/market/marketFreeReplyUpdate.do");
		
		return mav;
	}
	
	@RequestMapping(value="marketFreeWrite.do")
	public ModelAndView marketFreeWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("market/market_free_write");
		mav.addObject("listPage","/market/marketFree.do");
		mav.addObject("insertAction","/market/marketFreeWriteProcess.do");
		
		return mav;
	}
	
	@RequestMapping(value="marketFreeUpdate.do")
	public ModelAndView marketFreeUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("market/market_free_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.MARKETFREE_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/market/marketFreeUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		
		return mav;
	}	
	
	@RequestMapping(value="marketFreeWriteProcess.do")
	public void marketFreeWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.MARKETFREE_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/market/marketFree.do");
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
	
	@RequestMapping(value="marketFreeUpdateProcess.do")
	public void marketFreeUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.MARKETFREE_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/market/marketFree.do");
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
	
	@RequestMapping(value="marketFreeDeleteProcess.do")
	public void marketFreeDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.MARKETFREE_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/market/marketFree.do");
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
	
	@RequestMapping(value = "marketFreeReplyAdd.do")
	public ModelAndView marketFreeReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.MARKETFREE_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/market/marketFreeView.do");
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
	
	@RequestMapping(value = "marketFreeReplyDel.do")
	public ModelAndView marketFreeReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.MARKETFREE_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/market/marketFreeView.do");
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
	
	@RequestMapping(value = "marketFreeReplyUpdate.do")
	public ModelAndView marketFreeReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.MARKETFREE_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/market/marketFreeView.do");
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
	
	@RequestMapping(value="marketIstrategy.do")
	public ModelAndView marketIstrategy(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("market/market_istrategy");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.MARKETISTRATEGY_BOARD);
				Map<String, Object> boardInfo = boardService.selectMarketBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/market/marketIstrategyView.do");
				mav.addObject("writePage","/market/marketIstrategyWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "marketIstrategyView.do")
	public ModelAndView marketIstrategyView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("market/market_istrategy_view");
		
		requestMap.put("boardName", CommonConstant.MARKETISTRATEGY_BOARD);	
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
		
		mav.addObject("listPage","/market/marketIstrategy.do");
		mav.addObject("updateAction","/market/marketIstrategyUpdate.do");
		mav.addObject("deleteAction","/market/marketIstrategyDeleteProcess.do");
		mav.addObject("replyAddAction","/market/marketIstrategyReplyAdd.do");
		mav.addObject("replyDelAction","/market/marketIstrategyReplyDel.do");
		mav.addObject("replyUpdAction","/market/marketIstrategyReplyUpdate.do");
		
		return mav;
	}
	
	@RequestMapping(value="marketIstrategyWrite.do")
	public ModelAndView marketIstrategyWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("market/market_istrategy_write");
		mav.addObject("listPage","/market/marketIstrategy.do");
		mav.addObject("insertAction","/market/marketIstrategyWriteProcess.do");
		
		return mav;
	}
	
	@RequestMapping(value="marketIstrategyUpdate.do")
	public ModelAndView marketIstrategyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("market/market_istrategy_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.MARKETISTRATEGY_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/market/marketIstrategyUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		
		return mav;
	}	
	
	@RequestMapping(value="marketIstrategyWriteProcess.do")
	public void marketIstrategyWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.MARKETISTRATEGY_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/market/marketIstrategy.do");
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
	
	@RequestMapping(value="marketIstrategyUpdateProcess.do")
	public void marketIstrategyUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.MARKETISTRATEGY_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/market/marketIstrategy.do");
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
	
	@RequestMapping(value="marketIstrategyDeleteProcess.do")
	public void marketIstrategyDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.MARKETISTRATEGY_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/market/marketIstrategy.do");
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
	
	@RequestMapping(value = "marketIstrategyReplyAdd.do")
	public ModelAndView marketIstrategyReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.MARKETISTRATEGY_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/market/marketIstrategyView.do");
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
	
	@RequestMapping(value = "marketIstrategyReplyDel.do")
	public ModelAndView marketIstrategyReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.MARKETISTRATEGY_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/market/marketIstrategyView.do");
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
	
	@RequestMapping(value = "marketIstrategyReplyUpdate.do")
	public ModelAndView marketIstrategyReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.MARKETISTRATEGY_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/market/marketIstrategyView.do");
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
	
	@RequestMapping(value="marketAnalysis.do")
	public ModelAndView marketAnalysis(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("market/market_analysis");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.MARKETANALYSIS_BOARD);
				Map<String, Object> boardInfo = boardService.selectMarketBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/market/marketAnalysisView.do");
				mav.addObject("writePage","/market/marketAnalysisWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "marketAnalysisView.do")
	public ModelAndView marketAnalysisView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("market/market_analysis_view");
		
		requestMap.put("boardName", CommonConstant.MARKETANALYSIS_BOARD);	
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
		
		mav.addObject("listPage","/market/marketAnalysis.do");
		mav.addObject("updateAction","/market/marketAnalysisUpdate.do");
		mav.addObject("deleteAction","/market/marketAnalysisDeleteProcess.do");
		mav.addObject("replyAddAction","/market/marketAnalysisReplyAdd.do");
		mav.addObject("replyDelAction","/market/marketAnalysisReplyDel.do");
		mav.addObject("replyUpdAction","/market/marketAnalysisReplyUpdate.do");
		
		return mav;
	}
	
	@RequestMapping(value="marketAnalysisWrite.do")
	public ModelAndView marketAnalysisWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("market/market_analysis_write");
		mav.addObject("listPage","/market/marketAnalysis.do");
		mav.addObject("insertAction","/market/marketAnalysisWriteProcess.do");
		
		return mav;
	}
	
	@RequestMapping(value="marketAnalysisUpdate.do")
	public ModelAndView marketAnalysisUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("market/market_analysis_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.MARKETANALYSIS_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/market/marketAnalysisUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		
		return mav;
	}	
	
	@RequestMapping(value="marketAnalysisWriteProcess.do")
	public void marketAnalysisWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.MARKETANALYSIS_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/market/marketAnalysis.do");
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
	
	@RequestMapping(value="marketAnalysisUpdateProcess.do")
	public void marketAnalysisUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.MARKETANALYSIS_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/market/marketAnalysis.do");
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
	
	@RequestMapping(value="marketAnalysisDeleteProcess.do")
	public void marketAnalysisDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.MARKETANALYSIS_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/market/marketAnalysis.do");
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
	
	@RequestMapping(value = "marketAnalysisReplyAdd.do")
	public ModelAndView marketAnalysisReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.MARKETANALYSIS_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/market/marketAnalysisView.do");
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
	
	@RequestMapping(value = "marketAnalysisReplyDel.do")
	public ModelAndView marketAnalysisReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.MARKETANALYSIS_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/market/marketAnalysisView.do");
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
	
	@RequestMapping(value = "marketAnalysisReplyUpdate.do")
	public ModelAndView marketAnalysisReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.MARKETANALYSIS_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/market/marketAnalysisView.do");
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
	
	@RequestMapping(value="marketPay.do")
	public ModelAndView marketPay(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("market/market_pay");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.MARKETPAY_BOARD);
				Map<String, Object> boardInfo = boardService.selectMarketBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/market/marketPayView.do");
				mav.addObject("writePage","/market/marketPayWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "marketPayView.do")
	public ModelAndView marketPayView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("market/market_pay_view");
		
		requestMap.put("boardName", CommonConstant.MARKETPAY_BOARD);	
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
		
		mav.addObject("listPage","/market/marketPay.do");
		mav.addObject("updateAction","/market/marketPayUpdate.do");
		mav.addObject("deleteAction","/market/marketPayDeleteProcess.do");
		mav.addObject("replyAddAction","/market/marketPayReplyAdd.do");
		mav.addObject("replyDelAction","/market/marketPayReplyDel.do");
		mav.addObject("replyUpdAction","/market/marketPayReplyUpdate.do");
		
		return mav;
	}
	
	@RequestMapping(value="marketPayWrite.do")
	public ModelAndView marketPayWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("market/market_pay_write");
		mav.addObject("listPage","/market/marketPay.do");
		mav.addObject("insertAction","/market/marketPayWriteProcess.do");
		
		return mav;
	}
	
	@RequestMapping(value="marketPayUpdate.do")
	public ModelAndView marketPayUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("market/market_pay_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.MARKETPAY_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/market/marketPayUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		
		return mav;
	}	
	
	@RequestMapping(value="marketPayWriteProcess.do")
	public void marketPayWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.MARKETPAY_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/market/marketPay.do");
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
	
	@RequestMapping(value="marketPayUpdateProcess.do")
	public void marketPayUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.MARKETPAY_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/market/marketPay.do");
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
	
	@RequestMapping(value="marketPayDeleteProcess.do")
	public void marketPayDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.MARKETPAY_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/market/marketPay.do");
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
	
	@RequestMapping(value = "marketPayReplyAdd.do")
	public ModelAndView marketPayReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.MARKETPAY_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/market/marketPayView.do");
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
	
	@RequestMapping(value = "marketPayReplyDel.do")
	public ModelAndView marketPayReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.MARKETPAY_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/market/marketPayView.do");
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
	
	@RequestMapping(value = "marketPayReplyUpdate.do")
	public ModelAndView marketPayReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.MARKETPAY_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/market/marketPayView.do");
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
	
	@RequestMapping(value="marketBargain.do")
	public ModelAndView marketBargain(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("market/market_bargain");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.MARKETBARGAIN_BOARD);
				Map<String, Object> boardInfo = boardService.selectMarketBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/market/marketBargainView.do");
				mav.addObject("writePage","/market/marketBargainWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "marketBargainView.do")
	public ModelAndView marketBargainView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("market/market_lcenter_view");
		
		requestMap.put("boardName", CommonConstant.MARKETBARGAIN_BOARD);	
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
		
		mav.addObject("listPage","/market/marketBargain.do");
		mav.addObject("updateAction","/market/marketBargainUpdate.do");
		mav.addObject("deleteAction","/market/marketBargainDeleteProcess.do");
		mav.addObject("replyAddAction","/market/marketBargainReplyAdd.do");
		mav.addObject("replyDelAction","/market/marketBargainReplyDel.do");
		mav.addObject("replyUpdAction","/market/marketBargainReplyUpdate.do");
		
		return mav;
	}
	
	@RequestMapping(value="marketBargainWrite.do")
	public ModelAndView marketBargainWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("market/market_lcenter_write");
		mav.addObject("listPage","/market/marketBargain.do");
		mav.addObject("insertAction","/market/marketBargainWriteProcess.do");
		
		return mav;
	}
	
	@RequestMapping(value="marketBargainUpdate.do")
	public ModelAndView marketBargainUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("market/market_lcenter_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.MARKETBARGAIN_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/market/marketBargainUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		
		return mav;
	}	
	
	@RequestMapping(value="marketBargainWriteProcess.do")
	public void marketBargainWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.MARKETBARGAIN_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/market/marketBargain.do");
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
	
	@RequestMapping(value="marketBargainUpdateProcess.do")
	public void marketBargainUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.MARKETBARGAIN_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/market/marketBargain.do");
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
	
	@RequestMapping(value="marketBargainDeleteProcess.do")
	public void marketBargainDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.MARKETBARGAIN_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/market/marketBargain.do");
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
	
	@RequestMapping(value = "marketBargainReplyAdd.do")
	public ModelAndView marketBargainReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.MARKETBARGAIN_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/market/marketBargainView.do");
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
	
	@RequestMapping(value = "marketBargainReplyDel.do")
	public ModelAndView marketBargainReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.MARKETBARGAIN_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/market/marketBargainView.do");
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
	
	@RequestMapping(value = "marketBargainReplyUpdate.do")
	public ModelAndView marketBargainReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.MARKETBARGAIN_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/market/marketBargainView.do");
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
	
	@RequestMapping(value="marketAdv.do")
	public ModelAndView marketAdv(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("market/market_adv");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.MARKETADV_BOARD);
				Map<String, Object> boardInfo = boardService.selectMarketBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/market/marketAdvView.do");
				mav.addObject("writePage","/market/marketAdvWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "marketAdvView.do")
	public ModelAndView marketAdvView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("market/market_lcenter_view");
		
		requestMap.put("boardName", CommonConstant.MARKETADV_BOARD);	
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
		
		mav.addObject("listPage","/market/marketAdv.do");
		mav.addObject("updateAction","/market/marketAdvUpdate.do");
		mav.addObject("deleteAction","/market/marketAdvDeleteProcess.do");
		mav.addObject("replyAddAction","/market/marketAdvReplyAdd.do");
		mav.addObject("replyDelAction","/market/marketAdvReplyDel.do");
		mav.addObject("replyUpdAction","/market/marketAdvReplyUpdate.do");
		
		return mav;
	}
	
	@RequestMapping(value="marketAdvWrite.do")
	public ModelAndView marketAdvWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("market/market_lcenter_write");
		mav.addObject("listPage","/market/marketAdv.do");
		mav.addObject("insertAction","/market/marketAdvWriteProcess.do");
		
		return mav;
	}
	
	@RequestMapping(value="marketAdvUpdate.do")
	public ModelAndView marketAdvUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("market/market_lcenter_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.MARKETADV_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/market/marketAdvUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		
		return mav;
	}	
	
	@RequestMapping(value="marketAdvWriteProcess.do")
	public void marketAdvWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.MARKETADV_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/market/marketAdv.do");
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
	
	@RequestMapping(value="marketAdvUpdateProcess.do")
	public void marketAdvUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.MARKETADV_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/market/marketAdv.do");
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
	
	@RequestMapping(value="marketAdvDeleteProcess.do")
	public void marketAdvDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.MARKETADV_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/market/marketAdv.do");
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
	
	@RequestMapping(value = "marketAdvReplyAdd.do")
	public ModelAndView marketAdvReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.MARKETADV_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/market/marketAdvView.do");
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
	
	@RequestMapping(value = "marketAdvReplyDel.do")
	public ModelAndView marketAdvReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.MARKETADV_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/market/marketAdvView.do");
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
	
	@RequestMapping(value = "marketAdvReplyUpdate.do")
	public ModelAndView marketAdvReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.MARKETADV_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/market/marketAdvView.do");
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
