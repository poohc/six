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
import com.icon.six.service.F1kService;

@Controller
@RequestMapping("f1k")
public class F1kController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private F1kService f1kService;
	
	@RequestMapping(value = "main.do")
	public ModelAndView main(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("f1k/index");
		logger.debug("requestMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.F1K_NOTICE_BOARD);
			Map<String, Object> boardInfo = f1kService.selectF1kBoardList(requestMap);
							
			mav.addObject("list",boardInfo.get("list"));
			mav.addObject("page",boardInfo.get("page"));
			mav.addObject("currentPage",requestMap.get("currentPage"));
			mav.addObject("viewPage","/f1k/f1kNoticeView.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		return mav;
	}	
		
	@RequestMapping(value = "f1kNoticeView.do")
	public ModelAndView f1kNoticeView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("f1k/index");
		
		try {
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		
		return mav;
	}
	
}
