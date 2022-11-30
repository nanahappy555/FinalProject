package kr.or.ddit.dao.staff;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.staff.StaffTlApplyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class StaffTlApplyDAOImpl implements StaffTlApplyDAO{
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<StaffTlApplyVO> selectStaffTlApplyList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowbunds = new RowBounds(offset,limit);
		log.debug("다오크리"+cri);
		List<StaffTlApplyVO> selectHuhakList = session.selectList("StaffTlApply-Mapper.selectStaffTlApplyList",cri,rowbunds);
		
		log.debug("TPFFPRXMFLTMM"+selectHuhakList.toString());
		
		return selectHuhakList;
	}

	
	@Override
	public List<StaffTlApplyVO> selectStaffBackApplyList(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowbunds = new RowBounds(offset,limit);
		
		List<StaffTlApplyVO> selectBokhakList = session.selectList("StaffTlApply-Mapper.selectStaffBackApplyList",cri,rowbunds);
		
		return selectBokhakList;
	}

	@Override
	public void updateTlStatus(StaffTlApplyVO staffTlApplyVO) {
		
		session.update("StaffTlApply-Mapper.updateTlStatus", staffTlApplyVO);
		
	}

	@Override
	public void updateBackStatus(StaffTlApplyVO staffTlApplyVO) {
		log.info("####다오들어옴" + staffTlApplyVO + "");
		session.update("StaffTlApply-Mapper.updateBackStatus", staffTlApplyVO);
		log.info("####다오나감" + staffTlApplyVO + "");
		
	}

	@Override
	public int selectStaffTlApplyListCount(Criteria cri) throws SQLException {
		int selectStaffTlApplyListCount = session.selectOne("StaffTlApply-Mapper.selectStaffTlApplyListCount",cri);
		
		return selectStaffTlApplyListCount;
	}

	@Override
	public int selectStaffBackApplyListCount(Criteria cri) throws SQLException {
		int selectStaffBackApplyListCount = session.selectOne("StaffTlApply-Mapper.selectStaffBackApplyListCount",cri);
		
		
		return selectStaffBackApplyListCount;
	}

	@Override
	public StaffTlApplyVO selectTlapplyAttach(StaffTlApplyVO vo) throws SQLException {
		StaffTlApplyVO selectTlapplyAttach = session.selectOne("StaffTlApply-Mapper.selectTlapplyAttach",vo);
		log.debug("다오TL : " + selectTlapplyAttach);
		return selectTlapplyAttach;
	}

}
