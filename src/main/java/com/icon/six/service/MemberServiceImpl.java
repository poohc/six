package com.icon.six.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.icon.six.dao.MemberDao;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Resource
	private MemberDao memberDao;
	
	@Override
	public List<String> getMemberInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> getMemberList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertMember(Map<String, Object> memberInfo) {
		return memberDao.insertMember(memberInfo);
	}

	@Override
	public int updateMember(Map<String, Object> memberInfo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int chkExistMemberId(String id) {
		return memberDao.chkExistMemberId(id);
	}

	@Override
	public int chkExistMemberEmail(String email) {
		return memberDao.chkExistMemberEmail(email);
	}
	
}
