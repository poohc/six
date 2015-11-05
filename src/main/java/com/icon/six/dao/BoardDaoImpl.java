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
		return (List<Map<String, Object>>) selectList("board.selectBoardList", param);
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
	
}
