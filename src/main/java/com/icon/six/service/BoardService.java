package com.icon.six.service;

import java.util.List;
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
	 * 댓글 게시글 수정
	 * @param paramVo
	 * @return
	 */
	public int updateBoardAddReply(Map<String, Object> param);
	/**
	 * 댓글 게시글 삭제시 수정
	 * @param seq
	 * @return
	 */
	public int updateBoardDelReply(Map<String, Object> param);
	/**
	 * 게시판 글 삭제
	 * @param param
	 * @return
	 */
	public int deleteBoard(Map<String, String> param);
	/**
	 * 댓글 게시글 SEQ 모두 가져오기
	 * @param param
	 * @return
	 */
	public List<String> selectBoardReplySeq(Map<String, Object> param);
	/**
	 * 댓글 게시판 리스트 총 개수 가져오기
	 * @param page
	 * @return
	 */
	public int selectBoardReplyCount(Map<String, Object> param);
	/**
	 * 댓글 게시판, 페이징 가져오기
	 * @param page
	 * @return
	 */
	public Map<String, Object> selectBoardReplyList(Map<String, Object> param);
	/**
	 * 게시판 댓글 삭제
	 * @param seq
	 * @return
	 */
	public int deleteBoardReply(Map<String, Object> param);
}
