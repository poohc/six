package com.icon.six.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icon.six.service.BoardService;
import com.icon.six.util.StringUtil;
import com.icon.six.vo.IntroBoardVo;

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
		
		try {
				if(requestMap.get("currentPage")==null){
					requestMap.put("currentPage", "1");
				}
				
				Map<String, Object> boardInfo = boardService.selectIntroBoardList(requestMap);
				mav.addObject("list",boardInfo.get("list"));
				
				System.out.println(boardInfo.get("page"));
				mav.addObject("page",boardInfo.get("page"));
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "introNoticeWrite.do")
	public ModelAndView introNoticeWrite(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("introduce/intro_notice_write");
		
		return mav;
	}
	
	@RequestMapping(value = "introNoticeWriteProcess.do")
	public ModelAndView introNoticeWriteProcess(@RequestParam Map<String, String> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("introduce/intro_notice");
		
		if("NotNull".equals(StringUtil.nullCheckMap((HashMap) requestMap))){
			
			int result = 0;
			
			IntroBoardVo paramVo = new IntroBoardVo();
			
			paramVo.setTitle(requestMap.get("title"));
			paramVo.setContents(requestMap.get("daumeditor"));
			paramVo.setCreateUserId("test");
			
			result = boardService.insertIntroBoard(paramVo);
			
			if(result == 0){
				// 에러 페이지 처리
			}
			
		} else {
			// 에러 페이지 처리
		}
		return mav;
	}
	
}
