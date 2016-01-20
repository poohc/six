package com.icon.six.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class F1kDaoImpl extends SqlSessionDao implements F1kDao{

	final String MAPPER_NAME = "f1k.";
	
	@Override
	public int selectF1kBoardCount(Map<String, Object> param) {
		return (int) selectOne(MAPPER_NAME + "selectF1kBoardCount", param);
	}

	@Override
	public List<Map<String, Object>> selectF1kBoardList(Map<String, Object> param) {
		return selectList(MAPPER_NAME + "selectF1kBoardList", param);
	}

	@Override
	public int insertF1kCounseling(Map<String, Object> param) {
		return (int) insert(MAPPER_NAME + "insertF1kCounseling", param);
	}

}
