package com.icon.six.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class LoginDaoImpl extends SqlSessionDao implements LoginDao{

	@Override
	public Map<String, String> chkLoginIdPassword(String id) {
		return (Map<String, String>) selectOne("login.chkLoginIdPassword",id);
	}
		
}
