package com.icon.six.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.icon.six.constant.CommonConstant;
import com.icon.six.service.BoardService;

@Controller
@RequestMapping("partner")
public class PartnerController {
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping(value="partnerMain.do")
	public ModelAndView partnerMain(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("partner/partner_main");
		
		try {
			
			List<Map<String, Object>> requestCodeList = boardService.selectCommonCode(CommonConstant.COMMON_REQUEST_CD);
			
			requestMap.put("requestCd", requestCodeList.get(1).get("CD"));
			mav.addObject("partnerList1",boardService.selectPartnerList(requestMap));
			requestMap.put("requestCd", requestCodeList.get(0).get("CD"));
			mav.addObject("partnerList2",boardService.selectPartnerList(requestMap));
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		
		return mav;
	}
	
	@RequestMapping(value="partnerJoin.do")
	public ModelAndView partnerJoin(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("partner/partner_join");
		
		//공통 코드 가져오기(신청구분, 은행 리스트)
		mav.addObject("requestList", boardService.selectCommonCode(CommonConstant.COMMON_REQUEST_CD));
		mav.addObject("bankList", boardService.selectCommonCode(CommonConstant.COMMON_BANK_CD));
		
		return mav;
	}
	
	@RequestMapping(value="partnerJoinProcess.do")
	public ModelAndView partnerJoinProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		int result = 0;
		String msg = "파트너 신청에 오류가 발생했습니다. 관리자에게 문의하여 주세요.";
		String page = "/main/error.do";
		try {
			
			//계좌번호 없을 경우, 정산 은행 삭제
			if("".equals(String.valueOf(requestMap.get("accountNo")))){
				requestMap.remove("bankCd");
			}
			
			requestMap.put("multipartRequest", request);
			result = boardService.insertSixPartner(requestMap);
			
			if(result == 1){
				msg = "파트너 신청이 완료 되었습니다.";
				page = "/partner/partnerJoin.do";
			}
			
		} catch (Exception e) {
			//TODO 에러처리
		} 
		
		mav.addObject("msg",msg);
		mav.addObject("page",page);
		
		return mav;
				
	}
	
	@RequestMapping(value="partnerFreeInfo.do")
	public ModelAndView partnerFreeInfo(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("partner/partner_freeInfo");
		
		try {
			
			String category = String.valueOf(requestMap.get("category")); 
			
			if("null".equals(category)){
				category = "FREE_INFO";
			}
			
			Map<String, Object> partnerBoardInfo = boardService.selectPartnerBoardList(requestMap);
			
			mav.addObject("list",partnerBoardInfo.get("list"));
			mav.addObject("page",partnerBoardInfo.get("page"));
			mav.addObject("listPage","/partner/partnerFreeInfo.do");
			mav.addObject("viewPage","/partner/partnerFreeInfoView.do");
			mav.addObject("writePage","/partner/partnerFreeInfoWrite.do");
			mav.addObject("currentPage",requestMap.get("currentPage"));
			mav.addObject("category",category);
			
		} catch (Exception e) {
			// TODO: 에러 처리
			
		}
		
		return mav;
	}
	
	@RequestMapping(value="partnerFreeInfoView.do")
	public ModelAndView partnerFreeInfoView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("partner/partner_freeInfo_view");
		
		try {
			Map<String, Object> partnerBoardInfo = boardService.selectPartnerBoardInfo(requestMap);
			
			mav.addObject("partnerBoardInfo",partnerBoardInfo);
			
		} catch (Exception e) {
			// TODO: 에러 처리
		}
		
		return mav;
	}
	
	@RequestMapping(value="partnerFreeInfoWrite.do")
	public ModelAndView partnerFreeInfoWrite(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("partner/partner_freeInfo_write");
		
		try {
			Map<String, Object> partnerBoardInfo = boardService.selectPartnerBoardInfo(requestMap);
			
			mav.addObject("partnerBoardInfo",partnerBoardInfo);
			
		} catch (Exception e) {
			// TODO: 에러 처리
		}
		
		return mav;
	}
	
	
	@RequestMapping(value="partnerPayInfo.do")
	public ModelAndView partnerPayInfo(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("partner/partner_payInfo");
		return mav;
	}
	
	@RequestMapping(value="partnerView.do")
	public ModelAndView partnerView(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("partner/partner_view");
		return mav;
	}
}
