package kr.or.ddit.dao.staff;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.staff.ScNoticeVO;

public interface ScNoticeDAO {
	
	List<ScNoticeVO> selectScNoticeList(Criteria cri) throws SQLException;

	ScNoticeVO selectOneScNotice(int scNno) throws SQLException;
	
	int selectScNoticeTotalCount(Criteria cri) throws SQLException;
	
	ScNoticeVO selectScNoticeByScNoticeNo(ScNoticeVO scNotice) throws SQLException;
	
	
	void insertscNotice(ScNoticeVO scNotice) throws SQLException;
	
	void updatescNotice(ScNoticeVO scNotice) throws SQLException;

	void deletescNotice(int scNno) throws SQLException;
	
	// viewcnt 증가
	void increaseViewCnt(int scNno) throws SQLException;
	
	int selectScNnoNextValue() throws SQLException;
	

}
