package kr.or.ddit.dao.prof;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.dto.prof.ClassAttitudeVO;
import kr.or.ddit.dto.prof.SpecialNoteVO;
import kr.or.ddit.dto.stu.StudentVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Repository
public class ProfCounselDAOImpl implements ProfCounselDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<StudentVO> selectStuListByMajorCd(String majorCd) throws SQLException {
		
			List<StudentVO> studentList = session.selectList("Student-Mapper.selectStuListByMajorCd",majorCd);
		return studentList;
	}

	@Override
	public ClassAttitudeVO selectClassAttitude(String stuCd) throws SQLException {
		ClassAttitudeVO classAttitude = session.selectOne("ProfCounsel-Mapper.selectClassAttitude",stuCd);
		log.debug("DAO classAttitude : "+ classAttitude);
		return classAttitude;
	}

	@Override
	public List<String> selectStuListByProfId(String profCd) throws SQLException {
		return session.selectList("ProfCounsel-Mapper.selectStuListByProfId",profCd);
	}

	@Override
	public List<SpecialNoteVO> selectSpecialNoticeList(String stuCd) throws SQLException {
		return session.selectList("ProfCounsel-Mapper.selectSpecialNoticeList",stuCd);
	}

	@Override
	public SpecialNoteVO selectSpecialNotice(int specialSeq) throws SQLException {
		return session.selectOne("ProfCounsel-Mapper.selectSpecialNotice",specialSeq);
	}

	@Override
	public void insertSpecialNotice(SpecialNoteVO special) throws SQLException {
		session.insert("ProfCounsel-Mapper.insertSpecialNotice",special);
	}

	@Override
	public void updateSpecialNotice(SpecialNoteVO special) throws SQLException {
		session.update("ProfCounsel-Mapper.updateSpecialNotice",special);
	}

	@Override
	public int selectSpecialSeq() throws SQLException {
		return session.selectOne("ProfCounsel-Mapper.selectSpecialSeq");
	}

}
