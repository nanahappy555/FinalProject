package kr.or.ddit.dao.prof;

import java.sql.SQLException;

import kr.or.ddit.dto.prof.ProfVO;

public interface ProfDAO {
	ProfVO selectProfByProfId(String profId) throws SQLException;
	
	ProfVO selectColNameMajorNameByProfCd(String profCd) throws SQLException;
}
