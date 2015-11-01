package com.icon.six.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mortennobel.imagescaling.ResampleOp;

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
			String index = StringUtils.defaultIfEmpty(request.getHeader("file-Index"), "");
			String sFileInfo = "";
			BufferedImage oriImage = null;
			 //파일 확장자
	        String filename_ext = fileName.substring(fileName.lastIndexOf(".")+1);
	        //확장자를소문자로 변경
	        filename_ext = filename_ext.toLowerCase();
	        //파일 기본경로
	        String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	        //파일 기본경로 _ 상세경로
//	        String filePath = dftFilePath + "resource" + File.separator + "photo_upload" + File.separator;
	        String filePath = dftFilePath + imageUploadPath;
	        System.out.println("index : " + index + ", filePath : " + filePath);
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
	        oriImage = ImageIO.read(is);
	        
//	        OutputStream os=new FileOutputStream(rlFileNm);
//	        int numRead;
//	        byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
//	        while((numRead = is.read(b,0,b.length)) != -1){
//	           os.write(b,0,numRead);
//	        }
//	        if(is != null) {
//		       is.close();
//		    }
//	        os.flush();
//	        os.close();
	        ImageIO.write(oriImage, filename_ext, new File(rlFileNm));
	        
	        if("0".equals(index)){
	        	String thumbFileNm = "";
	        	thumbFileNm = rlFileNm.substring(0,rlFileNm.length()-filename_ext.length()) + "thumb." + filename_ext;
	        	File thumbFile = new File(thumbFileNm);
	        	is = request.getInputStream();
	        	ResampleOp resampleOp = new ResampleOp(68,50);
	        	BufferedImage rescaledImage = resampleOp.filter(oriImage, null);
	        	ImageIO.write(rescaledImage, filename_ext, thumbFile);
	        	sFileInfo += "&thumbFile="+thumbFileNm;
	        }
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
	
	@RequestMapping(value = "fileDownLoad.do")
	public ModelAndView fileDownLoad(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("downloadView");
		
		String fileName = StringUtils.defaultIfEmpty(request.getParameter("fileName"), "");
		String dftFilePath = request.getSession().getServletContext().getRealPath("/");
		fileUploadPath = fileUploadPath.replace("/", File.separator); 
		
		if(!"".equals(fileName)){
			
			mav.addObject("fileName", new File(dftFilePath + fileUploadPath + fileName));
			
		} else {
			//TODO 에러처리
			
		}
		
		return mav;
	}
	
}