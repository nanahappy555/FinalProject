package kr.or.ddit.dao.stu;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.stu.AcaVO;
import kr.or.ddit.dto.stu.ClubVO;
import kr.or.ddit.dto.stu.StuColMajor;
import kr.or.ddit.dto.stu.StudentVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
public class InfoDAOImpl implements InfoDAO{

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public StudentVO selectInfo(String id) throws SQLException {
		StudentVO student = session.selectOne("Student-Mapper.selectInfo",id);
		return student;
	}
	
	@Override
	public void updateInfo(StudentVO student) throws SQLException {
		session.update("Info-Mapper.updateInfo",student);
	}
	
	@Override
	public void updateAccount(StudentVO student) throws SQLException {
		session.update("Info-Mapper.updateAccount",student);
	}
	@Override
	public StuColMajor selectStuColMajorInfo(String stuCd) {
		return session.selectOne("Student-Mapper.selectStuColMajorInfo",stuCd);
	}

	@Override
	public List<AcaVO> selectAllAcaRecord(String stuCd) throws SQLException {
		return session.selectList("Info-Mapper.selectAllAcaRecord",stuCd);
	}

	@Override
	public List<ClubVO> selectClubList() throws SQLException {
		List<ClubVO> clubList =  session.selectList("Student-Mapper.selectClubList");
		log.debug("다오 clubList : "+clubList);
		return clubList;
	}

	@Override
	public void updateMbti(StudentVO stu) throws SQLException {
		session.update("Info-Mapper.updateMbti",stu);
	}

	@Override
	public MemberVO checkInfo(MemberVO member) throws SQLException {
		return session.selectOne("Info-Mapper.checkInfo",member);
	}

	
	
}
