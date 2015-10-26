package com.icon.six.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.icon.six.vo.IntroBoardVo;

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
	public Map<String, String> getIntroBoardInfo(String seq) {
		return (Map<String, String>) selectOne("board.getIntroBoardInfo",seq);
	}
	
	@Override
	public int insertIntroBoard(IntroBoardVo paramVo) {
		return (int) insert("board.insertIntroBoard", paramVo);
	}

	
}
