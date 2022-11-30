package kr.or.ddit.dao.staff;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.staff.StaffDualVO;

public class StaffDualDAOImpl implements StaffDualDAO {

	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	
	
	@Override
	public List<StaffDualVO> selectStaffDualList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowbunds = new RowBounds(offset,limit);

		List<StaffDualVO> selectStaffDualList = session.selectList("StaffDual-Mapper.selectStaffDualList",cri,rowbunds);
		return selectStaffDualList;
	}



	@Override
	public void updateDualStatus(StaffDualVO staffDualVO) {
		session.update("StaffDual-Mapper.updateDualStatus", staffDualVO);
		
	}

	
	@Override
	public int selectSerachStaffDualCount(Criteria cri) throws SQLException {
		int selectSerachStaffDualCount = session.selectOne("StaffDual-Mapper.selectSerachStaffDualCount", cri);
		return selectSerachStaffDualCount;
	}
	


	@Override
	public List<StaffDualVO> selectStaffSubList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowbunds = new RowBounds(offset,limit);
		
		List<StaffDualVO> selectStaffSubList = session.selectList("StaffDual-Mapper.selectStaffSubList",cri,rowbunds);
		return selectStaffSubList;
	}


	@Override
	public void updateSubStatus(StaffDualVO staffDualVO) {
		session.update("StaffDual-Mapper.updateSubStatus", staffDualVO);
		
	}


	@Override
	public int selectSearchStaffSubCount(Criteria cri) throws SQLException {
		int selectSearchStaffSubCount = session.selectOne("StaffDual-Mapper.selectSearchStaffSubCount",cri);
		return selectSearchStaffSubCount;
	}

}
