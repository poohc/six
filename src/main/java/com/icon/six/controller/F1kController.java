package com.icon.six.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icon.six.constant.CommonConstant;
import com.icon.six.service.BoardService;
import com.icon.six.service.F1kService;

@Controller
@RequestMapping("f1k")
public class F1kController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private F1kService f1kService;
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping(value = "main.do")
	public ModelAndView main(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("f1k/index");
		logger.info(">>>>>>>>>>>>>>> requestMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.F1K_NOTICE_BOARD);
			Map<String, Object> boardInfo = f1kService.selectF1kBoardList(requestMap);
							
			mav.addObject("list",boardInfo.get("list"));			
			mav.addObject("counselingPage","/f1k/counselingProcess.do");
			mav.addObject("viewPage","/f1k/f1kNoticeView.do");
			
			System.out.println("<<<<<<<<<<<<<<" + String.valueOf(requestMap.get("etc")) + ">>>>>>>>>>>>>>>>");
			
			if(!"null".equals(String.valueOf(requestMap.get("etc")))){
				System.out.println("일루 왔나?? ? ?!@#");
				mav.addObject("etc",String.valueOf(requestMap.get("etc")));
			}
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		return mav;
	}	
	
	@RequestMapping(value = "f1kNoticeList.do")
	public ModelAndView f1kNoticeList(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("f1k/sub5_list");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.F1K_NOTICE_BOARD);
				Map<String, Object> boardInfo = f1kService.selectF1kBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("listPage","/f1k/f1kNoticeList.do");
				mav.addObject("viewPage","/f1k/f1kNoticeView.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("F1K 공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "f1kNoticeView.do")
	public ModelAndView f1kNoticeView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("f1k/sub5_view");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.F1K_NOTICE_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardViewInfo(requestMap);
								
				mav.addObject("boardInfo",boardInfo.get("boardInfo"));
				mav.addObject("fileList",boardInfo.get("fileList"));
				mav.addObject("listPage","/f1k/f1kNoticeList.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("F1K 공지사항 상세내역 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "f1kSub1.do")
	public ModelAndView f1kSub1(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("f1k/sub1");
		return mav;
	}
	
	@RequestMapping(value = "f1kSub2.do")
	public ModelAndView f1kSub2(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("f1k/sub2");
		return mav;
	}
	
	@RequestMapping(value = "f1kSub3.do")
	public ModelAndView f1kSub3(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("f1k/sub3");
		return mav;
	}
	
	@RequestMapping(value = "f1kSub4.do")
	public ModelAndView f1kSub4(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("f1k/sub4");
		return mav;
	}	
	
	@RequestMapping(value = "counselingProcess.do")
	public ModelAndView counselingProcess(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		String msg = "";
		int result = 0;
		logger.info("requestMap : " + requestMap);
		
		try {
			result = f1kService.insertF1kCounseling(requestMap);
			if(result == 1){
				msg = "상담이 신청되었습니다.";
			} else {
				msg = "상담 신청에 문제가 발생했습니다. 관리자에게 문의해 주세요.";
			}
			
		} catch (Exception e) {
			// TODO: 에러처리
			msg = "상담 신청에 문제가 발생했습니다. 관리자에게 문의해 주세요.";
		}
		
		mav.addObject("msg",msg);
		mav.addObject("page","/f1k/main.do");
		mav.addObject("etc","popup");
		
		return mav;
	}	
	
	
}
