package com.icon.six.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("info")
public class InfoController {
	
	@RequestMapping(value="infoFreeRec.do")
	public ModelAndView infoFreeRec(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/info/info_freeRec");
		return mav;
	}
	
	@RequestMapping(value="infoSecTech.do")
	public ModelAndView infoSecTech(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/info/info_secTech");
		return mav;
	}
	
	@RequestMapping(value="infoRealStock.do")
	public ModelAndView infoRealStock(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/info/info_realStock");
		return mav;
	}
	
	@RequestMapping(value="infoStockBriefing.do")
	public ModelAndView infoStockBriefing(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/info/info_stockBriefing");
		return mav;
	}
	
	@RequestMapping(value="infoGInterview.do")
	public ModelAndView infoGInterview(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/info/info_gInterview");
		return mav;
	}
	
}
