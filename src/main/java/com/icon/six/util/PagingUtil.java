package com.icon.six.util;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

@Component
public class PagingUtil {
	
	/**
	 * totalCount : 총 개수
	 * pagingCount : 한페이지에 표시 개수
	 * currentPage : 현재 페이지
	 * startPage : 첫 페이지
	 * endPage : 끝 페이지
	 * prevPage : 전 페이지
	 * nextPage : 다음 페이지  
	 */
	
	private static int totalCount = 0 ;				
	private static int currentPage = 0;
	private static int startPage = 0;
	private static int endPage = 0;
	private static int prevPage = 0;
	private static int nextPage = 0;	
	private static int pageCount = 10;	
	
	public static Map<String, Object> setPageView(Map<String, Object> pageInfo){
		
		Logger logger = Logger.getLogger(PagingUtil.class);
		Map<String, Object> resultMap = null;
		
		StringBuffer pageString = new StringBuffer();
		
		try {
			totalCount = Integer.parseInt(String.valueOf(pageInfo.get("totalCount"))); 			
			currentPage  = Integer.parseInt(String.valueOf(pageInfo.get("currentPage")));
			totalCount = (totalCount / pageCount) + 1;
			
			if((currentPage%pageCount) != 0){
				if(currentPage<=pageCount){
					startPage = 1;
					prevPage = 1;
				} else {
					startPage = (currentPage/pageCount)*pageCount+1;
					prevPage = ((currentPage/pageCount)-1)*pageCount+1;
				}				
				endPage = ((currentPage/pageCount)+1) * pageCount;
				nextPage = ((currentPage/pageCount)+1)*pageCount+1;
				
			} else {
				if(currentPage<=pageCount){
					startPage = 1;
					prevPage = 1;
				} else {
					startPage = ((currentPage/pageCount)-1)*pageCount+1;
					prevPage = ((currentPage/pageCount)-1)*pageCount+1;
				}				
				
				endPage = (currentPage/pageCount) * pageCount;				
				nextPage = ((currentPage/pageCount))*pageCount+1;
			}
			
			if(nextPage >= totalCount){
				nextPage = totalCount;
			}
			
			pageString.append("<div class=\"paging\">");
			pageString.append("<a href=\"#\" class=\"prev2\" onclick=\"pageMove('1')\"><img src=\"/resources/img/prev2.png\" alt=\"처음\"></a>");
			pageString.append("<a href=\"#\" class=\"prev1\" onclick=\"pageMove('"+prevPage+"')\"><img src=\"/resources/img/prev1.png\" alt=\"이전\"></a>");
			pageString.append("<ul class=\"paging_list\">");
			
			System.out.println("startPage : " + startPage + ", endPage : " + endPage + ", currentPage : " + currentPage + ", totalCount : " + totalCount);
			
			if(totalCount == 0){
				pageString.append("<li class=\"on\"><a href=\"#\" onclick=\"pageMove('1')\">1</a></li>");				
			} else if(totalCount <= endPage){
				for(int i=startPage;i<=totalCount;i++){
					if(i == currentPage){
						pageString.append("<li class=\"on\"><a href=\"#\" onclick=\"pageMove('"+i+"')\">"+i+"</a></li>");
					} else {
						pageString.append("<li><a href=\"#\" onclick=\"pageMove('"+i+"')\">"+i+"</a></li>");
					}
				}
			} else {
				for(int i=startPage;i<=endPage;i++){
					if(i == currentPage){
						pageString.append("<li class=\"on\"><a href=\"#\" onclick=\"pageMove('"+i+"')\">"+i+"</a></li>");
					} else {
						pageString.append("<li><a href=\"#\" onclick=\"pageMove('"+i+"')\">"+i+"</a></li>");
					}
				}
			}
			
			pageString.append("</ul>");
			pageString.append("<a href=\"#\" class=\"next1\" onclick=\"pageMove('"+nextPage+"')\"><img src=\"/resources/img/next1.png\" alt=\"이전\"></a>");
			pageString.append("<a href=\"#\" class=\"next2\" onclick=\"pageMove('"+totalCount+"')\"><img src=\"/resources/img/next2.png\" alt=\"끝\"></a>");
			pageString.append("</div>");			
			
			resultMap = new HashMap<>();
			resultMap.put("page", pageString);
			
			if(currentPage == 1){
				resultMap.put("start", 0);
			} else {
				resultMap.put("start", (currentPage-1)*pageCount);
			}
						
			resultMap.put("end", pageCount);
			
		}  catch (Exception e) {
			// TODO: 에러 페이지 설정
			logger.debug("페이지 생성 시 파일 불러오기 오류");
		}
				
		return resultMap;
	}
	
	public static void main(String[] args){
		
		int i=10;
		int start = 0;
		int end = 0;
		int prev = 0;
		int next = 0;
		
		if((i%10) != 0){
			if(i<=10){
				start = 1;
				prev = 1;
			} else {
				start = (i/10)*10;
				prev = ((i/10)-1)*10+1;
			}
			end = ((i/10)+1)*10;
			next = ((i/10)+1)*10+1;
		} else {
			if(i<=10){
				start = 1;
				prev = 1;
			} else {
				start = ((i/10)-1)*10;
				prev = ((i/10)-1)*10+1;
			}
			end = (i/10) * 10;			
			next = ((i/10))*10+1;
		}
		
		System.out.println("start : " + start + " , end : " + end);
		System.out.println("prev : " + prev + " , next : " + next);
	}
	
}
