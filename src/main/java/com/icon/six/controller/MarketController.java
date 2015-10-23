package com.icon.six.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("market")
public class MarketController {
	
	@RequestMapping(value="marketMain.do")
	public ModelAndView marketMain(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/market/market_main");
		return mav;
	}
	
	@RequestMapping(value="marketFree.do")
	public ModelAndView marketFree(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/market/market_free");
		return mav;
	}
	
	@RequestMapping(value="marketIstrategy.do")
	public ModelAndView marketIstrategy(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/market/market_istrategy");
		return mav;
	}
	
	@RequestMapping(value="marketAnalysis.do")
	public ModelAndView marketAnalysis(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/market/market_analysis");
		return mav;
	}
	
	@RequestMapping(value="marketPay.do")
	public ModelAndView marketPay(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/market/market_pay");
		return mav;
	}
	
	@RequestMapping(value="marketBargain.do")
	public ModelAndView marketBargain(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/market/market_bargain");
		return mav;
	}
	
	@RequestMapping(value="marketAdv.do")
	public ModelAndView marketAdv(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/market/market_adv");
		return mav;
	}
}
