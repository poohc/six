package com.icon.six.dao;

import java.util.List;
import java.util.Map;

import com.icon.six.vo.BoardVo;

public interface BoardDao {
	/**
	 * 게시판 리스트 총 개수 가져오기
	 * @param param
	 * @return
	 */
	public int selectBoardCount(Map<String, Object> param);
	/**
	 * 게시판 리스트 가져오기
	 * @param param
	 * @return
	 */
	public List<Map<String, Object>> selectBoardList(Map<String, Object> param);
	/**
	 * 정보거래소 게시판 리스트 가져오기
	 * @param param
	 * @return
	 */
	public List<Map<String, Object>> selectMarketBoardList(Map<String, Object> param);
	/**
	 * 게시판 정보 가져오기 
	 * @param param
	 * @return
	 */
	public Map<String, Object> getBoardInfo(Map<String, Object> param); 
	/**
	 * 게시판 글 쓰기
	 * @param paramVo
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
	 * @param param
	 * @return
	 */
	public int updateBoardAddReply(Map<String, Object> param);
	/**
	 * 댓글 게시글 삭제시 수정
	 * @param param
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
	 * @param param
	 * @return
	 */
	public int selectBoardReplyCount(Map<String, Object> param);
	/**
	 * 댓글 게시판 리스트 가져오기
	 * @param param
	 * @return
	 */
	public List<Map<String, Object>> selectBoardReplyList(Map<String, Object> param);
	/**
	 * 게시판 댓글 삭제
	 * @param param
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
	 * 약관 가져오기
	 * @return
	 */
	public List<Map<String, Object>> selectSixTerms(String boardName);
	/**
	 * 회원 정보 가져오기
	 * @param id
	 * @return
	 */
	public Map<String, Object> selectMemberInfo(String id);
	/**
	 * 식스 파트너 입력하기
	 * @param param
	 * @return
	 */
	public int insertSixPartner(Map<String, Object> param);
	/**
	 * 공통 코드 가져오기
	 * @param cdType
	 * @return
	 */
	public List<Map<String, Object>> selectCommonCode(String cdType);
	/**
	 * 파트너 리스트 가져오기
	 * @param param
	 * @return
	 */
	public List<Map<String, Object>> selectPartnerList(Map<String, Object> param);
	/**
	 * 파트너 게시판 리스트 총 개수 가져오기
	 * @param param
	 * @return
	 */
	public int selectPartnerBoardCount(Map<String, Object> param);
	/**
	 * 파트너 게시판 리스트 가져오기
	 * @param param
	 * @return
	 */
	public List<Map<String, Object>> selectPartnerBoardList(Map<String, Object> param);
	/**
	 * 파트너 게시판 정보 가져오기
	 * @param param
	 * @return
	 */
	public Map<String, Object> selectPartnerBoardInfo(Map<String, Object> param);
	
}
