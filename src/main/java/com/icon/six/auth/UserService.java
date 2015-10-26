package com.icon.six.auth;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.icon.six.service.MemberService;
import com.icon.six.util.CipherUtil;

public class UserService implements UserDetailsService{

	@Resource
	MemberService memberService;
	
	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
		
		Map<String, Object> userInfo = memberService.getMemberInfo(userId);
		UserDetails user = null;
		
		if(userInfo == null){
			throw new UsernameNotFoundException("해당 아이디를 찾지 못했습니다. : " + userId);
		} else {
			
			Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
			
			List<String> authList = memberService.getMemberAuth(userId);
			
			if(authList == null){
				throw new UsernameNotFoundException("해당 아이디의 권한을 찾지 못했습니다. : " + userId);
			} else {
				
				for(String auth : authList){
					roles.add(new SimpleGrantedAuthority(auth));
				}
				
				CipherUtil cipher = CipherUtil.getInstance();
				
				try {
					user = new User(userId, cipher.AES_Decode(String.valueOf(userInfo.get("password"))), roles);
				} catch (Exception e) {
					e.printStackTrace();
				} 
			}			
		}		
		
		return user;
	}

}
