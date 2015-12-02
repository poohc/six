package com.icon.six.service;

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
}
