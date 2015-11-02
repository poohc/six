package com.icon.six.service;

import java.util.Map;

import com.icon.six.vo.BoardVo;

public interface BoardService {
	/**
	 * 게시판 리스트 가져오기
	 * @param page
	 * @return
	 */
	public Map<String, Object> selectBoardList(Map<String, Object> param);	
	/**
	 * 가져오기 
	 * @param seq
	 * @return
	 */
	public Map<String, String> getBoardInfo(Map<String, String> param);
	/**
	 * 게시판 글 쓰기
	 * @param boardVo
	 * @return
	 */
	public int insertBoard(BoardVo paramVo);
	/**
	 * 게시판 글 수정
	 * @param paramVo
	 * @return
	 */
	public int updateBoard(BoardVo paramVo);
	/**
	 * 게시판 글 삭제
	 * @param param
	 * @return
	 */
	public int deleteBoard(Map<String, String> param);
	/**
	 * 댓글 게시판 가져오기 
	 * @param param
	 * @return
	 */
	public Map<String, Object> selectBoardHirachyList(Map<String, Object> param);
}
