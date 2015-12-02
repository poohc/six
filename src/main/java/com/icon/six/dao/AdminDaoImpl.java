package com.icon.six.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl extends SqlSessionDao implements AdminDao{

	@Override
	public int selectJoinPartnerCount(Map<String, Object> param) {
		return (int) selectOne("admin.selectJoinPartnerCount",param);
	}

	@Override
	public List<Map<String, Object>> selectJoinPartnerList(Map<String, Object> param) {
		return selectList("admin.selectJoinPartnerList",param);
	}

	@Override
	public Map<String, Object> selectPartnerInfo(String seq) {
		return (Map<String, Object>) selectOne("admin.selectPartnerInfo",seq);
	}

	@Override
	public int updatePartner(Map<String, Object> param) {
		return (int) update("admin.updatePartner", param);
	}

}
