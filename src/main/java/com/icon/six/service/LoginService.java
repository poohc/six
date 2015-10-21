package com.icon.six.service;

public interface LoginService {
	/**
	 * 회원 ID 체크
	 * @param id
	 * @return
	 */
	public int chkLoginId(String id);
	/**
	 * 회원 패스워드 체크
	 * @param email
	 * @return
	 */
	public String chkLoginPassword(String id);
}
