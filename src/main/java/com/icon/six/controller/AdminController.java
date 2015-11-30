package com.icon.six.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.icon.six.service.BoardService;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping(value="adminMain.do")
	public ModelAndView adminMain(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("admin/admin_main");
		return mav;
	}
	
	@RequestMapping(value="partnerList.do")
	public ModelAndView partnerList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("admin/admin_main");
		return mav;
	} 
		
}
