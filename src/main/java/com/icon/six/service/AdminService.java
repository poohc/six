package com.icon.six.service;

import java.util.Map;

public interface AdminService {
	/**
	 * 파트너 신청 리스트 가져오기
	 * @param page
	 * @return
	 */
	public Map<String, Object> selectJoinPartnerList(Map<String, Object> param);	
}
