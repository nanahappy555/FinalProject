package kr.or.ddit.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.ddit.dto.prof.LecOpenVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LectureApplyWebSocketHandler extends TextWebSocketHandler {

	
	private static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	
	public void sendLectureApplicant(LecOpenVO vo) throws IOException {
		for (WebSocketSession single : list) {
			TextMessage message = new TextMessage(vo.getLecCd()+":"+vo.getStuNum());
			single.sendMessage(message);
		}
	}
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		list.add(session); //리스트에 접속한 session들을 담음
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		for (WebSocketSession single : list) {
			single.sendMessage(message);
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		list.remove(session);
	}
	
}
