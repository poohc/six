package com.icon.six.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
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
@RequestMapping("partner")
public class PartnerController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private AdminService adminService;
	
	@RequestMapping(value="partnerMain.do")
	public ModelAndView partnerMain(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("partner/partner_main");
		
		try {
			
			List<Map<String, Object>> requestCodeList = boardService.selectCommonCode(CommonConstant.COMMON_REQUEST_CD);
			
			requestMap.put("requestCd", requestCodeList.get(1).get("CD"));
			mav.addObject("partnerList1",boardService.selectPartnerList(requestMap));
			requestMap.put("requestCd", requestCodeList.get(0).get("CD"));
			mav.addObject("partnerList2",boardService.selectPartnerList(requestMap));
			mav.addObject("listPage","/partner/partnerFreeInfo.do");			
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList()); mav.addObject("userPoint",boardService.selectUserPointSum(SecurityContextHolder.getContext().getAuthentication().getName()));
		return mav;
	}
	
	@RequestMapping(value="partnerJoin.do")
	public ModelAndView partnerJoin(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("partner/partner_join");
		
		//공통 코드 가져오기(신청구분, 은행 리스트)
		mav.addObject("requestList", boardService.selectCommonCode(CommonConstant.COMMON_REQUEST_CD));
		mav.addObject("bankList", boardService.selectCommonCode(CommonConstant.COMMON_BANK_CD));
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList()); mav.addObject("userPoint",boardService.selectUserPointSum(SecurityContextHolder.getContext().getAuthentication().getName()));
		
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
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList()); mav.addObject("userPoint",boardService.selectUserPointSum(SecurityContextHolder.getContext().getAuthentication().getName()));
		return mav;
				
	}
	
	@RequestMapping(value="partnerFreeInfo.do")
	public ModelAndView partnerFreeInfo(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("partner/partner_freeInfo");
		
		try {
			
			String category = String.valueOf(requestMap.get("category")); 
			
			if(!"".equals(StringUtils.defaultIfEmpty(String.valueOf(requestMap.get("seq")), "")) && "null".equals(String.valueOf(requestMap.get("isView")))){
				requestMap.put("partnerSeq", requestMap.get("seq"));
			} 
			
			if("null".equals(category)){
				category = "FREE_INFO";
			}
			
			requestMap.put("category", category);
			Map<String, Object> partnerBoardInfo = boardService.selectPartnerBoardList(requestMap);
			Map<String, Object> partnerInfo = adminService.selectPartnerInfo(String.valueOf(requestMap.get("partnerSeq")));
			Map<String, Object> partnerBoardStat = boardService.selectSixPartnerBoardStat(String.valueOf(partnerInfo.get("ID")));
			
			mav.addObject("id",requestMap.get("id"));
			mav.addObject("partnerSeq",requestMap.get("partnerSeq"));
			mav.addObject("list",partnerBoardInfo.get("list"));
			mav.addObject("page",partnerBoardInfo.get("page"));
			mav.addObject("listPage","/partner/partnerFreeInfo.do");
			mav.addObject("viewPage","/partner/partnerBoardView.do");
			mav.addObject("writePage","/partner/partnerFreeInfoWrite.do");
			mav.addObject("currentPage",requestMap.get("currentPage"));
			mav.addObject("category",category);
			mav.addObject("partnerInfo",partnerInfo);
			mav.addObject("partnerBoardStat",partnerBoardStat);
		} catch (Exception e) {
			// TODO: 에러 처리
			
		}
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList()); mav.addObject("userPoint",boardService.selectUserPointSum(SecurityContextHolder.getContext().getAuthentication().getName()));
		return mav;
	}
	
	@RequestMapping(value="partnerBoardView.do")
	public ModelAndView partnerBoardView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("partner/partner_view");
		
		try {
			//HIT COUNT 업데이트
			requestMap.put("hitCount", "1");
			boardService.updateSixPartnerBoardHitCount(requestMap);
			
			Map<String, Object> resultMap = boardService.selectPartnerBoardInfo(requestMap);
			Map<String, Object> partnerBoardStat = boardService.selectSixPartnerBoardStat(String.valueOf(requestMap.get("id")));
			Map<String, Object> partnerInfo = adminService.selectPartnerInfo(String.valueOf(requestMap.get("partnerSeq")));
			
			mav.addObject("partnerBoardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			String category = String.valueOf(requestMap.get("category"));
			mav.addObject("id",requestMap.get("id"));
			mav.addObject("seq",requestMap.get("seq"));
			mav.addObject("partnerSeq",requestMap.get("partnerSeq"));
			mav.addObject("listPage","/partner/partnerFreeInfo.do");
			mav.addObject("partnerInfo",partnerInfo);
			mav.addObject("updateAction","/partner/partnerFreeInfoUpdate.do");
			mav.addObject("deleteAction","/partner/partnerFreeInfoDelete.do");
			mav.addObject("partnerBoardStat",partnerBoardStat);
			
		} catch (Exception e) {
			// TODO: 에러 처리
		}
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList()); mav.addObject("userPoint",boardService.selectUserPointSum(SecurityContextHolder.getContext().getAuthentication().getName()));
		return mav;
	}
	
	@RequestMapping(value="partnerFreeInfoUpdate.do")
	public ModelAndView partnerFreeInfoUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("partner/partner_freeInfo_write");
		
		try {
			Map<String, Object> resultMap = boardService.selectPartnerBoardInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			mav.addObject("id",requestMap.get("id"));
			mav.addObject("partnerSeq",requestMap.get("partnerSeq"));
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/partner/partnerFreeInfoUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러 처리
		}
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList()); mav.addObject("userPoint",boardService.selectUserPointSum(SecurityContextHolder.getContext().getAuthentication().getName()));
		return mav;
	}
	
	@RequestMapping(value="partnerFreeInfoWrite.do")
	public ModelAndView partnerFreeInfoWrite(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("partner/partner_freeInfo_write");
		
		try {
			mav.addObject("insertAction","/partner/partnerFreeInfoWriteProcess.do");
			mav.addObject("category","FREE_INFO");
			mav.addObject("id",requestMap.get("id"));
			mav.addObject("partnerSeq",requestMap.get("partnerSeq"));
			
		} catch (Exception e) {
			// TODO: 에러 처리
		}
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList()); mav.addObject("userPoint",boardService.selectUserPointSum(SecurityContextHolder.getContext().getAuthentication().getName()));
		return mav;
	}
	
	@RequestMapping(value="partnerFreeInfoWriteProcess.do")
	public ModelAndView partnerFreeInfoWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response) throws IOException{
		logger.info("requestMap : " + requestMap);
		ModelAndView mav = new ModelAndView("main/commonPage");
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("multipartRequest", request);
				result = boardService.insertSixPartnerBoard(requestMap);
				
				List<String> freeTab = new ArrayList<String>();
				List<String> paidTab = new ArrayList<String>();
				
				freeTab.add("FREE_INFO");
				freeTab.add("INVEST_STRATEGY");
				freeTab.add("MARKET_ANALYSIS");
				
				paidTab.add("PAID_INFO");
				paidTab.add("BARGAIN_TECHNIQUES");
				paidTab.add("ADVANCE_MARKET");
				
				if(result == 1){
					mav.addObject("id", requestMap.get("id"));
					mav.addObject("msg","게시물 입력에 성공했습니다.");
					mav.addObject("category", requestMap.get("category"));
					if(freeTab.contains(requestMap.get("category"))){
						mav.addObject("page","/partner/partnerFreeInfo.do");
						mav.addObject("partnerSeq",requestMap.get("partnerSeq"));
					} else if(paidTab.contains(requestMap.get("category"))){
						mav.addObject("page","/partner/partnerPaidInfo.do");
						mav.addObject("partnerSeq",requestMap.get("partnerSeq"));
					}
					
				} else {
					// TODO 에러페이지
					response.sendRedirect("/main/error.do");
				}
			} else {
				// TODO 에러페이지
				response.sendRedirect("/main/error.do");
			}
			
		} catch (IOException e) {
			// TODO 에러 처리
			response.sendRedirect("/main/error.do");
		}
		
		return mav;
	}
	
	@RequestMapping(value="partnerFreeInfoUpdateProcess.do")
	public ModelAndView partnerFreeInfoUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response) throws IOException{
		logger.debug("requestMap : " + requestMap);
		ModelAndView mav = new ModelAndView("main/commonPage");
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("multipartRequest", request);
				result = boardService.updateSixPartnerBoard(requestMap);
				
				List<String> freeTab = new ArrayList<String>();
				List<String> paidTab = new ArrayList<String>();
				
				freeTab.add("FREE_INFO");
				freeTab.add("INVEST_STRATEGY");
				freeTab.add("MARKET_ANALYSIS");
				
				paidTab.add("PAID_INFO");
				paidTab.add("BARGAIN_TECHNIQUES");
				paidTab.add("ADVANCE_MARKET");
				
				if(result == 1){
					mav.addObject("id", requestMap.get("id"));
					mav.addObject("msg","게시물 수정에 성공했습니다.");
					mav.addObject("category", requestMap.get("category"));
					mav.addObject("partnerSeq",requestMap.get("partnerSeq"));
					
					if(freeTab.contains(requestMap.get("category"))){
						mav.addObject("page","/partner/partnerFreeInfo.do");
					} else if(paidTab.contains(requestMap.get("category"))){
						mav.addObject("page","/partner/partnerPaidInfo.do");
					}
					
				} else {
					// TODO 에러페이지
					response.sendRedirect("/main/error.do");
				}
			} else {
				// TODO 에러페이지
				response.sendRedirect("/main/error.do");
			}
			
		} catch (IOException e) {
			// TODO 에러 처리
			response.sendRedirect("/main/error.do");
		}
		
		return mav;
	}
	
	@RequestMapping(value="partnerFreeInfoDelete.do")
	public ModelAndView partnerFreeInfoDelete(@RequestParam Map<String, Object> requestMap, HttpServletResponse response) throws IOException{
		logger.debug("requestMap : " + requestMap);
		ModelAndView mav = new ModelAndView("main/commonPage");
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				result = boardService.deleteSixPartnerBoard(requestMap);
				
				if(result == 1){
					mav.addObject("id", requestMap.get("id"));
					mav.addObject("msg","게시물을 삭제했습니다.");
					mav.addObject("category", requestMap.get("category"));
					mav.addObject("page","/partner/partnerFreeInfo.do");
					mav.addObject("partnerSeq",requestMap.get("partnerSeq"));
				} else {
					// TODO 에러페이지
					response.sendRedirect("/main/error.do");
				}
			} else {
				// TODO 에러페이지
				response.sendRedirect("/main/error.do");
			}
			
		} catch (IOException e) {
			// TODO 에러 처리
			response.sendRedirect("/main/error.do");
		}
		
		return mav;
	}
	
	@RequestMapping(value="partnerPaidInfo.do")
	public ModelAndView partnerPaidInfo(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("partner/partner_paidInfo");
		
		try {
			
			String category = String.valueOf(requestMap.get("category")); 
			
			if(!"".equals(StringUtils.defaultIfEmpty(String.valueOf(requestMap.get("seq")), "")) && "null".equals(String.valueOf(requestMap.get("isView")))){
				requestMap.put("partnerSeq", requestMap.get("seq"));
			}
			
			if("null".equals(category)){
				category = "PAID_INFO";
			}
			
			requestMap.put("category", category);
			Map<String, Object> partnerBoardInfo = boardService.selectPartnerBoardList(requestMap);
			Map<String, Object> partnerInfo = adminService.selectPartnerInfo(String.valueOf(requestMap.get("partnerSeq")));
			Map<String, Object> partnerBoardStat = boardService.selectSixPartnerBoardStat(String.valueOf(partnerInfo.get("ID")));
			
			mav.addObject("id",requestMap.get("id"));
			mav.addObject("partnerSeq",requestMap.get("partnerSeq"));
			mav.addObject("list",partnerBoardInfo.get("list"));
			mav.addObject("page",partnerBoardInfo.get("page"));
			mav.addObject("listPage","/partner/partnerPaidInfo.do");
			mav.addObject("viewPage","/partner/partnerBoardView.do");
			mav.addObject("writePage","/partner/partnerPaidInfoWrite.do");
			mav.addObject("currentPage",requestMap.get("currentPage"));
			mav.addObject("category",category);
			mav.addObject("partnerInfo",partnerInfo);
			mav.addObject("partnerBoardStat",partnerBoardStat);
			
		} catch (Exception e) {
			// TODO: 에러 처리
			
		}
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList()); mav.addObject("userPoint",boardService.selectUserPointSum(SecurityContextHolder.getContext().getAuthentication().getName()));
		return mav;
	}
	
	@RequestMapping(value="partnerPaidInfoWrite.do")
	public ModelAndView partnerPaidInfoWrite(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("partner/partner_paidInfo_write");
		
		try {
			mav.addObject("insertAction","/partner/partnerFreeInfoWriteProcess.do");
			mav.addObject("category","PAID_INFO");
			mav.addObject("id",requestMap.get("id"));
			mav.addObject("partnerSeq",requestMap.get("partnerSeq"));
			
		} catch (Exception e) {
			// TODO: 에러 처리
		}
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList()); mav.addObject("userPoint",boardService.selectUserPointSum(SecurityContextHolder.getContext().getAuthentication().getName()));
		return mav;
	}
	
}
