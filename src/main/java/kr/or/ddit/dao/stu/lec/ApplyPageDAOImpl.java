package kr.or.ddit.dao.stu.lec;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.stu.ApplyPageVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ApplyPageDAOImpl implements ApplyPageDAO{

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<ApplyPageVO> selectLectureList() throws SQLException {
		
		List<ApplyPageVO> selectList = session.selectList("ApplyPage-Mapper.selectApplyPageList");
		
		return selectList;
	}

	@Override
	public String selectMaxCredit(HashMap<String,String> map) throws SQLException {
		String maxCredits = session.selectOne("ApplyPage-Mapper.selectMaxCreditbyStuCdSemeCd",map);
		return maxCredits;
	}

	@Override
	public String selectCurentCredit(String stuCd) throws SQLException {
		String currentCredits = session.selectOne("ApplyPage-Mapper.selectCurrentCreditByStuCd",stuCd);
		return currentCredits;
	}

}
