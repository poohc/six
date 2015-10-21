package com.icon.six.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.icon.six.dao.LoginDao;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	
	@Resource
	LoginDao loginDao;
	
	@Override
	public int chkLoginId(String id) {
		return loginDao.chkLoginId(id);
	}
	@Override
	public String chkLoginPassword(String id) {
		return loginDao.chkLoginPassword(id);
	}
	
}
