package kr.or.ddit.service.prof;

import java.sql.SQLException;

import kr.or.ddit.dto.prof.MarksStdVO;

public interface MarksStdService {
	public void registMarksStd(MarksStdVO vo,String sylCd)throws SQLException;

}
