package kr.or.ddit.dao.staff;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.staff.StaffTlApplyVO;

public interface StaffTlApplyDAO {

	List<StaffTlApplyVO> selectStaffTlApplyList(Criteria cri) throws SQLException;
	
	public int selectStaffTlApplyListCount(Criteria cri)throws SQLException;
	
	List<StaffTlApplyVO> selectStaffBackApplyList(Criteria cri) throws SQLException;
	
	public int selectStaffBackApplyListCount(Criteria cri)throws SQLException;
	
	void updateTlStatus(StaffTlApplyVO staffTlApplyVO);
	
	void updateBackStatus(StaffTlApplyVO staffTlApplyVO);
	
	//휴학 첨부파일
	public StaffTlApplyVO selectTlapplyAttach(StaffTlApplyVO vo)throws SQLException;
}
