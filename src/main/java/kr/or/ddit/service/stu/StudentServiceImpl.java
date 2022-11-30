package kr.or.ddit.service.stu;

import java.sql.SQLException;

import kr.or.ddit.dao.stu.StudentDAO;
import kr.or.ddit.dto.stu.StudentVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
public class StudentServiceImpl implements StudentService {

	private StudentDAO studentDAO;
	
	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}

	@Override
	public StudentVO getStudentByStuCd(String stuCd) throws SQLException {
		StudentVO studentVO = studentDAO.selectStudentByStuCd(stuCd);
		return studentVO;
	}

	@Override
	public StudentVO selectStudentAcaInfo(String stuCd) throws SQLException {
		StudentVO studentCol =studentDAO.selectColInfo(stuCd);
		StudentVO studentCredit =studentDAO.selectCreditInfo(stuCd);
		StudentVO studentGrade =studentDAO.selectGradeInfo(stuCd);
		log.debug("studentCol : "+studentCol);
		log.debug("studentCredit : "+studentCredit);
		log.debug("studentGrade : "+studentGrade);
		StudentVO studentAcaInfo = new StudentVO();
		studentAcaInfo.setColName(studentCol.getColName());
		studentAcaInfo.setFirMajName(studentCol.getFirMajName());
		studentAcaInfo.setTotalCredit(studentCredit.getTotalCredit());
		studentAcaInfo.setTotalSeme(studentGrade.getTotalSeme());
		return studentAcaInfo;
	}

	

}
