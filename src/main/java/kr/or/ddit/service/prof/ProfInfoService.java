package kr.or.ddit.service.prof;

import java.sql.SQLException;

import kr.or.ddit.dto.prof.ProfVO;

public interface ProfInfoService {

	ProfVO getColNameMajorNameByProfCd(String profCd) throws SQLException;
}
