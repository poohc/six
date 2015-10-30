package com.icon.six.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("academy")
public class AcademyController {
	
	@RequestMapping(value="academyMain.do")
	public ModelAndView academyMain(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/academy/academy_main");
		return mav;
	}
	
	@RequestMapping(value="academyLearningCenter.do")
	public ModelAndView academyLearningCenter(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/academy/academy_lcenter");
		return mav;
	}
	
	@RequestMapping(value="academyLearningCenterWrite.do")
	public ModelAndView academyLearningCenterWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/academy/academy_lcenter_write");
		
		
		
		return mav;
	}
	
	@RequestMapping(value="academyInvestStrategy.do")
	public ModelAndView academyInvestStrategy(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/academy/academy_istrategy");
		return mav;
	}
	
	@RequestMapping(value="academySearchNote.do")
	public ModelAndView academySearchNote(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/academy/academy_snote");
		return mav;
	}
	
	@RequestMapping(value="academyNecessarySubscribe.do")
	public ModelAndView academyNecessarySubscribe(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/academy/academy_nsubscribe");
		return mav;
	}
	
}
