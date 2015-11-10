package com.icon.six.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.icon.six.constant.CommonConstant;
import com.icon.six.dao.BoardDao;
import com.icon.six.util.PagingUtil;
import com.icon.six.vo.BoardVo;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Resource
	private BoardDao boardDao;
	
	@Value("${file.upload.path}")
	private String fileUploadPath;
	
	@Override
	public int selectBoardReplyCount(Map<String, Object> param) {
		return boardDao.selectBoardReplyCount(param);
	}
	
	@Override
	public Map<String, Object> selectBoardList(Map<String, Object> param) {
		
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
				
				
				totalCount = boardDao.selectBoardCount(param);
				
				param.put("totalCount", totalCount);
				
				Map<String, Object> pageInfo = PagingUtil.setPageView(param);
				
				param.put("start", pageInfo.get("start"));
				param.put("end", pageInfo.get("end"));
				
				List<Map<String, Object>> boardInfoList = boardDao.selectBoardList(param);
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
	public Map<String, Object> selectMarketBoardList(Map<String, Object> param) {
		
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
				
				totalCount = boardDao.selectBoardCount(param);
				
				param.put("totalCount", totalCount);
				
				Map<String, Object> pageInfo = PagingUtil.setPageView(param);
				
				param.put("start", pageInfo.get("start"));
				param.put("end", pageInfo.get("end"));
				
				List<Map<String, Object>> boardInfoList = boardDao.selectMarketBoardList(param);
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
					addParsedMap.put("PARTNER_NAME", boardInfoList.get(i).get("PARTNER_NAME"));
					addParsedMap.put("TYPE_NAME", boardInfoList.get(i).get("TYPE_NAME"));
					addParsedMap.put("PRICE", boardInfoList.get(i).get("PRICE"));
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
	public Map<String, Object> selectMainBoardList() {
		
		//메인 화면 게시판 게시물 가져오기
		String[] boardNameArray = {CommonConstant.MARKETFREE_BOARD,CommonConstant.MARKETISTRATEGY_BOARD,
				 			       CommonConstant.MARKETANALYSIS_BOARD,CommonConstant.MARKETPAY_BOARD,
				 			       CommonConstant.MARKETBARGAIN_BOARD,CommonConstant.MARKETADV_BOARD,
				 			       CommonConstant.LEARNCENTER_BOARD,CommonConstant.LEARNSTRATEGY_BOARD,
				 			       CommonConstant.SNOTE_BOARD,CommonConstant.INFOSECTECH_BOARD,
				 			       CommonConstant.INFOSTOCKBRIEFING_BOARD,CommonConstant.INFOGINTERVIEW_BOARD};
		
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("start", 0);
		param.put("end", 5);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		for(String boardName : boardNameArray){
			List<Map<String, Object>> boardList = new ArrayList<Map<String, Object>>();
			param.put("boardName", boardName);
			boardList = boardDao.selectBoardList(param);
			
			resultMap.put(boardName, boardList);
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectBoardViewInfo(Map<String, Object> param) {
		
	Map<String, Object> resultMap = new HashMap<String, Object>();	
		
	if(param.get("seq")!=null){
		
		//Hit Count 업데이트
		BoardVo paramVo = new BoardVo();
		paramVo.setHitCount("1");
		paramVo.setSeq(String.valueOf(param.get("seq")));
		paramVo.setUpdateUserId(SecurityContextHolder.getContext().getAuthentication().getName());
		paramVo.setBoardName(String.valueOf(param.get("boardName")));
		boardDao.updateBoard(paramVo);
		
		//게시글 정보 가져오기
		Map<String, Object> boardInfo = boardDao.getBoardInfo(param);
		
		resultMap.put("boardInfo", boardInfo);
		
		//파일 목록 리스트 화
		if(boardInfo.get("FILE")!=null){
			
			String file = StringUtils.defaultIfEmpty(String.valueOf(boardInfo.get("FILE")), ""); 
			
			if(!"".equals(file)){
				String[] fileArray = file.split(",");				
				List<Map<String, String>> fileList = new ArrayList<Map<String, String>>();
				
				if(fileArray.length == 1){
					Map<String, String> fileMap = new HashMap<String, String>();
					fileMap.put("rFile", file);
					file = file.substring(file.indexOf("__"), file.length()).replace("__", "");
					fileMap.put("file", file);
					fileList.add(fileMap);
				} else {
					for(String fileName : fileArray){
						Map<String, String> fileMap = new HashMap<String, String>();
						fileMap.put("rFile", fileName);
						fileName = fileName.substring(fileName.indexOf("__"), fileName.length()).replace("__", "");
						fileMap.put("file", fileName);	
						fileList.add(fileMap);
					}
				}			
				resultMap.put("fileList",fileList);
			}			
		}
		
		String currentPage = "";
		String seq = "";
		
		//댓글 리스트 가져오기
		if(param.get("currentPage") == null){
			currentPage = "1";
		} else {
			currentPage = String.valueOf(param.get("currentPage"));
		}
		
		if(param.get("seq") != null){
			seq = String.valueOf(param.get("seq"));
		} 
		
		param.put("ref", seq);
		List<String> refList = new ArrayList<String>();
		refList.add(seq);
		param.put("list", refList);
		
		//재귀함수 호출
		List<String> seqList = getReplyList(param,new ArrayList<String>());
		
		seqList.add(seq);
		param.put("list", seqList);
		param.put("currentPage", currentPage);
		Map<String, Object> boardInfoMap = selectBoardReplyList(param);
		
		resultMap.put("currentPage", currentPage);
		resultMap.put("boardInfoMap", boardInfoMap);
		
	}
		
	return resultMap;
	
	}
	
	@Override
	public Map<String, Object> selectBoardUpdateInfo(Map<String, Object> param) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		if(param.get("seq")!=null){
			
			Map<String, Object> boardInfo = boardDao.getBoardInfo(param);
			resultMap.put("boardInfo", boardInfo);
			
			//파일 목록 리스트 화
			if(boardInfo.get("FILE")!=null){
				
				String file = StringUtils.defaultIfEmpty(String.valueOf(boardInfo.get("FILE")), ""); 
				
				if(!"".equals(file)){
					String[] fileArray = file.split(",");				
					List<Map<String, String>> fileList = new ArrayList<Map<String, String>>();
					
					if(fileArray.length == 1){
						Map<String, String> fileMap = new HashMap<String, String>();
						fileMap.put("rFile", file);
						file = file.substring(file.indexOf("__"), file.length()).replace("__", "");
						fileMap.put("file", file);
						fileList.add(fileMap);
						resultMap.put("file",file);
					} else {
						for(String fileName : fileArray){
							Map<String, String> fileMap = new HashMap<String, String>();
							fileMap.put("rFile", fileName);
							fileName = fileName.substring(fileName.indexOf("__"), fileName.length()).replace("__", "");
							fileMap.put("file", fileName);	
							fileList.add(fileMap);
						}
					}			
					resultMap.put("fileList",fileList);
				}			
			}
		}
		
		return resultMap;
	}
	
	@Override
	public int insertBoardProcess(Map<String, Object> param) {
		
		int result = 0;
		BoardVo paramVo = new BoardVo();
		
		try {
			MultipartHttpServletRequest request = (MultipartHttpServletRequest) param.get("multipartRequest");
			
			//파일 업로드 처리(다중 파일 업로드)
			String filePath = request.getSession().getServletContext().getRealPath("/") + fileUploadPath.replace("/", File.separator);
			String dbFileName = ""; 
			
			int fileCount = 0;
			String fileNm = "";
			
			List<MultipartFile> multiPartFileList = request.getFiles("file");
			
			for(MultipartFile multiPartFile : multiPartFileList){
				
				if(!multiPartFile.isEmpty()){
					if(fileCount == 0){
						 File file = new File(filePath);
					        if(!file.exists()) {
					           file.mkdirs();
					     } 
					}
					
					SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			        String today= formatter.format(new java.util.Date());
			        fileNm = today+ "__" +multiPartFile.getOriginalFilename();
			        
		        	if(fileCount == 0){
			        	dbFileName += fileNm;
			        } else {
			        	dbFileName += "," + fileNm;
			        }
					multiPartFile.transferTo(new File(filePath + fileNm));
			        
				}						
				fileCount++;					
			}
			
			if(!"".equals(dbFileName)){
				paramVo.setFile(fileNm);
			}
			
			//썸네일 파일 경로 처리
			String tempThumbPath = String.valueOf(param.get("smarteditor"));
			
			if(tempThumbPath.matches(".*<img src.*")){
				String[] tempThumbArray = tempThumbPath.split("<img src");
				String thumbPath = tempThumbArray[1];
				thumbPath = thumbPath.substring(0, thumbPath.indexOf(">"));
				
				paramVo.setThumbImage("<img src" + thumbPath + ">");
			}
			
			paramVo.setTitle(String.valueOf(param.get("title")));
			paramVo.setContents(String.valueOf(param.get("smarteditor")));
			paramVo.setCreateUserId(SecurityContextHolder.getContext().getAuthentication().getName());
			paramVo.setBoardName(String.valueOf(param.get("boardName")));
			
			result = boardDao.insertBoard(paramVo);
		} catch (Exception e) {
			// TODO: 에러 처리
		}
		
		return result;
	}
	
	@Override
	public int updateBoardProcess(Map<String, Object> param) {
		
		int result = 0;
		
		BoardVo paramVo = new BoardVo();
		
		try {
			MultipartHttpServletRequest request = (MultipartHttpServletRequest) param.get("multipartRequest");
			
			//파일 업로드 처리(다중 파일 업로드)
			String filePath = request.getSession().getServletContext().getRealPath("/") + fileUploadPath.replace("/", File.separator);
			String dbFileName = ""; 
			
			int fileCount = 0;
			String fileNm = "";
			
			List<MultipartFile> multiPartFileList = request.getFiles("file");
			
			for(MultipartFile multiPartFile : multiPartFileList){
				
				if(!multiPartFile.isEmpty()){
					if(fileCount == 0){
						 File file = new File(filePath);
					        if(!file.exists()) {
					           file.mkdirs();
					     } 
					}
					
					SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			        String today= formatter.format(new java.util.Date());
			        fileNm = today + "__" + multiPartFile.getOriginalFilename();
			        
		        	if(fileCount == 0){
			        	dbFileName += fileNm;
			        } else {
			        	dbFileName += "," + fileNm;
			        }
					multiPartFile.transferTo(new File(filePath + fileNm));
			        
				}						
				fileCount++;					
			}
			
			//썸네일 파일 경로 처리
			String tempThumbPath = String.valueOf(param.get("smarteditor"));
			
			if(tempThumbPath.matches(".*<img src.*")){
				String[] tempThumbArray = tempThumbPath.split("<img src");
				String thumbPath = tempThumbArray[1];
				thumbPath = thumbPath.substring(0, thumbPath.indexOf(">"));
				
				paramVo.setThumbImage("<img src" + thumbPath + ">");
			}
			
			paramVo.setSeq(String.valueOf(param.get("seq")));
			
			if(param.get("title")!=null){
				paramVo.setTitle(String.valueOf(param.get("title")));
			}
			if(param.get("smarteditor")!=null){
				paramVo.setContents(String.valueOf(param.get("smarteditor")));
			}
			if(param.get("hitCount")!=null){
				paramVo.setHitCount(String.valueOf(param.get("hitCount")));
			}
			
			paramVo.setBoardName(String.valueOf(param.get("boardName")));
			paramVo.setUpdateUserId(SecurityContextHolder.getContext().getAuthentication().getName());
			result = boardDao.updateBoard(paramVo);
			
		} catch (Exception e) {
			// TODO: 에러처리
			
		}
		
		return result;
	}
	
	@Override
	public int deleteBoardProcess(Map<String, Object> param) {
		
		int result_delReply = 0;
		int result_del = 0;
		int result = 0;
		
		//원본 글 SEQ
		String seq = "";
		
		if(param.get("seq")!=null){
			seq = String.valueOf(param.get("seq"));
		}
		
		if(!"".equals(seq)){
			
			int boardCount = 0;
			param.put("seq", seq);
			
			//관련 댓글이 모두 삭제되기 때문에 참조하는 댓글의 개수를 가져온다.
			List<String> refList = new ArrayList<String>();
			refList.add(seq);
			param.put("list", refList);
			List<String> seqList = getReplyList(param,new ArrayList<String>());
			seqList.remove(seq);
			param.put("list", seqList);
			
			if(seqList.size()!=0){
				//댓글 삭제			
				result_delReply = boardDao.deleteBoardReply(param);
			} else {
				result_delReply = 1;
			}
			
			Map<String, Object> boardInfo = boardDao.getBoardInfo(param);
			
			//첨부 파일 삭제			
			if(boardInfo !=null && boardInfo.get("FILE")!=null){
				
				String tempFile = String.valueOf(boardInfo.get("FILE"));
				String path = String.valueOf(param.get("path"));
				
				//단일 파일이 아닐 경우 
				if(tempFile.split(",").length > 1){
					
					String[] tempFileArray = tempFile.split(",");
					
					for(String file : tempFileArray){
						File f = new File(path + fileUploadPath + file);
						f.delete();
					}
					
				} else {
					
					File f = new File(path + fileUploadPath + tempFile);
					f.delete();
					
				}
				
			}
			
			result_del = boardDao.deleteBoard(param);
			
		}
		
		if(result_delReply == 1 && result_del == 1){
			result = 1;
		}
		
		return result;
	}
	
	@Override
	public Map<String, Object> insertReplyProcess(Map<String, Object> param) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		
		//댓글 내용
		String replyText = ""; 
		//원본 글 SEQ
		String seq = "";
		//댓글 SEQ
		String rSeq = "";
		//띄어쓰기 레벨
		String indent = "";
		//정렬 순서
		String step = "";
		//댓글 여부
		String isReply = "";
		
		if(param.get("replyText")!=null){
			replyText = String.valueOf(param.get("replyText"));
		}
		
		if(param.get("seq")!=null){
			seq = String.valueOf(param.get("seq"));
		}
		
		if(param.get("rSeq")!=null){
			rSeq = String.valueOf(param.get("rSeq"));
		}
		
		if(param.get("indent")!=null){
			indent = String.valueOf(param.get("indent"));
		}
		
		if(param.get("step")!=null){
			step = String.valueOf(param.get("step"));
		}
		
		if(param.get("isReply")!=null){
			isReply = String.valueOf(param.get("isReply"));
		}
				
		//댓글 참조하는 seq 리스트
		List<String> seqList = null;
		param.put("ref",seq);		
		List<String> refList = new ArrayList<String>();
		refList.add(seq);
		param.put("list", refList);
		seqList = getReplyList(param,new ArrayList<String>());
		seqList.add(seq);			
		
		if(!"".equals(seq) && !"".equals(replyText)){
			
			BoardVo paramVo = new BoardVo();
			paramVo.setBoardName(String.valueOf(param.get("boardName")));
			paramVo.setContents(replyText);
			//댓글의 댓글일 경우
			if(!"".equals(isReply)){
				paramVo.setRef(rSeq);
				paramVo.setStep(String.valueOf((Integer.parseInt(step) + 1)));
			//댓글일 경우
			} else {
				paramVo.setRef(seq);					
				param.put("list", seqList);					
				paramVo.setStep(String.valueOf((boardDao.selectBoardReplyCount(param)+1)));
			}
			
			if(!"".equals(indent)){
				paramVo.setIndent(String.valueOf((Integer.parseInt(indent) + 1)));
			} else {
				paramVo.setIndent("1");					
			}
			
			paramVo.setCreateUserId(SecurityContextHolder.getContext().getAuthentication().getName());
			
			param.put("list", seqList);
			param.put("step", String.valueOf((Integer.parseInt(step) + 1)));
			
			if(!"".equals(isReply)){
				boardDao.updateBoardAddReply(param);
			}
			
			result = boardDao.insertBoard(paramVo);		
										
		}
		
		resultMap.put("result", result);
		resultMap.put("seq", seq);
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> deleteReplyProcess(Map<String, Object> param) {
		
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		
		//원본 글 SEQ
		String seq = "";
		//댓글 SEQ
		String rSeq = "";
		//정렬 순서
		String step = "";
		
		if(param.get("seq")!=null){
			seq = String.valueOf(param.get("seq"));
		}
		
		if(param.get("rSeq")!=null){
			rSeq = String.valueOf(param.get("rSeq"));
		}
		
		if(param.get("step")!=null){
			step = String.valueOf(param.get("step"));
		}
		
		if(!"".equals(rSeq)){
			
			int boardCount = 0;
			param.put("seq", rSeq);
			param.put("ref", rSeq);
			
			//관련 댓글이 모두 삭제되기 때문에 참조하는 댓글의 개수를 가져온다.
			
			List<String> refList = new ArrayList<String>();
			refList.add(rSeq);
			param.put("list", refList);
			List<String> seqList = getReplyList(param,new ArrayList<String>());
			seqList.add(rSeq);
			param.put("list", seqList);
			param.put("cnt", boardDao.selectBoardReplyCount(param)+1);
			param.put("step", step);
			boardDao.deleteBoardReply(param);
			//관련 댓글이 삭제되는 만큼 그 보다 큰 수의 있던 댓글의 step 을 삭제된 만큼 업데이트 시켜준다.
			seqList.add(seq);
			param.put("list", seqList);
			result = boardDao.updateBoardDelReply(param);
			
		}
		
		resultMap.put("result", result);
		resultMap.put("seq", seq);
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> updateReplyProcess(Map<String, Object> param) {
		
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		
		//원본 글 SEQ
		String seq = "";
		//댓글 SEQ
		String rSeq = "";
		//댓글 내용
		String replyText = "";
		
		if(param.get("seq")!=null){
			seq = String.valueOf(param.get("seq"));
		}
		
		if(param.get("rSeq")!=null){
			rSeq = String.valueOf(param.get("rSeq"));
		}
		
		if(param.get("step")!=null){
			replyText = String.valueOf(param.get("replyText"));
		}
		
		if(!"".equals(rSeq) && !"".equals(replyText)){
			
			BoardVo paramVo = new BoardVo();
			paramVo.setBoardName(String.valueOf(param.get("boardName")));
			paramVo.setSeq(rSeq);
			paramVo.setContents(replyText);
			paramVo.setUpdateUserId(SecurityContextHolder.getContext().getAuthentication().getName());
			result = boardDao.updateBoard(paramVo);
							
		}
		
		resultMap.put("result", result);
		resultMap.put("seq", seq);
		
		return null;
	}
	
	@Override
	public Map<String, Object> getBoardInfo(Map<String, Object> param) {
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
	public int updateBoardAddReply(Map<String, Object> param) {
		return boardDao.updateBoardAddReply(param);
	}

	@Override
	public int updateBoardDelReply(Map<String, Object> param) {
		return boardDao.updateBoardDelReply(param);
	}
	
	@Override
	public int deleteBoard(Map<String, Object> param) {
		return boardDao.deleteBoard(param);
	}

	@Override
	public Map<String, Object> selectBoardReplyList(Map<String, Object> param) {
		int totalCount = 0;
		Map<String, Object> resultMap = null;
		
		try {
				totalCount = boardDao.selectBoardReplyCount(param);
				
				param.put("totalCount", totalCount);
				
				Map<String, Object> pageInfo = PagingUtil.setPageView(param);
				
				param.put("start", pageInfo.get("start"));
				param.put("end", pageInfo.get("end"));
				
				List<Map<String, Object>> boardInfoList = boardDao.selectBoardReplyList(param);
				
				resultMap = new HashMap<>();
				resultMap.put("list", boardInfoList);
				resultMap.put("page", pageInfo.get("page"));
				
		} catch (Exception e) {
			System.out.println("게시판 가져오기 오류");
		}
		
		return resultMap;		
	}

	@Override
	public List<String> selectBoardReplySeq(Map<String, Object> param) {
		return boardDao.selectBoardReplySeq(param);
	}

	@Override
	public int deleteBoardReply(Map<String, Object> param) {
		return boardDao.deleteBoardReply(param);
	}

	private List<String> getReplyList(Map<String, Object> param, List<String> recursiveList){
		
		List<String> boardReplySeq = boardDao.selectBoardReplySeq(param);
		
		if(boardReplySeq.isEmpty()){
			return recursiveList;
		}
		
		param.put("list", boardReplySeq);
		recursiveList.addAll(boardReplySeq);
		
        return getReplyList(param,recursiveList);
		
	}

	@Override
	public int insertScheduleStock(Map<String, Object> param) {
		return boardDao.insertScheduleStock(param);
	}

	@Override
	public Map<String, Object> selectScheduleStock() {
		return boardDao.selectScheduleStock();
	}
	
}
