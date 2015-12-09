package com.icon.six.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.icon.six.vo.BoardVo;

@Repository
public class BoardDaoImpl extends SqlSessionDao implements BoardDao {
	
	@Override
	public int selectBoardCount(Map<String, Object> param) {
		return (int) selectOne("board.selectBoardCount", param);
	}
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> param) {
		return selectList("board.selectBoardList", param);
	}
	
	@Override
	public List<Map<String, Object>> selectMarketBoardList(Map<String, Object> param) {
		return selectList("board.selectMarketBoardList",param);
	}
	
	@Override
	public Map<String, Object> getBoardInfo(Map<String, Object> param) {
		return (Map<String, Object>) selectOne("board.getBoardInfo", param);
	}
	
	@Override
	public int insertBoard(BoardVo paramVo) {
		return (int) insert("board.insertBoard", paramVo);
	}

	@Override
	public int updateBoard(BoardVo paramVo) {
		return (int) update("board.updateBoard", paramVo);
	}
	
	@Override
	public int updateBoardAddReply(Map<String, Object> param) {
		return (int) update("board.updateBoardAddReply", param);
	}
	
	@Override
	public int updateBoardDelReply(Map<String, Object> param) {
		return (int) update("board.updateBoardDelReply", param);
	}
	
	@Override
	public int deleteBoard(Map<String, Object> param) {
		return (int) delete("board.deleteBoard", param);
	}

	@Override
	public List<String> selectBoardReplySeq(Map<String, Object> param) {
		return selectList("board.selectBoardReplySeq",param);
	}

	@Override
	public int selectBoardReplyCount(Map<String, Object> param) {
		return (int) selectOne("board.selectBoardReplyCount",param);
	}

	@Override
	public List<Map<String, Object>> selectBoardReplyList(Map<String, Object> param) {
		return selectList("board.selectBoardReplyList",param);
	}

	@Override
	public int deleteBoardReply(Map<String, Object> param) {
		return (int) delete("board.deleteBoardReply", param);
	}

	@Override
	public int insertScheduleStock(Map<String, Object> param) {
		return (int) insert("board.insertScheduleStock",param);
	}

	@Override
	public Map<String, Object> selectScheduleStock() {
		return (Map<String, Object>) selectOne("board.selectScheduleStock");
	}

	@Override
	public List<Map<String, Object>> selectSixTerms(String boardName) {
		return selectList("board.selectSixTerms",boardName);
	}

	@Override
	public Map<String, Object> selectMemberInfo(String id) {
		return (Map<String, Object>) selectOne("board.selectMemberInfo",id);
	}

	@Override
	public int insertSixPartner(Map<String, Object> param) {
		return (int) insert("board.insertSixPartner", param);
	}

	@Override
	public List<Map<String, Object>> selectCommonCode(String cdType) {
		return selectList("board.selectCommonCode", cdType);
	}
	
	@Override
	public List<Map<String, Object>> selectPartnerList(Map<String, Object> param) {
		return selectList("board.selectPartnerList", param);
	}
	
	@Override
	public int selectPartnerBoardCount(Map<String, Object> param) {
		return (int) selectOne("board.selectPartnerBoardCount", param);
	}

	@Override
	public List<Map<String, Object>> selectPartnerBoardList(Map<String, Object> param) {
		return selectList("board.selectPartnerBoardList", param);
	}

	@Override
	public Map<String, Object> selectPartnerBoardInfo(Map<String, Object> param) {
		return (Map<String, Object>) selectOne("board.selectPartnerBoardInfo", param);
	}

	@Override
	public int insertSixPartnerBoard(Map<String, Object> param) {
		return (int) insert("board.insertSixPartnerBoard", param);
	}

	@Override
	public int updateSixPartnerBoard(Map<String, Object> param) {
		return (int) update("board.updateSixPartnerBoard", param);
	}

	@Override
	public int deleteSixPartnerBoard(String seq) {
		return (int) delete("board.deleteSixPartnerBoard", seq);
	}
	
}
