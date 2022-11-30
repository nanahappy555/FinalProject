package kr.or.ddit.service.stu;

import java.sql.SQLException;

import kr.or.ddit.dto.stu.StudentVO;

public interface StudentService {
	public StudentVO getStudentByStuCd(String stuCd) throws SQLException;
	public StudentVO selectStudentAcaInfo(String stuCd) throws SQLException;
}
