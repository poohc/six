package com.icon.six.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
			mav.addObject("updatePage","/admin/partnerUpdateProcess.do");
			mav.addObject("confirmPage","/admin/partnerConfirmProcess.do");
			
			mav.addObject("requestList", boardService.selectCommonCode(CommonConstant.COMMON_REQUEST_CD));
			mav.addObject("bankList", boardService.selectCommonCode(CommonConstant.COMMON_BANK_CD));
			mav.addObject("partnerInfo",partnerInfo);
		} catch (Exception e) {
			// TODO: 에러처리
			
		}
		
		return mav;
	}
	
	@RequestMapping(value="partnerUpdateProcess.do")
	public ModelAndView partnerUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response) throws IOException{
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		int result = 0;
		String msg = "";
		try {
			
			if(String.valueOf(requestMap.get("file")) == null){
				requestMap.remove("file");
			}
			
			requestMap.put("updateUserId", SecurityContextHolder.getContext().getAuthentication().getName());
			requestMap.put("multipartRequest", request);
			
			result = adminService.updatePartner(requestMap);
			
			if(result == 1){
				msg = "파트너 정보 수정에 성공했습니다.";
			} else {
				msg = "파트너 정보 수정에 실패 했습니다.";
			}
			
		} catch (Exception e) {
			// TODO: 에러 처리
			msg = "오류가 발생했습니다. 관리자에게 문의해 주세요.";
		}
		
		mav.addObject("page","/admin/partnerView.do");
		mav.addObject("msg",msg);
		mav.addObject("seq",requestMap.get("seq"));
		
		return mav;
		
	}
	
	@RequestMapping(value="partnerConfirmProcess.do")
	public void partnerConfirmProcess(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		int result = 0;
		
		try {
			
			if("N".equals(requestMap.get("isConfirm"))){
				requestMap.put("isConfirm", "Y");
			} else if("Y".equals(requestMap.get("isConfirm"))){
				requestMap.put("isConfirm", "N");
			} else {
				response.sendRedirect("/main/error.do");
			}
			
			requestMap.put("updateUserId", SecurityContextHolder.getContext().getAuthentication().getName());
			result = adminService.updatePartner(requestMap);
			
			if(result==1){
				List<GrantedAuthority> roles = (List<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
				
				System.out.println("roles : " + roles.toString());
				
				/**
				 * PARTNER ROLE 검색 후 없으면 INSERT
				 */
				requestMap.put("id", requestMap.get("id"));
				requestMap.put("authority", CommonConstant.AUTH_PARTNER);
				int roleCount = adminService.selectRoleCount(requestMap);
				
				if(roleCount == 0 && !roles.contains(CommonConstant.AUTH_ADMIN)){
					adminService.insertAuthority(requestMap);
				}
				
				response.sendRedirect("/admin/partner.do");
			} else {
				response.sendRedirect("/main/error.do");
			}
			
		} catch (IOException e) {
			// TODO 에러 처리
			try {
				response.sendRedirect("/main/error.do");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}		
		
	}
	
	@RequestMapping(value="point.do")
	public ModelAndView point(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("admin/admin_point");
		
		Map<String, Object> pointInfo = adminService.selectRequestPointList(requestMap);
		
		mav.addObject("list",pointInfo.get("list"));
		mav.addObject("page",pointInfo.get("page"));
		
		return mav;
	}
	
}
