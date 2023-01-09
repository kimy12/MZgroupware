package com.mzgw.emp.service;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class CertificationService {
	
	public void certifiedPhoneNumber(String phoneNumber, String cerNum) {

		String api_key = "NCS5A8ZRIGKJNU2I";
	    String api_secret = "JZE5RFL6OG2YF0UVYDMEPYGUIEYPE53Y";
	    Message coolsms = new Message(api_key, api_secret);
	
	    
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phoneNumber);    
	    params.put("from", "01088961979");    
	    params.put("type", "SMS");
	    params.put("text", "[MZGroupware] : 인증번호는" + "["+cerNum+"]" + "입니다.");
	    params.put("app_version", "test app 1.2"); 
	
	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	    }

    }
}
