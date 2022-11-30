package kr.or.ddit.dao.stu.schol;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.stu.ScholApplyVO;
import kr.or.ddit.dto.stu.ScholManageVO;
import kr.or.ddit.dto.stu.StuScholApplyListVO;
import kr.or.ddit.dto.stu.StudentVO;

public interface ManageDAO {

	List<ScholManageVO> selectManageList() throws SQLException;
	
	StudentVO selectManageRegistList(String stuCd) throws SQLException;
	
	List<StuScholApplyListVO> selectApplyInfo(String stuCd) throws SQLException;
	
	void insertInfo(ScholApplyVO scholApply)throws SQLException;
	
	void deleteInfo(ScholApplyVO scholApply)throws SQLException;
	
	int selectScholAppSeqNextVal()throws SQLException;
}
