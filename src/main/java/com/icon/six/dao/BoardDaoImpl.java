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
	public Map<String, String> getBoardInfo(Map<String, String> param) {
		return (Map<String, String>) selectOne("board.getBoardInfo", param);
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
	public int deleteBoard(Map<String, String> param) {
		return (int) delete("board.deleteBoard", param);
	}

	
}
