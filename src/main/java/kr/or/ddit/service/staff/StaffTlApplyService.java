package kr.or.ddit.service.staff;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.staff.StaffTlApplyVO;


public interface StaffTlApplyService {
	
	
	Map<String, Object> selectStaffTlApplyList(Criteria cri) throws SQLException;
	
	Map<String, Object> selectStaffBackApplyList(Criteria cri) throws SQLException;
	
	void updateTlStatus(Map<String, Object> dataMap) throws SQLException;
	void updateBackStatus(Map<String, Object> dataMap) throws SQLException;
	
	//휴학 첨부파일
	public StaffTlApplyVO selectTlapplyAttach(StaffTlApplyVO vo)throws SQLException;
	
	
	

}
