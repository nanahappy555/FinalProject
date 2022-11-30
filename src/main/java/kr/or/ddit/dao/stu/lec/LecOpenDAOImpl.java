package kr.or.ddit.dao.stu.lec;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.prof.LecOpenVO;

public class LecOpenDAOImpl implements LecOpenDAO{
	
	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public LecOpenVO selectOne(String lecCd) throws SQLException {
		LecOpenVO selectOne = session.selectOne("LecOpen-Mapper.selectOne", lecCd);
		return selectOne;
	}
	
	@Override
	public List<LecOpenVO> selectList() throws SQLException {
		List<LecOpenVO> list = session.selectList("LecOpen-Mapper.selectList");
		return list;
	}

	@Override
	public void addStuNum(String lecCd) throws SQLException {
			session.update("LecOpen-Mapper.addStuNum", lecCd);
	}

	@Override
	public void subtractStuNum(String lecCd) {
			session.update("LecOpen-Mapper.subtractStuNum", lecCd);
	}
	
	@Override
	public List<LecOpenVO> selectLecAssSubmitStuList(String memId) throws SQLException {
		List<LecOpenVO> list = session.selectList("LecOpen-Mapper.selectLecAssSubmitStuList",memId); 
		return list;
	}

}
