package com.icon.six.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.icon.six.service.MemberService;
import com.icon.six.util.CipherUtil;

public class LoginAuthenticate implements AuthenticationProvider{

	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	MemberService memberService;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String userId = (String) authentication.getPrincipal();
		String userPw = (String) authentication.getCredentials();
		
		logger.debug("=사용자가 입력한 정보 : ID : " + userId + ", PW : " + userPw);
		
		Map<String, Object> memberInfo = memberService.getMemberInfo(userId);
		
		CipherUtil cipher = CipherUtil.getInstance();
		
		if(!memberInfo.isEmpty()){
			try {
				//정상 로그인
				if(userId.equals(memberInfo.get("id")) && userPw.equals(cipher.AES_Decode(memberInfo.get("password").toString()))){
					logger.debug("정상 로그인");
					
					List<String> memberAuthList = memberService.getMemberAuth(userId);
					
					if(!memberAuthList.isEmpty()){
						List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
						
						for(String auth : memberAuthList){
							roles.add(new SimpleGrantedAuthority(auth));
						}
						
					} else {
						logger.debug("권한 가져오기 오류!!");
					}
				//로그인 실패
				} else {
					
				}
			} catch (Exception e) {
				logger.debug("인증 에러!!");
			} 
		}
		
		
		return null;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
