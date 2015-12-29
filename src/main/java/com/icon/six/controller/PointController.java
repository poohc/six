package com.icon.six.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icon.six.auth.CustomUserDetails;
import com.icon.six.constant.CommonConstant;
import com.icon.six.service.BoardService;

@Controller
@RequestMapping("point")
public class PointController {

	@Resource
	private BoardService boardService;
	
	@RequestMapping(value = "pointBuy.do")
	public ModelAndView pointBuy(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("point/point_buy");
		
		mav.addObject("stockInfo",boardService.selectScheduleStock());
		mav.addObject("realStockInfo",boardService.selectRealStockList());
		mav.addObject("paymentCd",boardService.selectCommonCode(CommonConstant.COMMON_PAYMENT_CD));
		mav.addObject("payAction","/point/pointBuyProcess.do");
		return mav;
	}
	
	@RequestMapping(value = "pointBuyProcess.do")
	public ModelAndView pointBuyProcess(@RequestParam(value="point")         String point,           //포인트
										@RequestParam(value="sChargeMoney")  String sChargeMoney,    //표시 금액
										@RequestParam(value="sChargePoint")  String sChargePoint,    //표시 포인트
										@RequestParam(value="pointRadio")    String pointRadio,      //포인트 선택 라디오
										@RequestParam(value="paymentMethod") String paymentMethod,   //결제 수단
									    HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		/**
		 * 포인트 별 금액
		 * 30,000 포인트 = 30,000원
		 * 51,000 포인트 = 50,000원
		 * 103,000 포인트 = 100,000원
		 * 210,000 포인트 = 200,000원
		 * 320,000 포인트 = 300,000원 
		 */
		
		String result = "true";
		String page = "/point/pointBuy.do";
		String msg = "포인트 신청이 완료되었습니다.";
		List<String> pointArray = new ArrayList<String>();
		
		int insertResult = 0;
		
		pointArray.add("30000");
		pointArray.add("51000");
		pointArray.add("103000");
		pointArray.add("210000");
		pointArray.add("320000");
		
		try {
			/**
			 * 포인트 유효성 검사 
			 * 1. 선택된 포인트가 30,000, 51,000, 103,000, 210,000, 320,000 중 하나여야 함
			 * 2. 선택된 라디오 버튼 Value 값 = 포인트 값 = 표시 포인트 일치 여부 검사
			 * 3. 표시 포인트와 표시 금액이 매치 되는지 검사
			 */
			
			if(!pointArray.contains(point)){
				msg = "유효한 포인트가 아닙니다.";
				result = "false";
			} else {
				
				if(!point.equals(sChargePoint) || !pointRadio.equals(point) || !pointRadio.equals(sChargePoint)){
					msg = "선택된 포인트와 일치 하지 않는 포인트 입니다.";
					result = "false";
				} else {
					
					if(!chkPointMoney(point, sChargeMoney)){
						msg = "포인트와 금액이 일치 하지 않습니다.";
						result = "false";
					}
				}
			}
			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			
			CustomUserDetails userDetail = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getDetails();
			
			paramMap.put("point", point);
			paramMap.put("money", sChargeMoney);
			paramMap.put("paymentMethod", paymentMethod);
			paramMap.put("msg", msg);
			paramMap.put("id", SecurityContextHolder.getContext().getAuthentication().getName());
			paramMap.put("name", userDetail.getName());
			
			if("true".equals(result)){
				paramMap.put("isValid", "Y");
			} else if("false".equals(result)){
				paramMap.put("isValid", "N");
			}
			
			insertResult = boardService.insertSixPoint(paramMap);
			
		} catch (Exception e) {
			// TODO: 에러처리			
		}
		
		if(insertResult==0){
			msg = "포인트 요청에 실패 하였습니다. 관리자에게 문의해 주세요.";
		}
		
		mav.addObject("msg",msg);
		mav.addObject("page",page);
		
		return mav;
	}
	
	private boolean chkPointMoney(String point, String money){
		
		boolean result = false;
		
		if(point.equals("30000")) result = (money.equals("30000"))? true : false;
		if(point.equals("51000")) result = (money.equals("50000"))? true : false;
		if(point.equals("102000")) result = (money.equals("100000"))? true : false;
		if(point.equals("210000")) result = (money.equals("200000"))? true : false;
		if(point.equals("320000")) result = (money.equals("300000"))? true : false;
		
		return result;
	}
}
