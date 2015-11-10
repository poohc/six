package com.icon.six.scheduler;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.icon.six.service.BoardService;

public class StockScheduler {
	
private Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private BoardService boardService;
	
	public void insertStockInfo(){
		
		logger.debug("============== 주가 정보 가져오기 시작 !!! ==============");
		
		
		Document doc;
		try {
			doc = Jsoup.connect("http://vip.mk.co.kr/newSt/rate/").get();
			
			Elements td = doc.select("table.table_1 td");
			
			String tempKospi = "";
			String tempKospi200 = "";
			String tempKosdaq = "";
			
			for(int i=0;i<td.size();i++){
				if(i==0){
					tempKospi = td.text().substring(0,td.text().indexOf("코스피200"));
					tempKospi200 = td.text().substring(td.text().indexOf("코스피200"),td.text().indexOf("거래대금"));
					tempKosdaq = td.text().substring(td.text().indexOf("코스닥 지수"),td.text().indexOf("스타지수"));
				}
			}
			
			String[] kospiArray = tempKospi.split(" ");
			String[] kospi200Array = tempKospi200.split(" ");
			String[] kosdaqArray = tempKosdaq.split(" ");
			
			System.out.println(kospiArray[2] + kospiArray[3] + kospiArray[4] + kospiArray[5]); 
			System.out.println(kospi200Array[1] + kospi200Array[2] + kospi200Array[3] + kospi200Array[4]);
			System.out.println(kosdaqArray[2] + kosdaqArray[3] + kosdaqArray[4] + kosdaqArray[5]);
			
			Map<String, Object> param = new HashMap<String, Object>();
			
			param.put("kospi", kospiArray[2]);
			param.put("kospiUpdownVal", kospiArray[3]+kospiArray[4]);
			param.put("kospiUpdownPer", kospiArray[5]);
			
			param.put("kospi200", kospi200Array[1]);
			param.put("kospi200UpdownVal", kospi200Array[2]+kospi200Array[3]);
			param.put("kospi200UpdownPer", kospi200Array[4]);
			
			param.put("kosdaq", kosdaqArray[2]);
			param.put("kosdaqUpdownVal", kosdaqArray[3]+kosdaqArray[4]);
			param.put("kosdaqUpdownPer", kosdaqArray[5]);
			
			boardService.insertScheduleStock(param);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		logger.debug("============== 주가 정보 가져오기 끝 !!! ==============");
		
	}
	
}
