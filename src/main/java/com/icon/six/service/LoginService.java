package com.icon.six.service;

import java.util.Map;

public interface LoginService {
	/**
	 * 회원 ID,패스워드 체크
	 * @param id
	 * @return
	 */
	public Map<String, String> chkLoginIdPassword(String id);	
}
