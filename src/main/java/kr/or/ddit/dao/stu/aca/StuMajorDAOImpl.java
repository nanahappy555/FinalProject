package kr.or.ddit.dao.stu.aca;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.stu.ClubVO;
import kr.or.ddit.dto.stu.StuMajorVO;

public class StuMajorDAOImpl implements StuMajorDAO{
	
	SqlSession session;
	public void setSqlSession(SqlSession session){
		this.session=session;
	}
	
	@Override
	public List<StuMajorVO> selectStuMajorList(String stuCd) throws SQLException {
		List<StuMajorVO> stuMajorList= session.selectList("StuMajor-Mapper.selectStuMajorList",stuCd);
		return stuMajorList;
	}
	@Override
	public String selectCollegeNameByStuCd(String stuCd) throws SQLException{
		return session.selectOne("StuMajor-Mapper.selectCollegeNameByStuCd",stuCd);
	}

	@Override
	public ClubVO selectClub(String stuCd) {
		return session.selectOne("StuMajor-Mapper.selectClub",stuCd);
	}
}
