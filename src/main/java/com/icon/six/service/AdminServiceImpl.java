package com.icon.six.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.icon.six.constant.CommonConstant;
import com.icon.six.dao.AdminDao;
import com.icon.six.dao.BoardDao;
import com.icon.six.util.PagingUtil;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Resource
	private AdminDao adminDao;
	
	@Resource
	private BoardDao boardDao;
	
	@Value("${file.upload.path}")
	private String fileUploadPath;
	
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
		
		int result = 0;
		
		try {
			
			MultipartHttpServletRequest request = (MultipartHttpServletRequest) param.get("multipartRequest");
			
			if(request!=null){
				//파일 업로드 처리(다중 파일 업로드)
				String filePath = request.getSession().getServletContext().getRealPath("/") + fileUploadPath.replace("/", File.separator);
				String dbFileName = ""; 
				String profile_dbFileName = "";
				
				int fileCount = 0;
				int profile_fileCount = 0;
				String fileNm = "";
				String profile_fileNm = "";
				
				List<MultipartFile> multiPartFileList = request.getFiles("file");
				
				//파트너 프로필 이미지 추가
				List<MultipartFile> multiPartFileList_profile = request.getFiles("file_profile");
				
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
				
				for(MultipartFile multiPartFile : multiPartFileList_profile){
					
					if(!multiPartFile.isEmpty()){
						if(profile_fileCount == 0){
							 File file = new File(filePath);
						        if(!file.exists()) {
						           file.mkdirs();
						     } 
						}
						
						SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				        String today= formatter.format(new java.util.Date());
				        profile_fileNm = today+ "__" +multiPartFile.getOriginalFilename();
				        
			        	if(profile_fileCount == 0){
			        		profile_dbFileName += profile_fileNm;
				        } else {
				        	profile_dbFileName += "," + profile_fileNm;
				        }
						multiPartFile.transferTo(new File(filePath + profile_fileNm));
				        
					}						
					profile_fileCount++;					
				}
				
				if(dbFileName.length() > 0){
					String img = "<img src=\""+fileUploadPath + fileNm+"\">";
					param.put("image", img);
				}
				
				if(profile_dbFileName.length() > 0){
					String img = "<img src=\""+fileUploadPath + profile_fileNm+"\">";
					param.put("profileImage", img);
				}
				
			}
			
			result = adminDao.updatePartner(param);
			
		} catch (Exception e) {
			// TODO: 에러 처리
		}
		
		return result;	
	}

	@Override
	public int selectRoleCount(Map<String, Object> param) {
		return adminDao.selectRoleCount(param);
	}

	@Override
	public int insertAuthority(Map<String, Object> param) {
		return adminDao.insertAuthority(param);
	}

	@Override
	public Map<String, Object> selectRequestPointList(Map<String, Object> param) {
		int totalCount = 0;
		Map<String, Object> resultMap = null;
		
		try {
			
				if(param.get("currentPage")==null){
					param.put("currentPage", "1");
				}
				
				totalCount = adminDao.selectRequestPointCount(param);
				
				param.put("totalCount", totalCount);
				
				Map<String, Object> pageInfo = PagingUtil.setPageView(param);
				
				param.put("start", pageInfo.get("start"));
				param.put("end", pageInfo.get("end"));
				
				List<Map<String, Object>> boardInfoList = adminDao.selectRequestPointList(param);
				resultMap = new HashMap<>();
				resultMap.put("list", boardInfoList);
				resultMap.put("page", pageInfo.get("page"));
				
		} catch (Exception e) {
			//TODO 에러 처리
			
		}
		
		return resultMap;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public int updateSixPointConfirm(Map<String, Object> param) {
		
		int result1 = 0;
		int result2 = 1;
		
		/**
		 * 포인트 승인 처리 후 합산 포인트 처리 (처리 과정 중 하나라도 오류 시 모두 트랜잭션 처리)
		 */
		try {
			result1 = adminDao.updateSixPointConfirm(param);
			
			if(result1 == 1){
				
				String[] seqList = (String[]) param.get("array");
				String[] pointList = (String[]) param.get("pointList");
				String[] idList = (String[]) param.get("idList");
				
				param.put("pointType", CommonConstant.COMMON_POINT_CD_CHARGE);
				
				for(int i=0;i<seqList.length;i++){
					
					param.put("seq", seqList[i]);
					param.put("point", pointList[i]);
					param.put("id", idList[i]);
					
					int pointSum = boardDao.selectUserPointSum(idList[i]);
					
					param.put("pointSum", pointSum);
					result2 = boardDao.updateSixPoint(param);
					
				}
				
			}
		} catch (Exception e) {
			// TODO: 트랜잭션 에러 처리(DB LOG 남길까 ? ) 
			
		}		
		
		return result2;
	}

	@Override
	public Map<String, Object> selectSixCounseling(Map<String, Object> param) {
		int totalCount = 0;
		Map<String, Object> resultMap = null;
		
		try {
			
				if(param.get("currentPage")==null){
					param.put("currentPage", "1");
				}
				
				totalCount = adminDao.selectSixCounselingCount(param);
				
				param.put("totalCount", totalCount);
				
				Map<String, Object> pageInfo = PagingUtil.setPageView(param);
				
				param.put("start", pageInfo.get("start"));
				param.put("end", pageInfo.get("end"));
				
				List<Map<String, Object>> boardInfoList = adminDao.selectSixCounseling(param);
				resultMap = new HashMap<>();
				resultMap.put("list", boardInfoList);
				resultMap.put("page", pageInfo.get("page"));
				
		} catch (Exception e) {
			//TODO 에러 처리
			System.out.println("상담 신청 게시판 가져오기 오류");
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> selectSixCounselingInfo(Map<String, Object> param) {
		return adminDao.selectSixCounselingInfo(param);
	}

	@Override
	public Map<String, Object> selectF1kCounseling(Map<String, Object> param) {
		int totalCount = 0;
		Map<String, Object> resultMap = null;
		
		try {
				if(param.get("currentPage")==null){
					param.put("currentPage", "1");
				}
				
				totalCount = adminDao.selectF1kCounselingCount(param);
				
				param.put("totalCount", totalCount);
				
				Map<String, Object> pageInfo = PagingUtil.setPageView(param);
				
				param.put("start", pageInfo.get("start"));
				param.put("end", pageInfo.get("end"));
				
				List<Map<String, Object>> boardInfoList = adminDao.selectF1kCounseling(param);
				resultMap = new HashMap<>();
				resultMap.put("list", boardInfoList);
				resultMap.put("page", pageInfo.get("page"));
				
		} catch (Exception e) {
			//TODO 에러 처리
			System.out.println("F1K 상담 신청 게시판 가져오기 오류");
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> selectF1kCounselingInfo(Map<String, Object> param) {
		return adminDao.selectF1kCounselingInfo(param);
	}
	
}
