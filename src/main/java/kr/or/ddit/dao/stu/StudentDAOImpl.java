package kr.or.ddit.dao.stu;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.stu.StudentVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
public class StudentDAOImpl implements StudentDAO {

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public StudentVO selectStudentByStuCd(String stuCd) throws SQLException {
		StudentVO studentVO = session.selectOne("Student-Mapper.selectInfo",stuCd);
		return studentVO;
	}

	@Override
	public StudentVO selectColInfo(String stuCd) throws SQLException {
		log.debug("stuCd : "+stuCd);
		StudentVO student =  session.selectOne("Student-Mapper.selectColInfo",stuCd);
		log.debug("student : "+student);
		return student;
	}

	@Override
	public StudentVO selectCreditInfo(String stuCd) throws SQLException {
		StudentVO student = session.selectOne("Student-Mapper.selectCreditInfo",stuCd);
		log.debug("student : "+student);
		return student;
	}

	@Override
	public StudentVO selectGradeInfo(String stuCd) throws SQLException {
		StudentVO student = session.selectOne("Student-Mapper.selectGradeInfo",stuCd);
		log.debug("student : "+student);
		return student;
	}

	
}
