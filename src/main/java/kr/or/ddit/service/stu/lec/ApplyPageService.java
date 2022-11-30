package kr.or.ddit.service.stu.lec;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.or.ddit.dto.stu.ApplyPageVO;

public interface ApplyPageService {
	public List<ApplyPageVO> getLectureList()throws SQLException;
	public HashMap<String, String> getCredits(HttpSession session) throws SQLException;
}
