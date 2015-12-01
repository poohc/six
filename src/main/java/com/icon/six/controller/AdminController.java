package com.icon.six.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icon.six.service.AdminService;
import com.icon.six.service.BoardService;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private AdminService adminService;
	
	@RequestMapping(value="adminMain.do")
	public ModelAndView adminMain(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("admin/admin_main");
		return mav;
	}
	
	@RequestMapping(value="commonCode.do")
	public ModelAndView commonCode(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("admin/admin_commonCode");
		return mav;
	}
	
	@RequestMapping(value="terms.do")
	public ModelAndView terms(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("admin/admin_terms");
		return mav;
	}
	
	@RequestMapping(value="partner.do")
	public ModelAndView partnerList(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("admin/admin_partner");
		
		Map<String, Object> partnerInfo = adminService.selectJoinPartnerList(requestMap);
		
		mav.addObject("list",partnerInfo.get("list"));
		mav.addObject("page",partnerInfo.get("page"));
		
		return mav;
	} 
		
}
