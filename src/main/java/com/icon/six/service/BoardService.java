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
	 * 정보거래소 게시판 리스트 가져오기
	 * @param param
	 * @return
	 */
	public Map<String, Object> selectMarketBoardList(Map<String, Object> param);
	/**
	 * 메인 게시판 리스트 가져오기
	 * @param page
	 * @return
	 */
	public Map<String, Object> selectMainBoardList(String[] boardNameArray);
	/**
	 * 게시글 상세보기 정보 가져오기
	 * @param param
	 * @return
	 */
	public Map<String, Object> selectBoardViewInfo(Map<String, Object> param);
	/**
	 * 게시글 업데이트 정보 가져오기
	 * @param param
	 * @return
	 */
	public Map<String, Object> selectBoardUpdateInfo(Map<String, Object> param);
	/**
	 * 게시판 글 쓰기 처리 
	 * @param param
	 * @return
	 */
	public int insertBoardProcess(Map<String, Object> param);
	/**
	 * 게시판 글 업데이트 처리
	 * @param param
	 * @return
	 */
	public int updateBoardProcess(Map<String, Object> param);
	/**
	 * 게시판 글 삭제 처리
	 * @param param
	 * @return
	 */
	public int deleteBoardProcess(Map<String, Object> param);
	/**
	 * 댓글 달기 INSERT 처리 
	 * @param param
	 * @return
	 */
	public Map<String, Object> insertReplyProcess(Map<String, Object> param); 
	/**
	 * 댓글 달기 삭제 처리 
	 * @param param
	 * @return
	 */
	public Map<String, Object> deleteReplyProcess(Map<String, Object> param); 
	/**
	 * 댓글 달기 업데이트 처리
	 * @param param
	 * @return
	 */
	public Map<String, Object> updateReplyProcess(Map<String, Object> param);
	/**
	 * 게시글 가져오기 
	 * @param seq
	 * @return
	 */
	public Map<String, Object> getBoardInfo(Map<String, Object> param);	
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
	public int deleteBoard(Map<String, Object> param);
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
	/**
	 * 증시 정보 넣기
	 * @param param
	 * @return
	 */
	public int insertScheduleStock(Map<String, Object> param);
	/**
	 * 증시 정보 가져오기
	 * @return
	 */
	public Map<String, Object> selectScheduleStock();
	/**
	 * 실시간 증시 일정 가져오기
	 * @return
	 */
	public List<Map<String, Object>> selectRealStockList();
}
