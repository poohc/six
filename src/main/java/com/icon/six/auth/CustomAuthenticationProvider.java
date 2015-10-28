package com.icon.six.auth;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.icon.six.service.MemberService;
import com.icon.six.util.CipherUtil;

public class CustomAuthenticationProvider implements AuthenticationProvider{
	
	@Resource
	private MemberService memberService;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String userId = (String)authentication.getPrincipal();		
		String userPw = (String)authentication.getCredentials();
		UsernamePasswordAuthenticationToken result = null;
		
		System.out.println("userId : " + userId + ", userPw : " + userPw);
		
		try {
			Map<String, Object> userInfo = memberService.getMemberInfo(userId);	
			
			if(userInfo != null){
				
				CipherUtil cipher = CipherUtil.getInstance();
				
				if(userId.equals(userInfo.get("id")) && userPw.equals(cipher.AES_Decode(String.valueOf(userInfo.get("password"))))){
					
					List<String> authList = memberService.getMemberAuth(userId);
					
					if(authList!=null){
						
						List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
						
						for(String auth : authList){
							roles.add(new SimpleGrantedAuthority(auth));
						}
						
						result = new UsernamePasswordAuthenticationToken(userId, userPw, roles);
						result.setDetails(new CustomUserDetails(userId, userPw, String.valueOf(userInfo.get("email")), String.valueOf(userInfo.get("nickName")), String.valueOf(userInfo.get("name")), roles));
						
					} else {
						System.out.println("권한 데이터 없음");
					}
					
				} else {
					System.out.println("잘못된 패스워드");
				}
				
			} else {
				System.out.println("잘못된 ID");
			}
			
		} catch (Exception e) {
			System.out.println("권한 인증 중 오류");
		}
		
		return result;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
