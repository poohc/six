package com.icon.six.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.icon.six.dao.F1kDao;
import com.icon.six.util.PagingUtil;

@Service("f1kService")
public class F1kServiceImpl implements F1kService{

	@Resource
	private F1kDao f1kDao;
	
	@Value("${file.upload.path}")
	private String fileUploadPath;
	
	@Override
	public Map<String, Object> selectF1kBoardList(Map<String, Object> param) {
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
				
				
				totalCount = f1kDao.selectF1kBoardCount(param);
				
				param.put("totalCount", totalCount);
				
				Map<String, Object> pageInfo = PagingUtil.setPageView(param);
				
				param.put("start", pageInfo.get("start"));
				param.put("end", pageInfo.get("end"));
				
				List<Map<String, Object>> boardInfoList = f1kDao.selectF1kBoardList(param);
				List<Map<String, Object>> addParsedBoardInfoList = new ArrayList<Map<String, Object>>();
				
				for(int i=0;i<boardInfoList.size();i++){
					Map<String, Object> addParsedMap = new HashMap<String, Object>();
					
					addParsedMap.put("NO", boardInfoList.get(i).get("NO"));
					addParsedMap.put("SEQ", boardInfoList.get(i).get("SEQ"));
					addParsedMap.put("TITLE", boardInfoList.get(i).get("TITLE"));
					addParsedMap.put("CONTENTS", boardInfoList.get(i).get("CONTENTS"));
					
					Document doc = Jsoup.parse(String.valueOf(boardInfoList.get(i).get("CONTENTS")));
					
					addParsedMap.put("PARSE_CONTENTS",  doc.text());
					addParsedMap.put("CREATE_USER_ID", boardInfoList.get(i).get("CREATE_USER_ID"));
					addParsedMap.put("CREATE_DATE", boardInfoList.get(i).get("CREATE_DATE"));
					addParsedMap.put("UPDATE_USER_ID", boardInfoList.get(i).get("UPDATE_USER_ID"));
					addParsedMap.put("UPDATE_DATE", boardInfoList.get(i).get("UPDATE_DATE"));
					addParsedMap.put("HIT_COUNT", boardInfoList.get(i).get("HIT_COUNT"));
					addParsedMap.put("IS_NOTICE", boardInfoList.get(i).get("IS_NOTICE"));
					addParsedMap.put("FILE", boardInfoList.get(i).get("FILE"));
					addParsedMap.put("THUMB_IMAGE", boardInfoList.get(i).get("THUMB_IMAGE"));
					if(param.get("stockName")!=null){
						addParsedMap.put("STOCK_NAME", boardInfoList.get(i).get("STOCK_NAME"));
					}
					addParsedBoardInfoList.add(addParsedMap);
				}
				
				resultMap = new HashMap<>();
				resultMap.put("list", addParsedBoardInfoList);
				resultMap.put("page", pageInfo.get("page"));
				
		} catch (Exception e) {
			System.out.println("F1K 게시판 가져오기 오류");
		}
		
		return resultMap;
	}

	@Override
	public int insertF1kCounseling(Map<String, Object> param) {
		return f1kDao.insertF1kCounseling(param);
	}
	
}
