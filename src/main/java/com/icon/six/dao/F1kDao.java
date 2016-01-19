package com.icon.six.dao;

import java.util.List;
import java.util.Map;

public interface F1kDao {
	/**
	 * 게시판 리스트 총 개수 가져오기
	 * @param param
	 * @return
	 */
	public int selectF1kBoardCount(Map<String, Object> param);
	/**
	 * 게시판 리스트 가져오기
	 * @param param
	 * @return
	 */
	public List<Map<String, Object>> selectF1kBoardList(Map<String, Object> param); 
}
