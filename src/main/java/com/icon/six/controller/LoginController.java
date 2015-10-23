package com.icon.six.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.icon.six.service.LoginService;
import com.icon.six.util.CipherUtil;

@Controller
@RequestMapping("login")
public class LoginController {
	
	@Resource
	private LoginService loginService;
	
	@RequestMapping(value="login.do")	
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("login/login");		
		return mav;
	}	
	
	@RequestMapping(value="loginProcess.do")	
	public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/main");
		
		try {
			String userId = StringUtils.defaultIfEmpty(request.getParameter("j_username"), "");
			String userPw = StringUtils.defaultIfEmpty(request.getParameter("j_password"), "");
			
			Map<String, String> userInfo = loginService.chkLoginIdPassword(userId);
			
			System.out.println(userInfo);
			
			CipherUtil cipher = CipherUtil.getInstance();
			
			if(userId.equals(userInfo.get("ID")) && userPw.equals(cipher.AES_Decode(userInfo.get("PASSWORD")))){
				mav.addObject("userInfo",userInfo);
			} else {
				mav.addObject("msg","아이디 혹은 암호가 틀립니다.");
				mav.setViewName("login/login");
			}	
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	
	@RequestMapping(value="loginFail.do")	
	public ModelAndView loginFail(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("login/login");		
		mav.addObject("msg","잘못된 ID/암호 입니다. 다시 확인해 주세요");
		return mav;
	}
	
	
}
