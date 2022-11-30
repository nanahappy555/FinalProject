package kr.or.ddit.service.staff;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.staff.ScNoticeVO;

public interface ScNoticeService {
	
	Map<String, Object> getScNoticeList(Criteria cri) throws SQLException;

	ScNoticeVO selectOneScNotice(int scNno) throws SQLException;
	
	void modifyScNotice(ScNoticeVO scNotice) throws SQLException;

	void regist(ScNoticeVO scNotice) throws SQLException;

	void modify(ScNoticeVO scNotice) throws SQLException;
	
	void remove(int scNno) throws SQLException;
	
	


	
}
 