package com.icon.six.service;

import java.util.Map;

import com.icon.six.vo.IntroBoardVo;

public interface BoardService {
	/**
	 * 공지사항 게시판 리스트 가져오기
	 * @param page
	 * @return
	 */
	public Map<String, Object> selectIntroBoardList(Map<String, Object> param);	
	/**
	 * 공지사항 가져오기 
	 * @param seq
	 * @return
	 */
	public Map<String, String> getIntroBoardInfo(String seq);
	/**
	 * 공지사항 게시판 글 쓰기
	 * @param introBoardVo
	 * @return
	 */
	public int insertIntroBoard(IntroBoardVo paramVo);
}
