package com.icon.six.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.icon.six.service.BoardService;

@Controller
@RequestMapping("company")
public class CompanyController {
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping(value = "aboutCompany.do")
	public ModelAndView aboutCompany(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/company/aboutCompany");
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList()); mav.addObject("userPoint",boardService.selectUserPointSum(SecurityContextHolder.getContext().getAuthentication().getName()));
		return mav;
	}
}
