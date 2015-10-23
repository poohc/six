package com.icon.six.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("news")
public class NewsController {
	
	@RequestMapping(value="newsInvest.do")
	public ModelAndView newsInvest(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/news/news_invest");
		return mav;
	}
	
	@RequestMapping(value="newsEtc.do")
	public ModelAndView newsEtc(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/news/news_etc");
		return mav;
	}	
}
