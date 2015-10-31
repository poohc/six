package com.icon.six.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Service;

import com.icon.six.dao.BoardDao;
import com.icon.six.util.PagingUtil;
import com.icon.six.vo.BoardVo;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Resource
	private BoardDao boardDao;
	
	@Override
	public Map<String, Object> selectBoardList(Map<String, Object> param) {
		
		int totalCount = 0;
		Map<String, Object> resultMap = null;
		
		try {
				totalCount = boardDao.selectBoardCount(param);
				param.put("totalCount", totalCount);
				
				Map<String, Object> pageInfo = PagingUtil.setPageView(param);
				
				param.put("start", pageInfo.get("start"));
				param.put("end", pageInfo.get("end"));
				
				List<Map<String, Object>> boardInfoList = boardDao.selectBoardList(param);
				List<Map<String, Object>> addParsedBoardInfoList = new ArrayList<Map<String, Object>>();
				
				for(int i=0;i<boardInfoList.size();i++){
					Map<String, Object> addParsedMap = new HashMap<String, Object>();
					
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
					addParsedBoardInfoList.add(addParsedMap);
				}
				
				resultMap = new HashMap<>();
				resultMap.put("list", addParsedBoardInfoList);
				resultMap.put("page", pageInfo.get("page"));
				
		} catch (Exception e) {
			System.out.println("게시판 가져오기 오류");
		}
		
		return resultMap;
	}

	@Override
	public Map<String, String> getBoardInfo(Map<String, String> param) {
		return boardDao.getBoardInfo(param);
	}
	
	@Override
	public int insertBoard(BoardVo paramVo) {
		return boardDao.insertBoard(paramVo);
	}

	@Override
	public int updateBoard(BoardVo paramVo) {
		return boardDao.updateBoard(paramVo);
	}

	@Override
	public int deleteBoard(Map<String, String> param) {
		return boardDao.deleteBoard(param);
	}	
	
}
