package com.icon.six.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl extends SqlSessionDao implements MemberDao{

	@Override
	public Map<String, Object> getMemberInfo(String id) {
		return (Map<String, Object>) selectOne("member.getMemberInfo",id);
	}
	
	@Override
	public List<String> getMemberAuth(String id) {
		return selectList("member.getMemberAuth",id);
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
	public int insertAuthority(Map<String, Object> memberInfo) {
		return (Integer) insert("member.insertAuthority", memberInfo);
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
