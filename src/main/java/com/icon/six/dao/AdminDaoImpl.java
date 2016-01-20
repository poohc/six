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

	@Override
	public int selectRoleCount(Map<String, Object> param) {
		return (int) selectOne("admin.selectRoleCount", param);
	}

	@Override
	public int insertAuthority(Map<String, Object> param) {
		return (int) insert("admin.insertAuthority", param);
	}
	
	@Override
	public int selectRequestPointCount(Map<String, Object> param) {
		return (int) selectOne("admin.selectRequestPointCount", param);
	}
	
	@Override
	public List<Map<String, Object>> selectRequestPointList(Map<String, Object> param) {
		return selectList("admin.selectRequestPointList", param);
	}

	@Override
	public int updateSixPointConfirm(Map<String, Object> param) {
		return (int) update("admin.updateSixPointConfirm", param);
	}

	@Override
	public int selectSixCounselingCount(Map<String, Object> param) {
		return (int) selectOne("admin.selectSixCounselingCount", param);
	}

	@Override
	public List<Map<String, Object>> selectSixCounseling(Map<String, Object> param) {
		return selectList("admin.selectSixCounseling", param);
	}

	@Override
	public Map<String, Object> selectSixCounselingInfo(Map<String, Object> param) {
		return (Map<String, Object>) selectOne("admin.selectSixCounselingInfo", param);
	}

	@Override
	public int selectF1kCounselingCount(Map<String, Object> param) {
		return (int) selectOne("admin.selectF1kCounselingCount", param);
	}

	@Override
	public List<Map<String, Object>> selectF1kCounseling(Map<String, Object> param) {
		return selectList("admin.selectF1kCounseling", param);
	}

	@Override
	public Map<String, Object> selectF1kCounselingInfo(Map<String, Object> param) {
		return (Map<String, Object>) selectOne("admin.selectF1kCounselingInfo", param);
	}

}
