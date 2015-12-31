package com.icon.six.service;

import java.util.List;
import java.util.Map;

public interface AdminService {
	/**
	 * 파트너 신청 리스트 가져오기
	 * @param page
	 * @return
	 */
	public Map<String, Object> selectJoinPartnerList(Map<String, Object> param);	
	/**
	 * 파트너 정보 보기 
	 * @param seq
	 * @return
	 */
	public Map<String, Object> selectPartnerInfo(String seq);	
	/**
	 * 파트너 업데이트 하기
	 * @param param
	 * @return
	 */
	public int updatePartner(Map<String, Object> param);
	/**
	 * ROLE 존재 여부 가져오기
	 * @param param
	 * @return
	 */
	public int selectRoleCount(Map<String, Object> param);
	/**
	 * ROLE 추가하기
	 * @param param
	 * @return
	 */
	public int insertAuthority(Map<String, Object> param);
	/**
	 * 신청 포인트 리스트 가져오기
	 * @param param
	 * @return
	 */
	public Map<String, Object> selectRequestPointList(Map<String, Object> param);
	/**
	 * 신청 포인트 승인/취소 하기
	 * @param param
	 * @return
	 */
	public int updateSixPointConfirm(Map<String, Object> param);
}
