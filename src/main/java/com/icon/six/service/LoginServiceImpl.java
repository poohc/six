package com.icon.six.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.icon.six.dao.LoginDao;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	
	@Resource
	private LoginDao loginDao;

	@Override
	public Map<String, String> chkLoginIdPassword(String id) {
		return loginDao.chkLoginIdPassword(id);
	}
}
