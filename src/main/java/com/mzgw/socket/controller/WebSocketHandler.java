package com.mzgw.socket.controller;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mzgw.dto.EmpVO;
import com.mzgw.dto.PushVO;
import com.mzgw.push.service.PushService;


@Repository
public class WebSocketHandler extends TextWebSocketHandler {

   @Autowired
   SqlSession sqlsession;
   
   @Autowired
   PushService pushService;
   
   private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();

   @Override
   public void afterConnectionEstablished(WebSocketSession session) throws Exception{
	  System.out.println(session.getId()+" 연결됨");
	  Map<String, Object> attributes = session.getAttributes();
      users.put(session.getId(), session);
      
   }
   
   @Override
   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
      String msg = message.getPayload();
//      ObjectMapper mapper = new ObjectMapper();
//      Map<String, Object> map = mapper.readValue(message.getPayload(), Map.class);
  	  // js에서 보낸 세션 아이디 값 
      System.out.println("여기임다-------------------------------------------------------");
      System.out.println(msg);
      System.out.println("여기임다-------------------------------------------------------");
      EmpVO sendemp = (EmpVO) session.getAttributes().get("loginEmp");
//      if(StringUtils.isNotEmpty(msg)) {
//         String sendId = msg;
//         // 현재 session에 담겨있는 모든 사용자를 체크하기 위함.
//         for (WebSocketSession responseIdSession : users.values()) {
//            if (responseIdSession != null) {
//               TextMessage tmpMsg = new TextMessage(sendId);
//               responseIdSession.sendMessage(tmpMsg);
//            }
//         }
//      }
      
      for (WebSocketSession responseIdSession : users.values()) {
        if (responseIdSession != null) {
        	
        	EmpVO revemp = (EmpVO) responseIdSession.getAttributes().get("loginEmp");
        	if(sendemp.getEmpl_no() != revemp.getEmpl_no()) {
        		PushVO newPush = pushService.getNewPush(revemp);
        		if(newPush!=null) {
        			System.out.println(newPush.getPushCn()); 
	        		TextMessage tmpMsg = new TextMessage("pushCheck");
	        		responseIdSession.sendMessage(tmpMsg);
        		}
        	}
           
        }
     }
   }
   
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
	   System.out.println(session.getId()+" 연결끊김");
      users.remove(session.getId());
   }
}