package com.icon.six.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("file")
public class FileController {
	
	@Value("${image.upload.path}")
	private String imageUploadPath;
	
	@Value("${file.upload.path}")
	private String fileUploadPath;
	
	@RequestMapping(value="imgFileUpload.do")
	public void imgFileUpload(HttpServletRequest request, HttpServletResponse response){
		
		try {
			String fileName = StringUtils.defaultIfEmpty(request.getHeader("file-name"), "");
			
			String sFileInfo = "";
			 //파일 확장자
	        String filename_ext = fileName.substring(fileName.lastIndexOf(".")+1);
	        //확장자를소문자로 변경
	        filename_ext = filename_ext.toLowerCase();
	        //파일 기본경로
	        String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	        //파일 기본경로 _ 상세경로
//	        String filePath = dftFilePath + "resource" + File.separator + "photo_upload" + File.separator;
	        String filePath = dftFilePath + imageUploadPath;
	        System.out.println("filePath : " + filePath);
	        File file = new File(filePath);
	        if(!file.exists()) {
	           file.mkdirs();
	        }
	        String realFileNm = "";
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	        String today= formatter.format(new java.util.Date());
	        realFileNm = today+UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
	        String rlFileNm = filePath + realFileNm;
	        ///////////////// 서버에 파일쓰기 ///////////////// 
	        InputStream is = request.getInputStream();
	        OutputStream os=new FileOutputStream(rlFileNm);
	        int numRead;
	        byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	        while((numRead = is.read(b,0,b.length)) != -1){
	           os.write(b,0,numRead);
	        }
	        if(is != null) {
	           is.close();
	        }
	        os.flush();
	        os.close();
	        ///////////////// 서버에 파일쓰기 /////////////////
	        // 정보 출력
	        sFileInfo += "&bNewLine=true";
	        // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	        sFileInfo += "&sFileName="+ fileName;
	        sFileInfo += "&sFileURL="+imageUploadPath+realFileNm;
	        PrintWriter print = response.getWriter();
	        print.print(sFileInfo);
	        print.flush();
	        print.close();
		} catch (Exception e) {
			// TODO: 에러 처리
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="imageUpload.do")
	public void imageFileUpload(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		if(ServletFileUpload.isMultipartContent(request)){
			ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
		    //UTF-8 인코딩 설정
		    uploadHandler.setHeaderEncoding("UTF-8");
		    List<FileItem> items = uploadHandler.parseRequest(request);
		    String realname = "";
		    Long size = 0L;
		    
		    //각 필드태그들을 FOR문을 이용하여 비교를 합니다.
		    for (FileItem item : items) {
		        //image.html 에서 file 태그의 name 명을 "image_file"로 지정해 주었으므로 
		        if(item.getFieldName().equals("image_file")) {
		            if(item.getSize() > 0) {
		                String ext = item.getName().substring(item.getName().lastIndexOf(".")+1);
		                //파일 기본경로
		                String defaultPath = request.getRealPath("/");
		                //파일 기본경로 _ 상세경로
		                String path = defaultPath + "upload" + File.separator;
		                
//		                path = imageUploadPath + File.separator;
		                
		                System.out.println("path : " + path);
		                
		                File file = new File(path);
		                 
		                //디렉토리 존재하지 않을경우 디렉토리 생성
		                if(!file.exists()) {
		                    file.mkdirs();
		                }
		                //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
		                realname = UUID.randomUUID().toString() + "." + ext;
		                size = item.getSize();
		                ///////////////// 서버에 파일쓰기 ///////////////// 
		                InputStream is = item.getInputStream();
		                OutputStream os=new FileOutputStream(path + realname);
		                int numRead;
		                byte b[] = new byte[(int)item.getSize()];
		                while((numRead = is.read(b,0,b.length)) != -1){
		                    os.write(b,0,numRead);
		                }
		                if(is != null)  is.close();
		                os.flush();
		                os.close();
		                ///////////////// 서버에 파일쓰기 /////////////////
		            }
		        }
		    }
		    response.setContentType("text/plain; charset=UTF-8");
		    PrintWriter pw = response.getWriter();
		    //json string 값으로 callback
		    //json 값으로 넘기는 필요 값
		    //imageurl, filename,filesize,imagealign
		    pw.print("{\"imageurl\" : \"/upload/"+realname+"\",\"filename\":\""+realname+"\",\"filesize\": 600,\"imagealign\":\"C\"}");
		    pw.flush();
		    pw.close();
		} 
		
	}
	
	@RequestMapping(value="fileUpload.do")
	public void fileUpload(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		if(ServletFileUpload.isMultipartContent(request)){
			ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
		    //UTF-8 인코딩 설정
		    uploadHandler.setHeaderEncoding("UTF-8");
		    List<FileItem> items = uploadHandler.parseRequest(request);
		    String realname = "";
		    Long size = 0L;
		    //각 필드태그들을 FOR문을 이용하여 비교를 합니다.
		    for (FileItem item : items) {
		        if(item.getFieldName().equals("file")) {
		            if(item.getSize() > 0) {
		                String ext = item.getName().substring(item.getName().lastIndexOf(".")+1);
		                //파일 기본경로
		                String defaultPath = request.getRealPath("/");
		                //파일 기본경로 _ 상세경로
		                String path = defaultPath + "upload" + File.separator;
		                
//		                String path = fileUploadPath + File.separator;
		                
		                System.out.println("path : " + path);
		                
		                File file = new File(path);
		                 
		                //디렉토리 존재하지 않을경우 디렉토리 생성
		                if(!file.exists()) {
		                    file.mkdirs();
		                }
		                //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
		                realname = UUID.randomUUID().toString() + "." + ext;
		                size = item.getSize();
		                ///////////////// 서버에 파일쓰기 ///////////////// 
		                InputStream is = item.getInputStream();
		                OutputStream os=new FileOutputStream(path + realname);
		                int numRead;
		                byte b[] = new byte[(int)item.getSize()];
		                while((numRead = is.read(b,0,b.length)) != -1){
		                    os.write(b,0,numRead);
		                }
		                if(is != null)  is.close();
		                os.flush();
		                os.close();
		                ///////////////// 서버에 파일쓰기 /////////////////
		            }
		        }
		    }
		    response.setContentType("text/plain; charset=UTF-8");
		    PrintWriter pw = response.getWriter();
		    //json string 값으로 callback
		    //json 값으로 넘기는 필요 값
		    //imageurl, filename,filesize,imagealign
		    pw.print("{\"fileurl\" : \"/upload/"+realname+"\",\"filename\":\""+realname+"\",\"filesize\": 600\"}");
		    pw.flush();
		    pw.close();
		} 
		
	}
	
}