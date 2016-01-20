package com.icon.six.service;

import java.util.Map;

public interface F1kService {
	/**
	 * 게시판 리스트 가져오기
	 * @param page
	 * @return
	 */
	public Map<String, Object> selectF1kBoardList(Map<String, Object> param);
	/**
	 * F1K 상담 게시판 INSERT
	 * @param param
	 * @return
	 */
	public int insertF1kCounseling(Map<String, Object> param);
}
