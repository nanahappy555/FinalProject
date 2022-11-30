package kr.or.ddit.dao.stu.counsel;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.CriteriaCounsel;
import kr.or.ddit.dto.stu.CounselProfListVO;
import kr.or.ddit.dto.stu.CsApplyVO;




public interface CounselApplyDAO {
 
	
	List<CounselProfListVO> selectCounselProfList(String stuId)throws SQLException;
	List<CsApplyVO> selectCounselApplyList(CsApplyVO csApply)throws SQLException;

	
	CounselProfListVO selectCounselProfInfo(String profId)throws SQLException;
	CounselProfListVO selectCounselProfPic(int anoCd)throws SQLException;
	public void insertCounselApply(CsApplyVO csApply)throws SQLException;
	
	public int selectCouncelNoNextVal();
	List<CsApplyVO> selectCounselApplyListByProfId(CriteriaCounsel cri) throws SQLException;
	public int selectTotalCounselApplyListByProfId(CriteriaCounsel cri) throws SQLException;
	public void updateStatus(CsApplyVO vo);
	public CsApplyVO selectCounselApplyDetail(int counselNo);
	public void updateStatusClassroom(CsApplyVO csApplyVO);
	public void updateCounselContent(CsApplyVO vo);
	
	
}

