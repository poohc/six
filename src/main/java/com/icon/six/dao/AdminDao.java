package com.icon.six.dao;

import java.util.List;
import java.util.Map;

public interface AdminDao {
	/**
	 * 파트너 신청 리스트 총 개수 가져오기
	 * @param page
	 * @return
	 */
	public int selectJoinPartnerCount(Map<String, Object> param);
	/**
	 * 파트너 신청 리스트 가져오기
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> selectJoinPartnerList(Map<String, Object> param);	
}
