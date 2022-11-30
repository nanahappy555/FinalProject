package kr.or.ddit.service.prof;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.command.Criteria;

public interface LectureListForProfService {

	Map<String, Object> getLectureListForProfByProfId(HttpSession session, Criteria cri) throws SQLException;

}
