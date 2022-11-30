package kr.or.ddit.dao.staff;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.staff.StaffMajorChangeVO;
import kr.or.ddit.dto.stu.MajorChangeVO;

public class StaffMajorChangeDAOImpl implements StaffMajorChangeDAO {
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<StaffMajorChangeVO> selectStaffMajorChangeList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		
		RowBounds rowBunds = new RowBounds(offset,limit);
		
		
		List<StaffMajorChangeVO> selectMagerChangeList = session.selectList("StaffMajorChange-Mapper.selectStaffMajorChangeList",cri,rowBunds);
		
		return selectMagerChangeList;
	}

	@Override
	public void updateApplyStatus(MajorChangeVO majChaVO) {
		session.update("StaffMajorChange-Mapper.updateApplyStatus",majChaVO);
	}

	@Override
	public int selectSearchMajorChangeCount(Criteria cri) throws SQLException {
		int searchCount = session.selectOne("StaffMajorChange-Mapper.selectSearchMajorChangeCount",cri);
		return searchCount;
	}

}
