package com.icon.six.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.icon.six.constant.CommonConstant;
import com.icon.six.service.BoardService;
import com.icon.six.util.StringUtil;
import com.icon.six.vo.BoardVo;

@Controller
@RequestMapping("academy")
public class AcademyController {
	
	@Resource
	private BoardService boardService;
	
	@Value("${file.upload.path}")
	private String fileUploadPath;
	
	@RequestMapping(value="academyMain.do")
	public ModelAndView academyMain(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_main");
		return mav;
	}
	
	@RequestMapping(value="academyLearningCenter.do")
	public ModelAndView academyLearningCenter(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_lcenter");
		
		System.out.println("requestMap : " + requestMap);
		
		try {
				if(requestMap.get("currentPage")==null){
					requestMap.put("currentPage", "1");
				}
				
				if(requestMap.get("searchText")!=null){
					if("title".equals(requestMap.get("searchOption"))){
						requestMap.put("title", requestMap.get("searchText"));
					} else if("contents".equals(requestMap.get("searchOption"))){
						requestMap.put("contents", requestMap.get("searchText"));
					}
				}
				
				requestMap.put("boardName", CommonConstant.LEARNCENTER_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
				
				List<Map<String, Object>> boardInfoList = (List<Map<String, Object>>) boardInfo.get("list"); 
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/academy/academyLearningCenterView.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "academyLearningCenterView.do")
	public ModelAndView academyLearningCenterView(@RequestParam Map<String, String> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("academy/academy_lcenter_view");
		String seq = StringUtils.defaultIfEmpty(requestMap.get("seq"), ""); 
		
		if(!"".equals(seq)){
			BoardVo paramVo = new BoardVo();
			paramVo.setHitCount("1");
			paramVo.setSeq(seq);
			paramVo.setUpdateUserId(SecurityContextHolder.getContext().getAuthentication().getName());
			paramVo.setBoardName(CommonConstant.LEARNCENTER_BOARD);
			boardService.updateBoard(paramVo);
			
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("boardName", CommonConstant.LEARNCENTER_BOARD);
			paramMap.put("seq",seq);
					
			Map<String, String> boardInfo = boardService.getBoardInfo(paramMap);
			mav.addObject("boardInfo",boardInfo);
			
		} else {
			//TODO 에러처리
		}
		return mav;
	}
	
	@RequestMapping(value="academyLearningCenterWrite.do")
	public ModelAndView academyLearningCenterWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_lcenter_write");
		mav.addObject("insertAction","/academy/academyLearningCenterWriteProcess.do");
		return mav;
	}
	
	@RequestMapping(value="academyLearningCenterUpdate.do")
	public ModelAndView academyLearningCenterUpdate(@RequestParam Map<String, String> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_lcenter_write");
		
		try {
			String seq = StringUtils.defaultIfEmpty(requestMap.get("seq"), ""); 
			
			System.out.println("requetsMap : " + requestMap);
			
			if(!"".equals(seq)){
				
				Map<String, String> paramMap = new HashMap<String, String>();
				paramMap.put("boardName", CommonConstant.LEARNCENTER_BOARD);
				paramMap.put("seq",seq);
				
				Map<String, String> boardInfo = boardService.getBoardInfo(paramMap);
				
				String file = boardInfo.get("FILE");
				String[] fileArray = file.split(",");
				List<String> fileList = new ArrayList<String>();
				
				for(String fileName : fileArray){
					fileList.add(fileName);
				}
				
				mav.addObject("boardInfo",boardInfo);
				mav.addObject("fileList",fileList);
				mav.addObject("isUpdate","true");
				mav.addObject("updateAction","/academy/academyLearningCenterUpdateProcess.do");
			} else {
				//TODO 에러처리
			}
		} catch (Exception e) {
			// TODO: 에러처리
		}
		return mav;
	}	
	
	@RequestMapping(value="academyLearningCenterWriteProcess.do")
	public void academyLearningCenterWriteProcess(@RequestParam Map<String, String> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		try {
			
			System.out.println("requestMap : " + requestMap);
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap) requestMap))){
				
				int result = 0;
				
				BoardVo paramVo = new BoardVo();
				
				//파일 업로드 처리(다중 파일 업로드)
				String filePath = request.getSession().getServletContext().getRealPath("/") + fileUploadPath;
				String dbFileName = ""; 
				
				int fileCount = 0;
				
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
				        String fileNm = filePath + today+UUID.randomUUID().toString() + multiPartFile.getOriginalFilename();
				        
			        	if(fileCount == 0){
				        	dbFileName += fileNm;
				        } else {
				        	dbFileName += "," + fileNm;
				        }
						multiPartFile.transferTo(new File(fileNm));
				        
					}						
					fileCount++;					
				}
				
				if(!"".equals(dbFileName)){
					paramVo.setFile(dbFileName);
				}
				
				//썸네일 파일 경로 처리
				String tempThumbPath = String.valueOf(requestMap.get("smarteditor"));
				
				if(tempThumbPath.matches(".*<img src.*")){
					String[] tempThumbArray = tempThumbPath.split("<img src");
					String thumbPath = tempThumbArray[1];
					thumbPath = thumbPath.substring(0, thumbPath.indexOf(">"));
					
					paramVo.setThumbImage("<img src" + thumbPath + ">");
				}
				
				paramVo.setTitle(requestMap.get("title"));
				paramVo.setContents(requestMap.get("smarteditor"));
				paramVo.setCreateUserId(SecurityContextHolder.getContext().getAuthentication().getName());
				paramVo.setBoardName(CommonConstant.LEARNCENTER_BOARD);
				
				result = boardService.insertBoard(paramVo);
				
				if(result == 0){
					// 에러 페이지 처리
				}
				
			} else {
				// 에러 페이지 처리
			}
			response.sendRedirect("/academy/academyLearningCenter.do");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="academyLearningCenterUpdateProcess.do")
	public void academyLearningCenterUpdateProcess(@RequestParam Map<String, String> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		try{
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, String>) requestMap))){
				
				int result = 0;
				
				BoardVo paramVo = new BoardVo();
				
				//파일 업로드 처리(다중 파일 업로드)
				String filePath = request.getSession().getServletContext().getRealPath("/") + fileUploadPath;
				String dbFileName = ""; 
				
				int fileCount = 0;
				
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
				        String fileNm = filePath + today+UUID.randomUUID().toString() + multiPartFile.getOriginalFilename();
				        
			        	if(fileCount == 0){
				        	dbFileName += fileNm;
				        } else {
				        	dbFileName += "," + fileNm;
				        }
						multiPartFile.transferTo(new File(fileNm));
				        
					}						
					fileCount++;					
				}
				
				if(!"".equals(dbFileName)){
					paramVo.setFile(dbFileName);
				}
				
				//썸네일 파일 경로 처리
				String tempThumbPath = String.valueOf(requestMap.get("smarteditor"));
				
				if(tempThumbPath.matches(".*<img src.*")){
					String[] tempThumbArray = tempThumbPath.split("<img src");
					String thumbPath = tempThumbArray[1];
					thumbPath = thumbPath.substring(0, thumbPath.indexOf(">"));
					
					paramVo.setThumbImage("<img src" + thumbPath + ">");
				}
				
				paramVo.setSeq(requestMap.get("seq"));
				
				if(!"".equals(StringUtils.defaultIfEmpty(requestMap.get("title"), ""))){
					paramVo.setTitle(requestMap.get("title"));
				}
				if(!"".equals(StringUtils.defaultIfEmpty(requestMap.get("smarteditor"), ""))){
					paramVo.setContents(requestMap.get("smarteditor"));
				}
				if(!"".equals(StringUtils.defaultIfEmpty(requestMap.get("hitCount"), ""))){
					paramVo.setHitCount(requestMap.get("hitCount"));
				}
				paramVo.setBoardName(CommonConstant.LEARNCENTER_BOARD);
				paramVo.setUpdateUserId(SecurityContextHolder.getContext().getAuthentication().getName());
				result = boardService.updateBoard(paramVo);
				
				if(result == 0){
					// 에러 페이지 처리
				}
				
			} else {
				// 에러 페이지 처리
			}
			response.sendRedirect("/main/introNotice.do");
			
		} catch (IOException e) {
			// TODO 에러 페이지 처리
			
		}	
	}
	
	@RequestMapping(value="academyInvestStrategy.do")
	public ModelAndView academyInvestStrategy(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_istrategy");
		return mav;
	}
	
	@RequestMapping(value="academySearchNote.do")
	public ModelAndView academySearchNote(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_snote");
		return mav;
	}
	
	@RequestMapping(value="academyNecessarySubscribe.do")
	public ModelAndView academyNecessarySubscribe(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_nsubscribe");
		return mav;
	}
	
}
