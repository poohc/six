package com.icon.six.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("login")
public class LoginController {
	
	@RequestMapping(value="login.do")	
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("login/login");		
		return mav;
	}	
	
	@RequestMapping(value="loginFail.do")	
	public ModelAndView loginFail(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("login/login");		
		mav.addObject("msg","잘못된 ID/암호 입니다. 다시 확인해 주세요");
		return mav;
	}
	
	
}
