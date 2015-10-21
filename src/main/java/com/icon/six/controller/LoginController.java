package com.icon.six.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("login")
public class LoginController {
	
	public ModelAndView LoginView(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("login/login");		
		return mav;
	}
	
	@RequestMapping(value = "chkLogin.do", produces="text/plain;charset=UTF-8")
	public @ResponseBody String chkLogin(HttpServletRequest request, HttpServletResponse response){
		
		return "";
	}
	
}
