package com.icon.six.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icon.six.constant.CommonConstant;
import com.icon.six.service.MemberService;
import com.icon.six.util.CipherUtil;
import com.icon.six.util.StringUtil;

@Controller
@RequestMapping("member")
public class MemberController extends DefaultController{
	
	@Resource
	MemberService memberSerivce;
	
	@RequestMapping(value = "memberNotice.do")
	public ModelAndView member_notice(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("member/member_notice");
		
		debug("request 값 확인 : " + request.getParameterMap());
		
		return mav;
	}
	
	@RequestMapping(value = "memberJoin.do")
	public ModelAndView memberJoin(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("member/member_join");
		
		return mav;
	}
	
	@RequestMapping(value = "memberComplete.do")
	public ModelAndView memberComplete(@RequestParam Map<String, String> requestMap, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("member/member_complete");
		
		/**
		 * 회원 정보 저장
		 * 1. 파라메터 유효성 체크
		 * 2. 가공이 필요한 일부 인자 가공
		 * 3. 패스워드 암호화  
		 * 4. DB 저장
		 */
		
		try {
			//파라메터 널 체크
			if("Null".equals(StringUtil.nullCheckMap((HashMap) requestMap))){
				// TODO: 에러 페이지 호출
			} else if(!requestMap.get("resultChkId").equals(requestMap.get("memId"))) {
				// TODO: 에러 페이지 호출
			} else if(!requestMap.get("resultChkEmail").equals(requestMap.get("email1")+"@"+requestMap.get("email2"))) {
				// TODO: 에러 페이지 호출
			} else {
				
				String birthDay = requestMap.get("bYear");
				String month = requestMap.get("bMonth");
				String day = requestMap.get("bDay");
				
				if(requestMap.get("bMonth").length() == 1){
					month = "0" + requestMap.get("bMonth");
				} 
				
				if(requestMap.get("bDay").length() == 1){
					day = "0" + requestMap.get("bDay");
				} 
				
				birthDay = birthDay + month + day; 
				
				CipherUtil cipherUtil = CipherUtil.getInstance();
				
				Map<String, Object> paramMap = new HashMap<String, Object>();
				paramMap.put("id", requestMap.get("memId"));
				paramMap.put("password", cipherUtil.AES_Encode(requestMap.get("password")));
				paramMap.put("name", requestMap.get("name"));
				paramMap.put("birthday", birthDay);
				paramMap.put("cellphone", requestMap.get("cellPhone1") + requestMap.get("cellPhone2") + requestMap.get("cellPhone3"));
				paramMap.put("nickname", requestMap.get("nickName"));
				paramMap.put("email", requestMap.get("email1")+"@"+requestMap.get("email2"));
				paramMap.put("gender", requestMap.get("gender"));
				paramMap.put("auth", CommonConstant.AUTH_MEMBER);
				
				int result = memberSerivce.insertMember(paramMap);
				
				if(result == 0){
					// TODO: 에러 페이지 호출
				} 
			}
		} catch (Exception e) {

		}
		
		return mav;
	}
	
	/**
	 * 아이디 중복 체크
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "chkValId.do", produces="text/plain;charset=UTF-8")
	public @ResponseBody String chkValId(HttpServletRequest request, HttpServletResponse response){
		
		String memId = StringUtils.defaultIfEmpty(request.getParameter("memId"), "");
		
		int idCount = 0;
		String result = "";
		
		if(!"".equals(memId)){
			idCount = memberSerivce.chkExistMemberId(memId);
			
			if(idCount == 0){
				result = "T";
			} else {
				result = "A";
			}
			
		} else {
			result = "F";
		}
		
		return result;
	}	
	
	/**
	 * 이메일 중복 체크 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "chkValEmail.do", produces="text/plain;charset=UTF-8")
	public @ResponseBody String chkValEmail(HttpServletRequest request, HttpServletResponse response){
		
		String tempEmail1 = StringUtils.defaultIfEmpty(request.getParameter("email1"), "");
		String tempEmail2 = StringUtils.defaultIfEmpty(request.getParameter("email2"), "");
		
		int idCount = 0;
		String result = "";
		
		String email = tempEmail1 + "@" + tempEmail2;
		
		if(!"".equals(email)){
			idCount = memberSerivce.chkExistMemberEmail(email);
			
			if(idCount == 0){
				result = "T";
			} else {
				result = "A";
			}
			
		} else {
			result = "F";
		}
		
		return result;
	}	
}
