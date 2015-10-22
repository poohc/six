package com.icon.six.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CompanyController {
	
	public ModelAndView aboutCompany(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/company/aboutCompany");
		return mav;
	}
	
	
	
}
