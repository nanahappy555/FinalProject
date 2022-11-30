package kr.or.ddit.dao.prof;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.prof.ProfVO;
public class ProfDAOImpl implements ProfDAO {

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public ProfVO selectProfByProfId(String profId) throws SQLException {
		ProfVO profVO = session.selectOne("Prof-Mapper.selectProfByProfId",profId);
		return profVO;
	}

	@Override
	public ProfVO selectColNameMajorNameByProfCd(String profCd) throws SQLException {
		ProfVO profVO = session.selectOne("Prof-Mapper.selectColNameMajorNameByProfCd",profCd);
		return profVO;
	}

}
