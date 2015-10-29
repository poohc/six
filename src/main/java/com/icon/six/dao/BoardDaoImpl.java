package com.icon.six.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.icon.six.vo.BoardVo;

@Repository
public class BoardDaoImpl extends SqlSessionDao implements BoardDao {
	
	@Override
	public int selectIntroBoardCount(Map<String, Object> param) {
		return (int) selectOne("board.selectIntroBoardCount", param);
	}
	
	@Override
	public List<Map<String, Object>> selectIntroBoardList(Map<String, Object> param) {
		return (List<Map<String, Object>>) selectList("board.selectIntroBoard", param);
	}

	@Override
	public Map<String, String> getIntroBoardInfo(Map<String, String> param) {
		return (Map<String, String>) selectOne("board.getIntroBoardInfo", param);
	}
	
	@Override
	public int insertIntroBoard(BoardVo paramVo) {
		return (int) insert("board.insertIntroBoard", paramVo);
	}

	@Override
	public int updateIntroBoard(BoardVo paramVo) {
		return (int) update("board.updateIntroBoard", paramVo);
	}

	@Override
	public int deleteIntroBoard(Map<String, String> param) {
		return (int) delete("board.deleteIntroBoard", param);
	}

	
}
