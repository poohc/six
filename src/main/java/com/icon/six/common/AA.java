package com.icon.six.common;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class AA {

	public static void main(String[] args) throws IOException {
		/*
		Document doc = Jsoup.connect("http://vip.mk.co.kr/newSt/rate/").get();
		
		Elements td = doc.select("table.table_1 td");
		
		String tempKospi = "";
		String tempKospi200 = "";
		String tempKosdak = "";
		
		for(int i=0;i<td.size();i++){
			if(i==0){
				System.out.println(td.text());
				System.out.println(td.text().substring(0,td.text().indexOf("코스피200")));
				System.out.println(td.text().substring(td.text().indexOf("코스피200"),td.text().indexOf("거래대금")));
				System.out.println(td.text().substring(td.text().indexOf("코스닥 지수"),td.text().indexOf("스타지수")));
				
				tempKospi = td.text().substring(0,td.text().indexOf("코스피200"));
				tempKospi200 = td.text().substring(td.text().indexOf("코스피200"),td.text().indexOf("거래대금"));
				tempKosdak = td.text().substring(td.text().indexOf("코스닥 지수"),td.text().indexOf("스타지수"));
			}
		}
		
		String[] kospiArray = tempKospi.split(" ");
		String[] kospi200Array = tempKospi200.split(" ");
		String[] kosdakArray = tempKosdak.split(" ");
		
		System.out.println(kospiArray[2] + kospiArray[3] + kospiArray[4] + kospiArray[5]); 
		System.out.println(kospi200Array[1] + kospi200Array[2] + kospi200Array[3] + kospi200Array[4]);
		System.out.println(kosdakArray[2] + kosdakArray[3] + kosdakArray[4] + kosdakArray[5]);
		*/
		String a = "<img src=\"/resources/photoUpload/20151103172746ad18aefd-43ca-4128-950d-a6daaf5303fb.png\">";
//		String a = "<img src=\"/resources/photoUpload/201511161424176d2d0c67-40c6-4755-aae1-f1da166fac6f.jpg\" width=\"550\">";
		String b = "=\"/resources/photoUpload/20151117134519145fd0c1-9a5c-45d5-9777-5618733c5d4e.jpg\" width=\"550\"";
		
		
//		System.out.println(a);
//		
//		if(a.indexOf("width") > 0){
//			a = a.substring(0, a.indexOf("width"));
//			a += "width=\"95\" height=\"66\">";
//		} else {
//			a = a.substring(0, (a.indexOf(">")-1));
//			a += "\" width=\"95\" height=\"66\">";
//		}
//		
//		System.out.println(a);
		
		System.out.println(b);
		
		if(b.indexOf("width") > 0){
			b = b.substring(0,b.indexOf("width"));
		} 
		
		System.out.println("<img src" + b + ">");
		
	}
	
}
