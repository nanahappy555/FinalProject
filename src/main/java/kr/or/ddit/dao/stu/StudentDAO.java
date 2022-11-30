package kr.or.ddit.dao.stu;

import java.sql.SQLException;

import kr.or.ddit.dto.stu.StudentVO;

public interface StudentDAO {
	public StudentVO selectStudentByStuCd(String stuCd) throws SQLException;
	public StudentVO selectColInfo(String stuCd)throws SQLException;
	public StudentVO selectCreditInfo(String stuCd)throws SQLException;
	public StudentVO selectGradeInfo(String stuCd)throws SQLException;
	
}
