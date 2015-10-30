package com.icon.six.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class StringUtil {
	
	public static String nullCheckMap(HashMap map){
		Set set = map.entrySet();
		Iterator it = set.iterator();
		String result = "NotNull";
		
		while (it.hasNext()) {
			Map.Entry e = (Map.Entry) it.next();
			if(e.getValue()==null){
				result = "Null";
			}
		}
		System.out.println(map);
		return result;
	}
	
	public static String removeTag(String html) throws Exception {
	    return html.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	}
	
}
