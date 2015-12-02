package com.icon.six.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.icon.six.dao.AdminDao;
import com.icon.six.util.PagingUtil;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Resource
	private AdminDao adminDao;
	
	@Override
	public Map<String, Object> selectJoinPartnerList(Map<String, Object> param) {
		int totalCount = 0;
		Map<String, Object> resultMap = null;
		
		try {
			
				if(param.get("currentPage")==null){
					param.put("currentPage", "1");
				}
				
				if(param.get("searchText")!=null){
					if("title".equals(param.get("searchOption"))){
						param.put("title", param.get("searchText"));
					} else if("contents".equals(param.get("searchOption"))){
						param.put("contents", param.get("searchText"));
					}
				}
				param.put("ref","0");
				
				
				totalCount = adminDao.selectJoinPartnerCount(param);
				
				param.put("totalCount", totalCount);
				
				Map<String, Object> pageInfo = PagingUtil.setPageView(param);
				
				param.put("start", pageInfo.get("start"));
				param.put("end", pageInfo.get("end"));
				
				List<Map<String, Object>> boardInfoList = adminDao.selectJoinPartnerList(param);
				resultMap = new HashMap<>();
				resultMap.put("list", boardInfoList);
				resultMap.put("page", pageInfo.get("page"));
				
		} catch (Exception e) {
			//TODO 에러 처리
			System.out.println("파트너 신청 게시판 가져오기 오류");
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> selectPartnerInfo(String seq) {
		return adminDao.selectPartnerInfo(seq);
	}

	@Override
	public int updatePartner(Map<String, Object> param) {
		return adminDao.updatePartner(param);
	}

}
