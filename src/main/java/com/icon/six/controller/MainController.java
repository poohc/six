package com.icon.six.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("main")
public class MainController {
	
	@RequestMapping(value = "main.do")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/main");
		
		return mav;
	}
	
	@RequestMapping(value = "intro.do")
	public ModelAndView intro(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("introduce/intro_six");
		
		return mav;
	}
	
	@RequestMapping(value = "notice.do")
	public ModelAndView notice(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("introduce/notice_list");
		
		return mav;
	}
	
}
