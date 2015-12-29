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
	 * @param boardNameArray
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
	 * 댓글 게시판, 페이징 가져오기
	 * @param param
	 * @return
	 */
	public Map<String, Object> selectBoardReplyList(Map<String, Object> param);
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
	 * 실시간 증시 일정 가져오기
	 * @return
	 */
	public List<Map<String, Object>> selectRealStockList();
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
	 * 파트너 게시판 리스트 가져오기
	 * @param param
	 * @return
	 */
	public Map<String, Object> selectPartnerBoardList(Map<String, Object> param);
	/**
	 * 파트너 게시판 정보 가져오기
	 * @param param
	 * @return
	 */
	public Map<String, Object> selectPartnerBoardInfo(Map<String, Object> param);
	/**
	 * 파트너 게시판 글 쓰기
	 * @param param
	 * @return
	 */
	public int insertSixPartnerBoard(Map<String, Object> param);
	/**
	 * 파트너 게시판 글 업데이트 하기
	 * @param param
	 * @return
	 */
	public int updateSixPartnerBoard(Map<String, Object> param);
	/**
	 * 파트너 게시판 글 삭제하기
	 * @param seq
	 * @return
	 */
	public int deleteSixPartnerBoard(Map<String, Object> param);
	/**
	 * 파트너 게시판 조회수 업데이트 하기
	 * @param param
	 * @return
	 */
	public int updateSixPartnerBoardHitCount(Map<String, Object> param);
	/**
	 * 파트너 통계 구하기
	 * @return
	 */
	public Map<String, Object> selectSixPartnerBoardStat(String id);
	/**
	 * 포인트 충전 내역 가져오기
	 * @param param
	 * @return
	 */
	public List<Map<String, Object>> selectSixPointCharge(Map<String, Object> param);
	/**
	 * 포인트 신청하기
	 * @param param
	 * @return
	 */
	public int insertSixPointCharge(Map<String, Object> param);
	/**
	 * 포인트 충전 내역 업데이트 하기
	 * @param param
	 * @return
	 */
	public int updateSixPointCharge(Map<String, Object> param);
	/**
	 * 포인트 내역 가져오기
	 * @param param
	 * @return
	 */
	public List<Map<String, Object>> selectSixPoint(Map<String, Object> param);
	/**
	 * 포인트 내역 추가 하기
	 * @param param
	 * @return
	 */
	public int insertSixPoint(Map<String, Object> param);
}
