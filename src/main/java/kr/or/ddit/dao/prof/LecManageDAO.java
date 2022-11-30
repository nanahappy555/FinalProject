package kr.or.ddit.dao.prof;

import java.sql.SQLException;

import kr.or.ddit.dto.prof.LecManageVO;

public interface LecManageDAO {
	public LecManageVO selectLecManageBySubjCd(String subjCd)throws SQLException;
	
	//강의 코드로 과목찾기
	public LecManageVO selectLecManageBySlyCd(String slyCd)throws SQLException;
	
}
