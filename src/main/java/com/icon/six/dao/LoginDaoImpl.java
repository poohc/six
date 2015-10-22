package com.icon.six.dao;

import org.springframework.stereotype.Repository;

@Repository
public class LoginDaoImpl extends SqlSessionDao implements LoginDao{
	@Override
	public int chkLoginId(String id) {
		return (Integer) selectOne("login.chkLoginId",id);
	}
	@Override
	public String chkLoginPassword(String id) {
		return (String) selectOne("login.chkLoginPassword",id);
	}	
}
