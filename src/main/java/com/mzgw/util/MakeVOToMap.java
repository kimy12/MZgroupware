package com.mzgw.util;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

public class MakeVOToMap {
	

	public static Map<String, Object> toMap(Object ...objects) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		for(Object object : objects) {
			
			Method[] methods = object.getClass().getMethods();
		
		
			for(Method method :methods) {
				String methodName = method.getName();
				if(!methodName.equals("getClass") && methodName.substring(0, 3).equals("get")) {
					String feildName = methodName.substring(3,4).toLowerCase() + methodName.substring(4);
					
					
					map.put(feildName, method.invoke(object));
					
				}
			}
		}
		return map;
	}
	

	
	
}
