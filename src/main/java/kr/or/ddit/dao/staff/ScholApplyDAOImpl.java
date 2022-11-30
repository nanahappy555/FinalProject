package kr.or.ddit.dao.staff;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.staff.ScholApplyListVO;
import kr.or.ddit.dto.stu.ScholApplyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ScholApplyDAOImpl implements ScholApplyDAO{
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	
	@Override
	public List<ScholApplyListVO> selectList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<ScholApplyListVO> selectScholList = session.selectList("ScholApply-Mapper.selectList",cri,rowBounds);
		return selectScholList;
		
	}

	@Override
	public void updateScholApply(ScholApplyVO scholVO) throws SQLException {
		session.update("ScholApply-Mapper.updateScholApply",scholVO);
	}

	@Override
	public int selectSearchTotalCount(Criteria cri) throws SQLException {
		int totalCount = session.selectOne("ScholApply-Mapper.selectSearchListTotalCount",cri);
		
		return totalCount;
	}

	
	
}
