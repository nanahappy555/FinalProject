package kr.or.ddit.dao.staff;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.staff.ScholApplyListVO;
import kr.or.ddit.dto.stu.ScholApplyVO;

public interface ScholApplyDAO {

	List<ScholApplyListVO> selectList(Criteria cri)throws SQLException;
	
	public void updateScholApply(ScholApplyVO scholVO)throws SQLException;
	
	public int selectSearchTotalCount(Criteria cri)throws SQLException;
}


