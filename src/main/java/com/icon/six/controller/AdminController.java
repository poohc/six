package com.icon.six.controller;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icon.six.constant.CommonConstant;
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
		
		mav.addObject("listPage","/admin/partner.do");
		mav.addObject("viewPage","/admin/partnerView.do");
		mav.addObject("list",partnerInfo.get("list"));
		mav.addObject("page",partnerInfo.get("page"));
		
		return mav;
	} 
		
	@RequestMapping(value="partnerView.do")
	public ModelAndView partnerView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("admin/admin_partner_view");
		
		try {
			String seq = String.valueOf(requestMap.get("seq"));
			Map<String, Object> partnerInfo = adminService.selectPartnerInfo(seq);
			
			mav.addObject("listPage","/admin/partner.do");
			mav.addObject("updatePage","/admin/partnerUpdate.do");
			mav.addObject("confirmPage","/admin/partnerConfirmProcess.do");
			
			mav.addObject("requestList", boardService.selectCommonCode(CommonConstant.COMMON_REQUEST_CD));
			mav.addObject("bankList", boardService.selectCommonCode(CommonConstant.COMMON_BANK_CD));
			mav.addObject("partnerInfo",partnerInfo);
		} catch (Exception e) {
			// TODO: 에러처리
			
		}
		
		return mav;
	}
	
	@RequestMapping(value="partnerUpdate.do")
	public ModelAndView partnerUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("admin/admin_partner_update");
		
		try {
			String seq = String.valueOf(requestMap.get("seq"));
			Map<String, Object> partnerInfo = adminService.selectPartnerInfo(seq);
			
			mav.addObject("listPage","/admin/partner.do");
			mav.addObject("updatePage","/admin/partnerUpdateProcess.do");
			
			mav.addObject("requestList", boardService.selectCommonCode(CommonConstant.COMMON_REQUEST_CD));
			mav.addObject("bankList", boardService.selectCommonCode(CommonConstant.COMMON_BANK_CD));
			mav.addObject("partnerInfo",partnerInfo);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return mav;
	}
	
	@RequestMapping(value="partnerUpdateProcess.do")
	public void partnerUpdateProcess(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		requestMap.put("updateUserId", SecurityContextHolder.getContext().getAuthentication().getName());
		adminService.updatePartner(requestMap);
		
	}
	
	@RequestMapping(value="partnerConfirmProcess.do")
	public void partnerConfirmProcess(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		try {
			
			
			
			
			response.sendRedirect("/admin/partner.do");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
	}
}
