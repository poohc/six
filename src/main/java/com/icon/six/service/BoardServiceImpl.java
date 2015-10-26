package com.icon.six.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.icon.six.dao.BoardDao;
import com.icon.six.util.PagingUtil;
import com.icon.six.vo.IntroBoardVo;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Resource
	private BoardDao boardDao;
	
	@Override
	public Map<String, Object> selectIntroBoardList(Map<String, Object> param) {
		
		int totalCount = 0;
		Map<String, Object> resultMap = null;
		
		try {
				totalCount = boardDao.selectIntroBoardCount(param);
				param.put("totalCount", totalCount);
				
				Map<String, Object> pageInfo = PagingUtil.setPageView(param);
				
				param.put("start", pageInfo.get("start"));
				param.put("end", pageInfo.get("end"));
				
				List<Map<String, Object>> boardInfoMap = boardDao.selectIntroBoardList(param);
				
				resultMap = new HashMap<>();
				resultMap.put("list", boardInfoMap);
				resultMap.put("page", pageInfo.get("page"));
				
		} catch (Exception e) {
			System.out.println("게시판 가져오기 오류");
		}
		
		return resultMap;
	}

	@Override
	public Map<String, String> getIntroBoardInfo(String seq) {
		return boardDao.getIntroBoardInfo(seq);
	}
	
	@Override
	public int insertIntroBoard(IntroBoardVo paramVo) {
		return boardDao.insertIntroBoard(paramVo);
	}	
	
}
