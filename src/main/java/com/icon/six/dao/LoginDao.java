package com.icon.six.dao;

import java.util.Map;

public interface LoginDao {
	/**
	 * 회원 ID,패스워드 체크
	 * @param id
	 * @return
	 */
	public Map<String, String> chkLoginIdPassword(String id);	
}
