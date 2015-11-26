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
@RequestMapping("community")
public class CommunityController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping(value="communityFreeboard.do")
	public ModelAndView communityFreeboard(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("community/community_freeboard");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.COMMFREEBOARD_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/community/communityFreeboardView.do");
				mav.addObject("writePage","/community/communityFreeboardWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;
	}
	
	@RequestMapping(value = "communityFreeboardView.do")
	public ModelAndView communityFreeboardView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("community/community_freeboard_view");
		
		requestMap.put("boardName", CommonConstant.COMMFREEBOARD_BOARD);	
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
		
		mav.addObject("listPage","/community/communityFreeboard.do");
		mav.addObject("updateAction","/community/communityFreeboardUpdate.do");
		mav.addObject("deleteAction","/community/communityFreeboardDeleteProcess.do");
		mav.addObject("replyAddAction","/community/communityFreeboardReplyAdd.do");
		mav.addObject("replyUpdAction","/community/communityFreeboardReplyDel.do");
		mav.addObject("replyDelAction","/community/communityFreeboardReplyUpdate.do");
		
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;
	}
	
	@RequestMapping(value="communityFreeboardWrite.do")
	public ModelAndView communityFreeboardWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("community/community_freeboard_write");
		mav.addObject("listPage","/community/communityFreeboard.do");
		mav.addObject("insertAction","/community/communityFreeboardWriteProcess.do");
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;
	}
	
	@RequestMapping(value="communityFreeboardUpdate.do")
	public ModelAndView communityFreeboardUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("community/community_freeboard_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.COMMFREEBOARD_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/community/communityFreeboardUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;
	}	
	
	@RequestMapping(value="communityFreeboardWriteProcess.do")
	public void communityFreeboardWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.COMMFREEBOARD_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/community/communityFreeboard.do");
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
	
	@RequestMapping(value="communityFreeboardUpdateProcess.do")
	public void communityFreeboardUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.COMMFREEBOARD_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/community/communityFreeboard.do");
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
	
	@RequestMapping(value="communityFreeboardDeleteProcess.do")
	public void communityFreeboardDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.COMMFREEBOARD_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/community/communityFreeboard.do");
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
	
	@RequestMapping(value = "communityFreeboardReplyAdd.do")
	public ModelAndView communityFreeboardReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.COMMFREEBOARD_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/community/communityFreeboardView.do");
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
	
	@RequestMapping(value = "communityFreeboardReplyDel.do")
	public ModelAndView communityFreeboardReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.COMMFREEBOARD_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/community/communityFreeboardView.do");
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
	
	@RequestMapping(value = "communityFreeboardReplyUpdate.do")
	public ModelAndView communityFreeboardReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.COMMFREEBOARD_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/community/communityFreeboardView.do");
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
	
	@RequestMapping(value="communityDiscussion.do")
	public ModelAndView communityDiscussion(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("community/community_discussion");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.COMMDISCUSSION_BOARD);
				requestMap.put("stockName", "stockName");
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/community/communityDiscussionView.do");
				mav.addObject("writePage","/community/communityDiscussionWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;
	}
	
	@RequestMapping(value = "communityDiscussionView.do")
	public ModelAndView communityDiscussionView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("community/community_discussion_view");
		
		requestMap.put("boardName", CommonConstant.COMMDISCUSSION_BOARD);	
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
		
		mav.addObject("listPage","/community/communityDiscussion.do");
		mav.addObject("updateAction","/community/communityDiscussionUpdate.do");
		mav.addObject("deleteAction","/community/communityDiscussionDeleteProcess.do");
		mav.addObject("replyAddAction","/community/communityDiscussionReplyAdd.do");
		mav.addObject("replyUpdAction","/community/communityDiscussionReplyDel.do");
		mav.addObject("replyDelAction","/community/communityDiscussionReplyUpdate.do");
		
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;
	}
	
	@RequestMapping(value="communityDiscussionWrite.do")
	public ModelAndView communityDiscussionWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("community/community_discussion_write");
		mav.addObject("listPage","/community/communityDiscussion.do");
		mav.addObject("insertAction","/community/communityDiscussionWriteProcess.do");
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;
	}
	
	@RequestMapping(value="communityDiscussionUpdate.do")
	public ModelAndView communityDiscussionUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("community/community_discussion_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.COMMDISCUSSION_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/community/communityDiscussionUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;
	}	
	
	@RequestMapping(value="communityDiscussionWriteProcess.do")
	public void communityDiscussionWriteProcess(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		logger.info("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.COMMDISCUSSION_BOARD);
				requestMap.put("stockName", "stockName");
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/community/communityDiscussion.do");
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
	
	@RequestMapping(value="communityDiscussionUpdateProcess.do")
	public void communityDiscussionUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.COMMDISCUSSION_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/community/communityDiscussion.do");
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
	
	@RequestMapping(value="communityDiscussionDeleteProcess.do")
	public void communityDiscussionDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.COMMDISCUSSION_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/community/communityDiscussion.do");
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
	
	@RequestMapping(value = "communityDiscussionReplyAdd.do")
	public ModelAndView communityDiscussionReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.COMMDISCUSSION_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/community/communityDiscussionView.do");
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
	
	@RequestMapping(value = "communityDiscussionReplyDel.do")
	public ModelAndView communityDiscussionReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.COMMDISCUSSION_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/community/communityDiscussionView.do");
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
	
	@RequestMapping(value = "communityDiscussionReplyUpdate.do")
	public ModelAndView communityDiscussionReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.COMMDISCUSSION_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/community/communityDiscussionView.do");
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
	
	@RequestMapping(value="communityReview.do")
	public ModelAndView communityReview(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("community/community_review");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.COMMREVIEW_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/community/communityReviewView.do");
				mav.addObject("writePage","/community/communityReviewWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;
	}
	
	@RequestMapping(value = "communityReviewView.do")
	public ModelAndView communityReviewView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("community/community_review_view");
		
		requestMap.put("boardName", CommonConstant.COMMREVIEW_BOARD);	
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
		
		mav.addObject("listPage","/community/communityReview.do");
		mav.addObject("updateAction","/community/communityReviewUpdate.do");
		mav.addObject("deleteAction","/community/communityReviewDeleteProcess.do");
		mav.addObject("replyAddAction","/community/communityReviewReplyAdd.do");
		mav.addObject("replyUpdAction","/community/communityReviewReplyDel.do");
		mav.addObject("replyDelAction","/community/communityReviewReplyUpdate.do");
		
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;
	}
	
	@RequestMapping(value="communityReviewWrite.do")
	public ModelAndView communityReviewWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("community/community_review_write");
		mav.addObject("listPage","/community/communityReview.do");
		mav.addObject("insertAction","/community/communityReviewWriteProcess.do");
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;
	}
	
	@RequestMapping(value="communityReviewUpdate.do")
	public ModelAndView communityReviewUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("community/community_review_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.COMMREVIEW_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/community/communityReviewUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;
	}	
	
	@RequestMapping(value="communityReviewWriteProcess.do")
	public void communityReviewWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.COMMREVIEW_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/community/communityReview.do");
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
	
	@RequestMapping(value="communityReviewUpdateProcess.do")
	public void communityReviewUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.COMMREVIEW_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/community/communityReview.do");
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
	
	@RequestMapping(value="communityReviewDeleteProcess.do")
	public void communityReviewDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.COMMREVIEW_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/community/communityReview.do");
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
	
	@RequestMapping(value = "communityReviewReplyAdd.do")
	public ModelAndView communityReviewReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.COMMREVIEW_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/community/communityReviewView.do");
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
	
	@RequestMapping(value = "communityReviewReplyDel.do")
	public ModelAndView communityReviewReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.COMMREVIEW_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/community/communityReviewView.do");
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
	
	@RequestMapping(value = "communityReviewReplyUpdate.do")
	public ModelAndView communityReviewReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.COMMREVIEW_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/community/communityReviewView.do");
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
	
	@RequestMapping(value="communitySpeical.do")
	public ModelAndView community_speical(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("community/community_speical");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.COMMSPEICAL_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/community/communitySpeicalView.do");
				mav.addObject("writePage","/community/communitySpeicalWrite.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;
	}
	
	@RequestMapping(value = "communitySpeicalView.do")
	public ModelAndView community_speicalView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("community/community_speical_view");
		
		requestMap.put("boardName", CommonConstant.COMMSPEICAL_BOARD);	
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
		
		mav.addObject("listPage","/community/community_speical.do");
		mav.addObject("updateAction","/community/communitySpeicalUpdate.do");
		mav.addObject("deleteAction","/community/communitySpeicalDeleteProcess.do");
		mav.addObject("replyAddAction","/community/communitySpeicalReplyAdd.do");
		mav.addObject("replyUpdAction","/community/communitySpeicalReplyDel.do");
		mav.addObject("replyDelAction","/community/communitySpeicalReplyUpdate.do");
		
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;
	}
	
	@RequestMapping(value="communitySpeicalWrite.do")
	public ModelAndView community_speicalWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("community/community_speical_write");
		mav.addObject("listPage","/community/communitySpeical.do");
		mav.addObject("insertAction","/community/communitySpeicalWriteProcess.do");
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;
	}
	
	@RequestMapping(value="communitySpeicalUpdate.do")
	public ModelAndView community_speicalUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("community/community_speical_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.COMMSPEICAL_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/community/communitySpeicalUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		return mav;
	}	
	
	@RequestMapping(value="communitySpeicalWriteProcess.do")
	public void community_speicalWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.COMMSPEICAL_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/community/communitySpeical.do");
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
	
	@RequestMapping(value="communitySpeicalUpdateProcess.do")
	public void community_speicalUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.COMMSPEICAL_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/community/communitySpeical.do");
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
	
	@RequestMapping(value="communitySpeicalDeleteProcess.do")
	public void community_speicalDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.COMMSPEICAL_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/community/communitySpeical.do");
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
	
	@RequestMapping(value = "communitySpeicalReplyAdd.do")
	public ModelAndView community_speicalReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.COMMSPEICAL_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/community/communitySpeicalView.do");
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
	
	@RequestMapping(value = "communitySpeicalReplyDel.do")
	public ModelAndView community_speicalReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.COMMSPEICAL_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/community/communitySpeicalView.do");
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
	
	@RequestMapping(value = "communitySpeicalReplyUpdate.do")
	public ModelAndView community_speicalReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.COMMSPEICAL_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/community/communitySpeicalView.do");
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
