package com.icon.six.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.icon.six.constant.CommonConstant;
import com.icon.six.service.BoardService;
import com.icon.six.util.StringUtil;
import com.icon.six.vo.BoardVo;

@Controller
@RequestMapping("academy")
public class AcademyController {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping(value="academyMain.do")
	public ModelAndView academyMain(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_main");
		return mav;
	}
	
	@RequestMapping(value="academyLearningCenter.do")
	public ModelAndView academyLearningCenter(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_lcenter");
		
		logger.debug("requestMap : " + requestMap);
		
		try {
				requestMap.put("boardName", CommonConstant.LEARNCENTER_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
								
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
	public ModelAndView academyLearningCenterView(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("academy/academy_lcenter_view");
		
		requestMap.put("boardName", CommonConstant.LEARNCENTER_BOARD);	
		Map<String, Object> resultMap = boardService.selectBoardViewInfo(requestMap);
		
		if(resultMap.get("boardInfoMap") != null){
			
			Map<String, Object> boardInfoMap = new HashMap<String, Object>(); 
			boardInfoMap = (Map<String, Object>) resultMap.get("boardInfoMap");
			
			mav.addObject("list",boardInfoMap.get("list"));
			mav.addObject("page",boardInfoMap.get("page"));
		}
		
		mav.addObject("fileList",resultMap.get("fileList"));
		mav.addObject("boardInfo",resultMap.get("boardInfo"));
		mav.addObject("currentPage", resultMap.get("currentPage"));
		
		mav.addObject("listPage","/academy/academyLearningCenterView.do");
		mav.addObject("updateAction","/academy/academyLearningCenterUpdate.do");
		mav.addObject("deleteAction","/academy/academyLearningCenterDeleteProcess.do");
		mav.addObject("replyAddAction","/academy/academyLearningCenterReplyAdd.do");
		mav.addObject("replyDelAction","/academy/academyLearningCenterReplyDel.do");
		mav.addObject("replyUpdAction","/academy/academyLearningCenterReplyUpdate.do");
			
		return mav;
	}
	
	@RequestMapping(value="academyLearningCenterWrite.do")
	public ModelAndView academyLearningCenterWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_lcenter_write");
		mav.addObject("insertAction","/academy/academyLearningCenterWriteProcess.do");
		return mav;
	}
	
	@RequestMapping(value="academyLearningCenterUpdate.do")
	public ModelAndView academyLearningCenterUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_lcenter_write");
		logger.debug("requetsMap : " + requestMap);
		
		try {
			requestMap.put("boardName", CommonConstant.LEARNCENTER_BOARD);
			Map<String, Object> resultMap = boardService.selectBoardUpdateInfo(requestMap);
			
			mav.addObject("boardInfo",resultMap.get("boardInfo"));
			mav.addObject("fileList",resultMap.get("fileList"));
			
			if(resultMap.get("file")!=null){
				mav.addObject("file",resultMap.get("file"));
			}
			
			mav.addObject("isUpdate","true");
			mav.addObject("updateAction","/academy/academyLearningCenterUpdateProcess.do");
			
		} catch (Exception e) {
			// TODO: 에러처리
		}
		return mav;
	}	
	
	@RequestMapping(value="academyLearningCenterWriteProcess.do")
	public void academyLearningCenterWriteProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		logger.debug("requestMap : " + requestMap);
		int result = 0;
		
		try {
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.LEARNCENTER_BOARD);
				requestMap.put("multipartRequest", request);
				result = boardService.insertBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/academy/academyLearningCenter.do");
				} else {
					// TODO 에러페이지 
				}
			} else {
				// TODO 에러페이지
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="academyLearningCenterUpdateProcess.do")
	public void academyLearningCenterUpdateProcess(@RequestParam Map<String, Object> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.LEARNCENTER_BOARD);
				requestMap.put("multipartRequest", request);
				
				result = boardService.updateBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/academy/academyLearningCenter.do");
				} else {
					//TODO 에러 페이지
				}
				
			} else {
				// TODO 에러페이지 처리
			}
			
		} catch (IOException e) {
			// TODO 에러 페이지 처리
			
		}	
	}
	
	@RequestMapping(value="academyLearningCenterDeleteProcess.do")
	public void academyLearningCenterDeleteProcess(@RequestParam Map<String, Object> requestMap, HttpServletRequest request, HttpServletResponse response){
		
		int result = 0;
		
		try{
			
			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, Object>) requestMap))){
				
				requestMap.put("boardName", CommonConstant.LEARNCENTER_BOARD);
				requestMap.put("path", request.getSession().getServletContext().getRealPath("/"));
				
				result = boardService.deleteBoardProcess(requestMap);
				
				if(result == 1){
					response.sendRedirect("/academy/academyLearningCenter.do");
				} else {
					//TODO 에러 페이지
				}
				
			} else {
				// TODO 에러페이지 처리
			}
			
		} catch (IOException e) {
			// TODO 에러 페이지 처리
			
		}	
	}
	
	@RequestMapping(value = "academyLearningCenterReplyAdd.do")
	public ModelAndView academyLearningCenterReplyAdd(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			 
			 requestMap.put("boardName", CommonConstant.LEARNCENTER_BOARD);
			 Map<String, Object> resultMap = boardService.insertReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/academy/academyLearningCenterView.do");
				 mav.addObject("seq",resultMap.get("seq"));
			 } else {
				 // TODO 에러처리
			 }
			 
		} catch (Exception e) {
			// TODO: 에러처리
			
		}
		
		return mav;
		
	}
	
	@RequestMapping(value = "academyLearningCenterReplyDel.do")
	public ModelAndView academyLearningCenterReplyDel(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			 requestMap.put("boardName", CommonConstant.LEARNCENTER_BOARD); 
			 Map<String, Object> resultMap = boardService.deleteReplyProcess(requestMap);
			 
			 if((Integer) resultMap.get("result") == 1){
				 mav.addObject("page","/academy/academyLearningCenterView.do");
				 mav.addObject("seq",resultMap.get("seq"));
			 } else {
				 // TODO 에러처리
			 }
			
		} catch (Exception e) {
			// TODO: 에러처리
			
		}
		
		return mav;
		
	}
	
	@RequestMapping(value = "academyLearningCenterReplyUpdate.do")
	public ModelAndView academyLearningCenterReplyUpdate(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("main/commonPage");
		
		try {
			
			  requestMap.put("boardName", CommonConstant.LEARNCENTER_BOARD);
			  Map<String, Object> resultMap = boardService.updateReplyProcess(requestMap);
				 
			  if((Integer) resultMap.get("result") == 1){
				  mav.addObject("page","/academy/academyLearningCenterView.do");
				  mav.addObject("seq",resultMap.get("seq"));
			  } else {
				 // TODO 에러처리
			  }
			
		} catch (Exception e) {
			// TODO: 에러처리
			
		}
		
		return mav;
	}
	
	@RequestMapping(value="academyInvestStrategy.do")
	public ModelAndView academyInvestStrategy(@RequestParam Map<String, Object> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_istrategy");
		
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
				requestMap.put("ref","0");
				requestMap.put("boardName", CommonConstant.LEARNSTRATEGY_BOARD);
				Map<String, Object> boardInfo = boardService.selectBoardList(requestMap);
								
				mav.addObject("list",boardInfo.get("list"));
				mav.addObject("page",boardInfo.get("page"));
				mav.addObject("currentPage",requestMap.get("currentPage"));
				mav.addObject("viewPage","/academy/academyInvestStrategyView.do");
				
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("공지사항 불러오기 에러");			
		}
		
		return mav;
	}
	
	@RequestMapping(value = "academyInvestStrategyView.do")
	public ModelAndView academyInvestStrategyView(@RequestParam Map<String, String> requestMap, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("academy/academy_istrategy_view");
//		String seq = StringUtils.defaultIfEmpty(requestMap.get("seq"), ""); 
//		
//		if(!"".equals(seq)){
//			BoardVo paramVo = new BoardVo();
//			paramVo.setHitCount("1");
//			paramVo.setSeq(seq);
//			paramVo.setUpdateUserId(SecurityContextHolder.getContext().getAuthentication().getName());
//			paramVo.setBoardName(CommonConstant.LEARNSTRATEGY_BOARD);
//			boardService.updateBoard(paramVo);
//			
//			Map<String, String> paramMap = new HashMap<String, String>();
//			paramMap.put("boardName", CommonConstant.LEARNSTRATEGY_BOARD);
//			paramMap.put("seq",seq);
//					
//			Map<String, String> boardInfo = boardService.getBoardInfo(paramMap);
//			
//			String file = StringUtils.defaultIfEmpty(boardInfo.get("FILE"), "");
//			String[] fileArray = file.split(",");
//			
//			List<Map<String, String>> fileList = new ArrayList<Map<String, String>>();
//			
//			if(!"".equals(file)){
//				if(fileArray.length == 1){
//					Map<String, String> fileMap = new HashMap<String, String>();
//					fileMap.put("rFile", file);
//					file = file.substring(file.indexOf("__"), file.length()).replace("__", "");
//					fileMap.put("file", file);
//					fileList.add(fileMap);
//				} else {
//					for(String fileName : fileArray){
//						Map<String, String> fileMap = new HashMap<String, String>();
//						fileMap.put("rFile", fileName);
//						fileName = fileName.substring(fileName.indexOf("__"), fileName.length()).replace("__", "");
//						fileMap.put("file", fileName);	
//						fileList.add(fileMap);
//					}
//				}
//			}
//			
//			//댓글 리스트 가져오기
//			String currentPage = StringUtils.defaultIfEmpty(requestMap.get("currentPage"), "1");
//			Map<String, Object> param = new HashMap<String, Object>();
//			param.put("boardName", CommonConstant.LEARNSTRATEGY_BOARD);
//			param.put("ref", seq);
//			
//			List<String> refList = new ArrayList<String>();
//			refList.add(seq);
//			param.put("list", refList);
//			
//			List<String> seqList = getReplyList(param,new ArrayList<String>());
//			seqList.add(seq);
//			param.put("list", seqList);
//			param.put("currentPage", currentPage);
//			Map<String, Object> boardInfoMap = boardService.selectBoardReplyList(param);
//			
//			if(boardInfoMap != null){
//				mav.addObject("list",boardInfoMap.get("list"));
//				mav.addObject("page",boardInfoMap.get("page"));
//			}
//			
//			mav.addObject("fileList",fileList);
//			mav.addObject("boardInfo",boardInfo);
//			mav.addObject("currentPage", currentPage);
//			mav.addObject("listPage","/academy/academyInvestStrategy.do");
//			mav.addObject("updateAction","/academy/academyInvestStrategyUpdate.do");
//			mav.addObject("replyAddAction","/academy/academyInvestStrategyReplyAdd.do");
//			mav.addObject("replyDelAction","/academy/academyInvestStrategyReplyDel.do");
//			mav.addObject("replyUpdAction","/academy/academyInvestStrategyReplyUpdate.do");
//			
//		} else {
//			//TODO 에러처리
//		}
		return mav;
	}
	
	@RequestMapping(value="academyInvestStrategyWrite.do")
	public ModelAndView academyInvestStrategyWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_lcenter_write");
		mav.addObject("insertAction","/academy/academyLearningCenterWriteProcess.do");
		return mav;
	}
	
	@RequestMapping(value="academyInvestStrategyUpdate.do")
	public ModelAndView academyInvestStrategyUpdate(@RequestParam Map<String, String> requestMap, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("academy/academy_lcenter_write");
		
		try {
//			String seq = StringUtils.defaultIfEmpty(requestMap.get("seq"), ""); 
//			
//			System.out.println("requetsMap : " + requestMap);
//			
//			if(!"".equals(seq)){
//				
//				Map<String, String> paramMap = new HashMap<String, String>();
//				paramMap.put("boardName", CommonConstant.LEARNSTRATEGY_BOARD);
//				paramMap.put("seq",seq);
//				
//				Map<String, String> boardInfo = boardService.getBoardInfo(paramMap);
//				
//				String file = StringUtils.defaultIfEmpty(boardInfo.get("FILE"), "");
//				String[] fileArray = file.split(",");
//				List<Map<String, String>> fileList = new ArrayList<Map<String, String>>();
//				
//				if(fileArray.length == 1){
//					Map<String, String> fileMap = new HashMap<String, String>();
//					fileMap.put("rFile", file);
//					file = file.substring(file.indexOf("__"), file.length()).replace("__", "");
//					fileMap.put("file", file);
//					fileList.add(fileMap);
//				} else {
//					for(String fileName : fileArray){
//						Map<String, String> fileMap = new HashMap<String, String>();
//						fileMap.put("rFile", fileName);
//						fileName = fileName.substring(fileName.indexOf("__"), fileName.length()).replace("__", "");
//						fileMap.put("file", fileName);	
//						fileList.add(fileMap);
//					}
//				}
//								
//				mav.addObject("boardInfo",boardInfo);
//				mav.addObject("fileList",fileList);
//				mav.addObject("file",file);
//				mav.addObject("isUpdate","true");
//				mav.addObject("updateAction","/academy/academyInvestStrategyUpdateProcess.do");
//			} else {
//				//TODO 에러처리
//			}
		} catch (Exception e) {
			// TODO: 에러처리
		}
		return mav;
	}	
	
	@RequestMapping(value="academyInvestStrategyWriteProcess.do")
	public void academyInvestStrategyWriteProcess(@RequestParam Map<String, String> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		try {
			
			System.out.println("requestMap : " + requestMap);
			
//			if("NotNull".equals(StringUtil.nullCheckMap((HashMap) requestMap))){
//				
//				int result = 0;
//				
//				BoardVo paramVo = new BoardVo();
//				
//				//파일 업로드 처리(다중 파일 업로드)
//				String filePath = request.getSession().getServletContext().getRealPath("/") + fileUploadPath.replace("/", File.separator);
//				String dbFileName = ""; 
//				
//				int fileCount = 0;
//				String fileNm = "";
//				
//				List<MultipartFile> multiPartFileList = request.getFiles("file");
//				
//				for(MultipartFile multiPartFile : multiPartFileList){
//					
//					if(!multiPartFile.isEmpty()){
//						if(fileCount == 0){
//							 File file = new File(filePath);
//						        if(!file.exists()) {
//						           file.mkdirs();
//						     } 
//						}
//						
//						SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
//				        String today= formatter.format(new java.util.Date());
//				        fileNm = today+ "__" +multiPartFile.getOriginalFilename();
//				        
//			        	if(fileCount == 0){
//				        	dbFileName += fileNm;
//				        } else {
//				        	dbFileName += "," + fileNm;
//				        }
//						multiPartFile.transferTo(new File(filePath + fileNm));
//				        
//					}						
//					fileCount++;					
//				}
//				
//				if(!"".equals(dbFileName)){
//					paramVo.setFile(fileNm);
//				}
//				
//				//썸네일 파일 경로 처리
//				String tempThumbPath = String.valueOf(requestMap.get("smarteditor"));
//				
//				if(tempThumbPath.matches(".*<img src.*")){
//					String[] tempThumbArray = tempThumbPath.split("<img src");
//					String thumbPath = tempThumbArray[1];
//					thumbPath = thumbPath.substring(0, thumbPath.indexOf(">"));
//					
//					paramVo.setThumbImage("<img src" + thumbPath + ">");
//				}
//				
//				paramVo.setTitle(requestMap.get("title"));
//				paramVo.setContents(requestMap.get("smarteditor"));
//				paramVo.setCreateUserId(SecurityContextHolder.getContext().getAuthentication().getName());
//				paramVo.setBoardName(CommonConstant.LEARNSTRATEGY_BOARD);
//				
//				result = boardService.insertBoard(paramVo);
//				
//				if(result == 0){
//					// 에러 페이지 처리
//				}
//				
//			} else {
//				// 에러 페이지 처리
//			}
//			response.sendRedirect("/academy/academyInvestStrategy.do");
//			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="academyInvestStrategyUpdateProcess.do")
	public void academyInvestStrategyUpdateProcess(@RequestParam Map<String, String> requestMap, MultipartHttpServletRequest request, HttpServletResponse response){
		try{
//			if("NotNull".equals(StringUtil.nullCheckMap((HashMap<String, String>) requestMap))){
//				
//				int result = 0;
//				
//				BoardVo paramVo = new BoardVo();
//				
//				//파일 업로드 처리(다중 파일 업로드)
//				String filePath = request.getSession().getServletContext().getRealPath("/") + fileUploadPath.replace("/", File.separator);
//				String dbFileName = ""; 
//				
//				int fileCount = 0;
//				String fileNm = "";
//				
//				List<MultipartFile> multiPartFileList = request.getFiles("file");
//				
//				for(MultipartFile multiPartFile : multiPartFileList){
//					
//					if(!multiPartFile.isEmpty()){
//						if(fileCount == 0){
//							 File file = new File(filePath);
//						        if(!file.exists()) {
//						           file.mkdirs();
//						     } 
//						}
//						
//						SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
//				        String today= formatter.format(new java.util.Date());
//				        fileNm = today + "__" + multiPartFile.getOriginalFilename();
//				        
//			        	if(fileCount == 0){
//				        	dbFileName += fileNm;
//				        } else {
//				        	dbFileName += "," + fileNm;
//				        }
//						multiPartFile.transferTo(new File(filePath + fileNm));
//				        
//					}						
//					fileCount++;					
//				}
//				
//				//파일 삭제 처리
//				String fileDeleteName = StringUtils.defaultIfEmpty(requestMap.get("fileDeleteName"), "");  
//				
//				if(!"".equals(dbFileName)){
//					paramVo.setFile(fileNm);
//				}
//				
//				//썸네일 파일 경로 처리
//				String tempThumbPath = String.valueOf(requestMap.get("smarteditor"));
//				
//				if(tempThumbPath.matches(".*<img src.*")){
//					String[] tempThumbArray = tempThumbPath.split("<img src");
//					String thumbPath = tempThumbArray[1];
//					thumbPath = thumbPath.substring(0, thumbPath.indexOf(">"));
//					
//					paramVo.setThumbImage("<img src" + thumbPath + ">");
//				}
//				
//				paramVo.setSeq(requestMap.get("seq"));
//				
//				if(!"".equals(StringUtils.defaultIfEmpty(requestMap.get("title"), ""))){
//					paramVo.setTitle(requestMap.get("title"));
//				}
//				if(!"".equals(StringUtils.defaultIfEmpty(requestMap.get("smarteditor"), ""))){
//					paramVo.setContents(requestMap.get("smarteditor"));
//				}
//				if(!"".equals(StringUtils.defaultIfEmpty(requestMap.get("hitCount"), ""))){
//					paramVo.setHitCount(requestMap.get("hitCount"));
//				}
//				paramVo.setBoardName(CommonConstant.LEARNSTRATEGY_BOARD);
//				paramVo.setUpdateUserId(SecurityContextHolder.getContext().getAuthentication().getName());
//				result = boardService.updateBoard(paramVo);
//				
//				if(result == 0){
//					// 에러 페이지 처리
//				}
//				
//			} else {
//				// 에러 페이지 처리
//			}
//			response.sendRedirect("/academy/academyInvestStrategy.do");
//			
		} catch (Exception e) {
			// TODO 에러 페이지 처리
			
		}	
	}
	
	@RequestMapping(value = "academyInvestStrategyReplyAdd.do")
	public ModelAndView academyInvestStrategyReplyAdd(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("/main/commonPage");
		
		try {
//			String replyText = StringUtils.defaultIfEmpty(request.getParameter("replyText"), ""); 
//			//원본 글 SEQ
//			String seq = StringUtils.defaultIfEmpty(request.getParameter("seq"), "");
//			//댓글 SEQ
//			String rSeq = StringUtils.defaultIfEmpty(request.getParameter("rSeq"), "0");
//			String indent = StringUtils.defaultIfEmpty(request.getParameter("indent"), "");
//			String step = StringUtils.defaultIfEmpty(request.getParameter("step"), "0");
//			String isReply = StringUtils.defaultIfEmpty(request.getParameter("isReply"), "");
//			
//			//댓글 참조하는 seq 리스트
//			List<String> seqList = null;
//			Map<String, Object> paramMap = new HashMap<String, Object>();
//			paramMap.put("boardName", CommonConstant.LEARNSTRATEGY_BOARD);
//			paramMap.put("ref",seq);
//			
//			List<String> refList = new ArrayList<String>();
//			refList.add(seq);
//			paramMap.put("list", refList);
//			seqList = getReplyList(paramMap,new ArrayList<String>());
//			seqList.add(seq);			
//			
//			if(!"".equals(seq) && !"".equals(replyText)){
//				
//				BoardVo paramVo = new BoardVo();
//				paramVo.setBoardName(CommonConstant.LEARNSTRATEGY_BOARD);
//				paramVo.setContents(replyText);
//				//댓글의 댓글일 경우
//				if(!"".equals(isReply)){
//					paramVo.setRef(rSeq);
//					paramVo.setStep(String.valueOf((Integer.parseInt(step) + 1)));
//				//댓글일 경우
//				} else {
//					paramVo.setRef(seq);					
//					paramMap.put("list", seqList);					
//					paramVo.setStep(String.valueOf((boardService.selectBoardReplyCount(paramMap)+1)));
//				}
//				
//				if(!"".equals(indent)){
//					paramVo.setIndent(String.valueOf((Integer.parseInt(indent) + 1)));
//				} else {
//					paramVo.setIndent("1");					
//				}
//				
//				paramVo.setCreateUserId(SecurityContextHolder.getContext().getAuthentication().getName());
//				
//				Map<String, Object> replyParam = new HashMap<String, Object>();
//				replyParam.put("list", seqList);
//				replyParam.put("boardName", CommonConstant.LEARNSTRATEGY_BOARD);
//				replyParam.put("step", String.valueOf((Integer.parseInt(step) + 1)));
//				
//				if(!"".equals(isReply)){
//					boardService.updateBoardAddReply(replyParam);
//				}
//				
//				boardService.insertBoard(paramVo);		
//				
//				mav.addObject("page","/academy/academyInvestStrategyView.do");
//				mav.addObject("seq",seq);				
//			}
			
		} catch (Exception e) {
			// TODO: 에러처리
			
		}
		
		return mav;
		
	}
	
	@RequestMapping(value = "academyInvestStrategyReplyDel.do")
	public ModelAndView academyInvestStrategyReplyDel(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("/main/commonPage");
		
		try {
//			//원본 글 SEQ
//			String seq = StringUtils.defaultIfEmpty(request.getParameter("seq"), "");
//			//댓글 SEQ
//			String rSeq = StringUtils.defaultIfEmpty(request.getParameter("rSeq"), "");
//			String step = StringUtils.defaultIfEmpty(request.getParameter("step"), "0");
//			
//			if(!"".equals(rSeq)){
//				
//				int boardCount = 0;
//				
//				Map<String, String> param = new HashMap<String, String>();
//				param.put("boardName", CommonConstant.LEARNSTRATEGY_BOARD);
//				param.put("seq", rSeq);
//				
//				Map<String, Object> paramMap = new HashMap<String, Object>();
//				paramMap.put("boardName", CommonConstant.LEARNSTRATEGY_BOARD);
//				paramMap.put("ref", rSeq);
//				
//				//관련 댓글이 모두 삭제되기 때문에 참조하는 댓글의 개수를 가져온다.
//				
//				List<String> refList = new ArrayList<String>();
//				refList.add(rSeq);
//				paramMap.put("list", refList);
//				List<String> seqList = getReplyList(paramMap,new ArrayList<String>());
//				seqList.add(rSeq);
//				paramMap.put("list", seqList);
//				paramMap.put("cnt", boardService.selectBoardReplyCount(paramMap)+1);
//				paramMap.put("step", step);
//				boardService.deleteBoardReply(paramMap);
//				//관련 댓글이 삭제되는 만큼 그 보다 큰 수의 있던 댓글의 step 을 삭제된 만큼 업데이트 시켜준다.
//				seqList.add(seq);
//				paramMap.put("list", seqList);
//				boardService.updateBoardDelReply(paramMap);
//				
//				
//				mav.addObject("page","/academy/academyInvestStrategyView.do");
//				mav.addObject("seq",seq);				
//			}
			
		} catch (Exception e) {
			// TODO: 에러처리
			
		}
		
		return mav;
		
	}
	
	@RequestMapping(value = "academyInvestStrategyReplyUpdate.do")
	public ModelAndView academyInvestStrategyReplyUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/main/commonPage");
		
		try {
			//원본 글 SEQ
			String seq = StringUtils.defaultIfEmpty(request.getParameter("seq"), "");
			//댓글 SEQ
			String rSeq = StringUtils.defaultIfEmpty(request.getParameter("rSeq"), "");
			String replyText = StringUtils.defaultIfEmpty(request.getParameter("replyText"), "");
			
			if(!"".equals(rSeq) && !"".equals(replyText)){
				
				BoardVo paramVo = new BoardVo();
				paramVo.setBoardName(CommonConstant.LEARNSTRATEGY_BOARD);
				paramVo.setSeq(rSeq);
				paramVo.setContents(replyText);
				paramVo.setUpdateUserId(SecurityContextHolder.getContext().getAuthentication().getName());
				
				boardService.updateBoard(paramVo);
				
				mav.addObject("page","/academy/academyInvestStrategy.do");
				mav.addObject("seq",seq);				
			}
			
		} catch (Exception e) {
			// TODO: 에러처리
			
		}
		
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
