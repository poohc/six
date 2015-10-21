package com.icon.six.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("memberDao")
public class MemberDaoImpl extends SqlSessionDao implements MemberDao{

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
		return (Integer) insert("member.insertMember", memberInfo);		
	}

	@Override
	public int updateMember(Map<String, Object> memberInfo) {
		return (Integer) update("member.updateMember", memberInfo);
	}

	@Override
	public int deleteMember(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int chkExistMemberId(String id) {
		return (Integer) selectOne("member.chkExistMemberId",id);
	}

	@Override
	public int chkExistMemberEmail(String email) {
		return (Integer) selectOne("member.chkExistMemberEmail",email);
	}		
}
