package com.icon.six.service;

import java.util.Map;

import com.icon.six.vo.BoardVo;

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
	public Map<String, String> getIntroBoardInfo(Map<String, String> param);
	/**
	 * 공지사항 게시판 글 쓰기
	 * @param boardVo
	 * @return
	 */
	public int insertIntroBoard(BoardVo paramVo);
	/**
	 * 공지사항 게시판 글 수정
	 * @param paramVo
	 * @return
	 */
	public int updateIntroBoard(BoardVo paramVo);
	/**
	 * 공지사항 게시판 글 삭제
	 * @param seq
	 * @return
	 */
	public int deleteIntroBoard(Map<String, String> param);
}
