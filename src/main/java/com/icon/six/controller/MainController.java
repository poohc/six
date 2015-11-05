package com.icon.six.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icon.six.constant.CommonConstant;
import com.icon.six.service.BoardService;
import com.icon.six.util.StringUtil;
import com.icon.six.vo.BoardVo;

@Controller
@RequestMapping("main")
public class MainController {
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping(value = "main.do")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/main");
		
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
		
		System.out.println("requestMap : " + requestMap);
		
		try {
				if(requestMap.get("currentPage")==null){
					requestMap.put("currentPage", "1");
				}
				
				if(requestMap.get("searchText")!=null){
					if("title".equals(requestMap.get("searchOption"))){
						requestMap.put("title", requestMap.get("searchText"));
					} else if("contents".equals(requestMap.get("searchOption"))){
						requestMap.put("contents", requestMap.get("searchText"));
					}
				}
				requestMap.put("boardName", CommonConstant.INTRO_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
				mav.addObject("list",boardInfo.get("list"));
				
				System.out.println(boardInfo.get("page"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/main/introNoticeView.do");
				mav.addObject("listPage","/main/introNotice.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "introNoticeView.do")
	public ModelAndView introNoticeView(@RequestParam Map<String, String> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("introduce/notice_view");
		String seq = StringUtils.defaultIfEmpty(requestMap.get("seq"), ""); 
		
		if(!"".equals(seq)){
			BoardVo paramVo = new BoardVo();
			paramVo.setHitCount("1");
			paramVo.setSeq(seq);
			paramVo.setUpdateUserId(SecurityContextHolder.getContext().getAuthentication().getName());
			paramVo.setBoardName(CommonConstant.INTRO_BOARD);
			boardService.updateBoard(paramVo);
			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("boardName", CommonConstant.INTRO_BOARD);
			paramMap.put("seq",seq);
					
			Map<String, Object> boardInfo = boardService.getBoardInfo(paramMap);
			mav.addObject("boardInfo",boardInfo);
			
		} else {
			//TODO 에러처리
		}
		return mav;
	}
	
	@RequestMapping(value = "introNoticeWrite.do")
	public ModelAndView introNoticeWrite(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("introduce/intro_notice_write");
		mav.addObject("insertAction","/main/introNoticeWriteProcess.do");
		return mav;
	}
	
	@RequestMapping(value = "introNoticeUpdate.do")
	public ModelAndView introNoticeUpdate(@RequestParam Map<String, String> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("introduce/intro_notice_write");
		
		String seq = StringUtils.defaultIfEmpty(requestMap.get("seq"), ""); 
		
		System.out.println("requetsMap : " + requestMap);
		
		if(!"".equals(seq)){
			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("boardName", CommonConstant.INTRO_BOARD);
			paramMap.put("seq",seq);
			
			Map<String, Object> boardInfo = boardService.getBoardInfo(paramMap);
			mav.addObject("boardInfo",boardInfo);
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/main/introNoticeUpdateProcess.do");
		} else {
			//TODO 에러처리
		}
		return mav;		
	}
	
	@RequestMapping(value = "introNoticeWriteProcess.do")
	public void introNoticeWriteProcess(@RequestParam Map<String, String> requestMap, HttpServletRequest request, HttpServletResponse response){
		try {
			
			System.out.println("requestMap : " + requestMap);
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, String>) requestMap))){
				
				int result = 0;
				
				BoardVo paramVo = new BoardVo();
				
				paramVo.setTitle(requestMap.get("title"));
				paramVo.setContents(requestMap.get("smarteditor"));
				paramVo.setCreateUserId(SecurityContextHolder.getContext().getAuthentication().getName());
				paramVo.setBoardName(CommonConstant.INTRO_BOARD);
				
				if("notice".equals(requestMap.get("chkNotice"))){
					paramVo.setIsNotice("T");
				} else if("normal".equals(requestMap.get("chkNotice"))){
					paramVo.setIsNotice("F");
				}
				
				result = boardService.insertBoard(paramVo);
				
				if(result == 0){
					// 에러 페이지 처리
				}
				
			} else {
				// 에러 페이지 처리
			}
			response.sendRedirect("/main/introNotice.do");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "introNoticeUpdateProcess.do")
	public void introNoticeUpdateProcess(@RequestParam Map<String, String> requestMap, HttpServletResponse response){
		
		try{
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, String>) requestMap))){
				
				int result = 0;
				
				BoardVo paramVo = new BoardVo();
				
				paramVo.setSeq(requestMap.get("seq"));
				
				if(!"".equals(StringUtils.defaultIfEmpty(requestMap.get("title"), ""))){
					paramVo.setTitle(requestMap.get("title"));
				}
				if(!"".equals(StringUtils.defaultIfEmpty(requestMap.get("smarteditor"), ""))){
					paramVo.setContents(requestMap.get("smarteditor"));
				}
				if(!"".equals(StringUtils.defaultIfEmpty(requestMap.get("hitCount"), ""))){
					paramVo.setHitCount(requestMap.get("hitCount"));
				}
				paramVo.setBoardName(CommonConstant.INTRO_BOARD);
				paramVo.setUpdateUserId(SecurityContextHolder.getContext().getAuthentication().getName());
				result = boardService.updateBoard(paramVo);
				
				if(result == 0){
					// 에러 페이지 처리
				}
				
			} else {
				// 에러 페이지 처리
			}
			response.sendRedirect("/main/introNotice.do");
			
		} catch (IOException e) {
			// TODO 에러 페이지 처리
			
		}	
	}
	
	@RequestMapping(value = "introNoticeDeleteProcess.do")
	public void introNoticeDeleteProcess(HttpServletRequest request, HttpServletResponse response){
		try {
			
			String seq = StringUtils.defaultIfEmpty(request.getParameter("seq"), "");
			
			if(!"".equals(seq)){
				
				Map<String, Object> paramMap = new HashMap<String, Object>();
				paramMap.put("boardName", CommonConstant.INTRO_BOARD);
				paramMap.put("seq",seq);
				
				boardService.deleteBoard(paramMap);
				
			} else {
				// TODO: 에러 페이지 처리
			}
			response.sendRedirect("/main/introNotice.do");
		} catch (Exception e) {
			// TODO: 에러 페이지 처리
		}
		
	}
	
	@RequestMapping(value = "introHowToPay.do")
	public ModelAndView introHowToPay(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("introduce/intro_howTopay");
		
		return mav;
	}
	
	@RequestMapping(value = "introQna.do")
	public ModelAndView introQna(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("introduce/intro_qna");
		System.out.println("requestMap : " + requestMap);
		
		try {
				if(requestMap.get("currentPage")==null){
					requestMap.put("currentPage", "1");
				}
				
				if(requestMap.get("searchText")!=null){
					if("title".equals(requestMap.get("searchOption"))){
						requestMap.put("title", requestMap.get("searchText"));
					} else if("contents".equals(requestMap.get("searchOption"))){
						requestMap.put("contents", requestMap.get("searchText"));
					}
				}
				requestMap.put("boardName", CommonConstant.CUSTQNA_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
				mav.addObject("list",boardInfo.get("list"));
				
				System.out.println(boardInfo.get("page"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		return mav;
	}
}
