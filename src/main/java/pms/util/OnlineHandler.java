package pms.util;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component("onlineHandler")
public class OnlineHandler extends TextWebSocketHandler{
	// 서버로 접속한 계정을 저장하는 필드 선언.
	private Map<String, Map> users = new ConcurrentHashMap();

	// 1. 접속시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> data = new HashMap();
		data.put("session", session);
		users.put(session.getId(), data);

		log(session.getId()+"님 접속합니다! 현재 접속자 수:"+users.size());
	}
	// 2. 메시지 전송시
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		log(session.getId()+"에서 온 메시지:"+message.getPayload());
		if((""+message.getPayload()).contains("add")) {
			users.get(session.getId()).put("mid",
					(""+message.getPayload()).replaceAll("[^0-9]", ""));
		}
		String temp = "";
		for(Map<String, Object> sv:users.values()){
			temp += sv.get("mid")+",";
		}

		for(Map<String, Object> sv:users.values()) {
			WebSocketSession ws = (WebSocketSession)sv.get("session");
			ws.sendMessage(new TextMessage(temp));
			log(ws.getId()+"에게 전달한 메시지:"+temp);
		}
	}
	// 3. 접속 종료시
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session.getId());

		String temp = "";
		for(Map<String, Object> sv:users.values()){
			temp += sv.get("mid")+",";
		}

		for(Map<String, Object> sv:users.values()) {
			WebSocketSession ws = (WebSocketSession)sv.get("session");
			ws.sendMessage(new TextMessage(temp));
			log(ws.getId()+"에게 전달한 메시지:"+temp);
		}

		log(session.getId()+"접속 종료합니다");
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId()+"에러 발생! 에러내용:"+exception.getMessage());

	}
	private void log(String msg) {
		System.out.println("# 온라인 체크 #"+ new Date()+":"+msg);
	}

}