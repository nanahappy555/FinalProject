package kr.or.ddit.dao.prof;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.dto.prof.MarkVO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MarkDAOImpl implements MarkDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<MarkVO> selectAllStudent(String LecCd) throws SQLException {
		

		List<MarkVO> allStudent = session.selectList("Mark-Mapper.selectAllStudents", LecCd);
		return allStudent;
	}

	@Override
	public List<MarkVO> selectMidScore(String LecCd) throws SQLException {
		List<MarkVO> midList = session.selectList("Mark-Mapper.selectMidScore", LecCd);
		return midList;
	}

	@Override
	public List<MarkVO> selectFinScore(String LecCd) throws SQLException {
		List<MarkVO> finList = session.selectList("Mark-Mapper.selectFinScore", LecCd);
		return finList;
	}

	@Override
	public List<MarkVO> selectAssScore(String LecCd) throws SQLException {
		List<MarkVO> assList = session.selectList("Mark-Mapper.selectAssScore", LecCd);
		return assList;
	}

	@Override
	public List<MarkVO> selectAttendScore(String LecCd) throws SQLException {
		List<MarkVO> attendList = session.selectList("Mark-Mapper.selectAttendInfo", LecCd);
		
		return attendList;
	}

	@Override
	public MarkVO selectRatio(String lecCd) throws SQLException {
		MarkVO vo = session.selectOne("Mark-Mapper.selectRatio",lecCd);
		return vo;
	}

	@Override
	public void updateScore(MarkVO vo) throws SQLException {
		log.debug("점수업데이트 : "+vo);
		session.update("Mark-Mapper.updateScoretoLec",vo);
	}

	@Override
	public MarkVO selectMidScore(MarkVO vo) throws SQLException {
		MarkVO mark = session.selectOne("Mark-Mapper.selectMidScoreInApply",vo);
		return mark;
	}

	@Override
	public void insertMidScore(MarkVO vo) throws SQLException {
		session.insert("Mark-Mapper.insertMidScoreInApply",vo);
	}

	@Override
	public void updateMidScore(MarkVO vo) throws SQLException {
		session.update("Mark-Mapper.updateMidScoreInApply",vo);
	}

	@Override
	public MarkVO selectFinScore(MarkVO vo) throws SQLException {
		MarkVO mark = session.selectOne("Mark-Mapper.selectFinScoreInApply",vo);
		return mark;
	}

	@Override
	public void insertFinScore(MarkVO vo) throws SQLException {
		session.insert("Mark-Mapper.insertFinScoreInApply",vo);		
	}

	@Override
	public void updateFinScore(MarkVO vo) throws SQLException {
		session.update("Mark-Mapper.updateFinScoreInApply",vo);
	}

}
