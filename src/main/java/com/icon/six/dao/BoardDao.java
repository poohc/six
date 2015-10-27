package com.icon.six.dao;

import java.util.List;
import java.util.Map;

import com.icon.six.vo.IntroBoardVo;

public interface BoardDao {
	/**
	 * 공지사항 게시판 리스트 총 개수 가져오기
	 * @param page
	 * @return
	 */
	public int selectIntroBoardCount(Map<String, Object> param);
	/**
	 * 공지사항 게시판 리스트 가져오기
	 * @param page
	 * @return
	 */
	public List<Map<String, Object>> selectIntroBoardList(Map<String, Object> param);
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
	/**
	 * 공지사항 게시판 글 수정
	 * @param paramVo
	 * @return
	 */
	public int updateIntroBoard(IntroBoardVo paramVo);
	/**
	 * 공지사항 게시판 글 삭제
	 * @param seq
	 * @return
	 */
	public int deleteIntroBoard(String seq);
}
