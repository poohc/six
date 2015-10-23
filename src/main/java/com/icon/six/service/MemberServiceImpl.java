package com.icon.six.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.icon.six.dao.MemberDao;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private MemberDao memberDao;
	
	@Override
	public Map<String, Object> getMemberInfo() {
		return memberDao.getMemberInfo();
	}
	
	@Override
	public List<String> getMemberAuth() {
		return memberDao.getMemberAuth();
	}
	
	@Override
	public List<Map<String, Object>> getMemberList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insertMember(Map<String, Object> memberInfo) {
		
		String result = "";
		
		int result1 = 0;
		int result2 = 0;
		
		try {
			result1 = memberDao.insertMember(memberInfo);
			result2 = memberDao.insertAuthority(memberInfo);
			
			if(result1 == 0 || result2 == 0){
				result = "fail";
			} else {
				result = "success";
			}
			
		} catch (Exception e) {
			logger.debug("========= 회원 가입 오류 트랜잭션 발생!! ==========");
		}
		
		return result;
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
