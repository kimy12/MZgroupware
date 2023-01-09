package kr.or.ddit;

import static org.junit.Assert.*;

import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

import com.mzgw.dto.AttachVO;
import com.mzgw.dto.EmpVO;

public class test11 {

	public test11() throws Exception {
		AttachVO vo = new AttachVO();
		
		vo.setAno(5);
		
		not(vo);
	}
	
	@Test
	public void test()  {
		
		
	
	}

	public static void not(Object ...objects) throws Exception {
		
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
		
	}
}
