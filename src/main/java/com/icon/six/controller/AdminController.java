package com.icon.six.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
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
import com.icon.six.util.StringUtil;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
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
				response.sendRedirect("/admin/error.do");
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
				response.sendRedirect("/admin/error.do");
			}
			
		} catch (IOException e) {
			// TODO 에러 처리
			try {
				response.sendRedirect("/admin/error.do");
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
		mav.addObject("listPage", "/admin/point.do");
		mav.addObject("confirmAction", "/admin/pointProcess.do");
		
		return mav;
	}
	
	@RequestMapping(value="pointProcess.do")
	public ModelAndView pointProcess(@RequestParam(value="chkPoint") String[] seqList,
									 @RequestParam(value="isConfirm") String isConfirm,
									 @RequestParam(value="point") String[] pointList,
									 @RequestParam(value="id") String[] idList,
									 HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		int result = 0;
		String msg = "포인트 처리가 완료 되었습니다.";
		
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("updateId", SecurityContextHolder.getContext().getAuthentication().getName());
			param.put("array", seqList);
			param.put("pointList", pointList);
			param.put("idList", idList);
			param.put("isConfirm", isConfirm);
			
			if("Y".equals(isConfirm)){
				param.put("confirmId", SecurityContextHolder.getContext().getAuthentication().getName());
			} else if("N".equals(isConfirm)){
				param.put("cancelId", SecurityContextHolder.getContext().getAuthentication().getName());
			}
			
			result = adminService.updateSixPointConfirm(param);
			
		} catch (Exception e) {
			// TODO: 에러 처리
		}
		
		if(result == 0){
			msg = "포인트 처리중 오류가 발생하였습니다.";
		}
		
		mav.addObject("msg",msg);
		mav.addObject("page","/admin/point.do");
		return mav;
	}
	
	@RequestMapping(value="counseling.do")
	public ModelAndView counselingList(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("admin/admin_counseling");
		
		Map<String, Object> partnerInfo = adminService.selectSixCounseling(requestMap);
		
		mav.addObject("listPage","/admin/counseling.do");
		mav.addObject("viewPage","/admin/counselingView.do");
		
		mav.addObject("list",partnerInfo.get("list"));
		mav.addObject("page",partnerInfo.get("page"));
		mav.addObject("currentPage",requestMap.get("currentPage"));
		
		return mav;
	}
	
	@RequestMapping(value="counselingView.do")
	public ModelAndView counselingView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("admin/admin_counseling_view");
		
		Map<String, Object> counselingInfo = adminService.selectSixCounselingInfo(requestMap);
		
		mav.addObject("counselingInfo",counselingInfo);
		mav.addObject("listPage","/admin/counseling.do");
		
		return mav;
	}
	
	@RequestMapping(value="f1kCounseling.do")
	public ModelAndView f1kCounseling(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("admin/admin_f1k_counseling");
		
		Map<String, Object> f1kCounselingMap = adminService.selectF1kCounseling(requestMap);
		
		mav.addObject("listPage","/admin/f1kCounseling.do");
		mav.addObject("viewPage","/admin/f1kCounselingView.do");
		
		mav.addObject("list",f1kCounselingMap.get("list"));
		mav.addObject("page",f1kCounselingMap.get("page"));
		mav.addObject("currentPage",requestMap.get("currentPage"));
		
		return mav;
	}
	
	@RequestMapping(value="f1kCounselingView.do")
	public ModelAndView f1kCounselingView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("admin/admin_f1k_counseling_view");
		
		Map<String, Object> counselingInfo = adminService.selectF1kCounselingInfo(requestMap);
		
		mav.addObject("counselingInfo",counselingInfo);
		mav.addObject("listPage","/admin/counseling.do");
		
		return mav;
	}
	
	@RequestMapping(value="f1kNoticeBoard.do")
	public ModelAndView f1kNoticeBoard(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("admin/admin_f1k_notice_board");
		
		requestMap.put("boardName", CommonConstant.F1K_NOTICE_BOARD);
		
		Map<String, Object> f1kNoticeBoardMap = boardService.selectBoardList(requestMap);
		
		mav.addObject("listPage","/admin/f1kNoticeBoard.do");
		mav.addObject("viewPage","/admin/f1kNoticeBoardView.do");
		mav.addObject("writePage","/admin/f1kNoticeBoardWrite.do");
		
		mav.addObject("list",f1kNoticeBoardMap.get("list"));
		mav.addObject("page",f1kNoticeBoardMap.get("page"));
		mav.addObject("currentPage",requestMap.get("currentPage"));
		
		return mav;
	}
	
	@RequestMapping(value="f1kNoticeBoardView.do")
	public ModelAndView f1kNoticeBoardView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("admin/admin_f1k_notice_board_view");
		
		requestMap.put("boardName", CommonConstant.F1K_NOTICE_BOARD);
		Map<String, Object> f1kNoticeBoardInfo = boardService.selectBoardViewInfo(requestMap);
		
		mav.addObject("boardInfo",f1kNoticeBoardInfo.get("boardInfo"));
		mav.addObject("fileList",f1kNoticeBoardInfo.get("fileList"));
		mav.addObject("listPage","/admin/f1kNoticeBoard.do");
		mav.addObject("updatePage","/admin/f1kNoticeBoardUpdate.do");
		mav.addObject("deleteAction","/admin/f1kNoticeBoardDeleteProcess.do");
		
		return mav;
	}
	
	@RequestMapping(value="f1kNoticeBoardWrite.do")
	public ModelAndView f1kNoticeBoardWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("admin/admin_f1k_notice_board_write");
		mav.addObject("listPage","/admin/f1kNoticeBoard.do");
		mav.addObject("insertAction","/admin/f1kNoticeBoardWriteProcess.do");		
		return mav;
	}
	
	@RequestMapping(value="f1kNoticeBoardWriteProcess.do")
	public void f1kNoticeBoardWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.F1K_NOTICE_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/admin/f1kNoticeBoard.do");
				} else {
					// TODO 에러페이지
					response.sendRedirect("/admin/error.do");
				}
			} else {
				// TODO 에러페이지
				response.sendRedirect("/admin/error.do");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="f1kNoticeBoardUpdate.do")
	public ModelAndView f1kNoticeBoardUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("admin/admin_f1k_notice_board_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.F1K_NOTICE_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/admin/f1kNoticeBoardUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}		
		return mav;
	}
	
	@RequestMapping(value="f1kNoticeBoardUpdateProcess.do")
	public void f1kNoticeBoardUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.F1K_NOTICE_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/admin/f1kNoticeBoard.do");
				} else {
					// TODO 에러페이지
					response.sendRedirect("/admin/error.do");
				}
			} else {
				// TODO 에러페이지
				response.sendRedirect("/admin/error.do");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="f1kNoticeBoardDeleteProcess.do")
	public void f1kNoticeBoardDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.F1K_NOTICE_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/admin/f1kNoticeBoard.do");
				} else {
					//TODO 에러 페이지
					response.sendRedirect("/admin/error.do");
				}
				
			} else {
				// TODO 에러페이지 처리
				response.sendRedirect("/admin/error.do");
			}
			
		} catch (IOException e) {
			// TODO 에러 페이지 처리
			response.sendRedirect("/admin/error.do");
		}	
	}
	
	@RequestMapping(value = "error.do")
	public ModelAndView errorPage(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("admin/error");
		
		return mav;
	}
}
