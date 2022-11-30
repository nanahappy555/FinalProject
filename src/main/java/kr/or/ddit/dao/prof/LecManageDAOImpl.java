package kr.or.ddit.dao.prof;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.prof.LecManageVO;

public class LecManageDAOImpl implements LecManageDAO {

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public LecManageVO selectLecManageBySubjCd(String subjCd)throws SQLException {
		LecManageVO lecManageVO = session.selectOne("LecManage-Mapper.selectLecManageBySubjCd", subjCd);
		return lecManageVO;
	}

	@Override
	public LecManageVO selectLecManageBySlyCd(String slyCd)throws SQLException {
		LecManageVO lecManageVO = session.selectOne("LecManage-Mapper.selectLecManageBySlyCd", slyCd);
		return lecManageVO;
	}

}
