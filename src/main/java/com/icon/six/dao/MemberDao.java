package com.icon.six.dao;

import java.util.List;
import java.util.Map;

public interface MemberDao {
	/**
	 * 회원 정보 가져오기 
	 * @return
	 */
	public Map<String, Object> getMemberInfo(String id);
	/**
	 * 회원 권한 가져오기 
	 * @return
	 */
	public List<String> getMemberAuth(String id);
	/**
	 * 회원 리스트 가져오기
	 * @return
	 */
	public List<Map<String, Object>> getMemberList();
	/**
	 * 회원 정보 입력
	 * @param memberInfo
	 * @return
	 */
	public int insertMember(Map<String, Object> memberInfo);
	/**
	 * 회원 권한 정보 입력
	 * @param memberInfo
	 * @return
	 */
	public int insertAuthority(Map<String, Object> memberInfo);
	/**
	 * 회원 정보 업데이트
	 * @param memberInfo
	 * @return
	 */
	public int updateMember(Map<String, Object> memberInfo);
	/**
	 * 회원 정보 삭제
	 * @param id
	 * @return
	 */
	public int deleteMember(String id);
	/**
	 * 회원 ID 중복 체크
	 * @param id
	 * @return
	 */
	public int chkExistMemberId(String id);
	/**
	 * 회원 이메일 중복 체크
	 * @param email
	 * @return
	 */
	public int chkExistMemberEmail(String email);
}
