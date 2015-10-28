package com.icon.six.auth;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUserDetails implements UserDetails{

	private String id;
	private String password;
	private String email;
	private String nickName;
	private String name;
	private List<GrantedAuthority> authorities;
	
	public CustomUserDetails(String id, String password, String email, String nickName, String name, List<GrantedAuthority> authorities){
		this.id = id;
		this.password = password;
		this.email = email;
		this.nickName = nickName;
		this.authorities = authorities;
		this.name = name;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	public String getEmail(){
		return email;
	}
	
	public String getNickName(){
		return nickName;
	}
	
	public String getName(){
		return name;
	}
	
	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return id;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

}
