package kr.or.ddit.dao.stu.aca;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.stu.ClubVO;
import kr.or.ddit.dto.stu.StuMajorVO;

public interface StuMajorDAO {

	List<StuMajorVO> selectStuMajorList(String stuCd) throws SQLException;
	
	String selectCollegeNameByStuCd(String stuCd) throws SQLException;

	ClubVO selectClub(String stuCd);
}
