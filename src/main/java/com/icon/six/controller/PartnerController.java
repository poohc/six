package com.icon.six.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("partner")
public class PartnerController {
	
	@RequestMapping(value="partnerMain.do")
	public ModelAndView partnerMain(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/partner/partner_main");
		return mav;
	}
	
	@RequestMapping(value="partnerJoin.do")
	public ModelAndView partnerJoin(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/partner/partner_join");
		return mav;
	}
	
	@RequestMapping(value="partnerFreeInfo.do")
	public ModelAndView partnerFreeInfo(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/partner/partner_freeInfo");
		return mav;
	}
	
	@RequestMapping(value="partnerPayInfo.do")
	public ModelAndView partnerPayInfo(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/partner/partner_payInfo");
		return mav;
	}
	
	@RequestMapping(value="partnerView.do")
	public ModelAndView partnerView(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/partner/partner_view");
		return mav;
	}
}
