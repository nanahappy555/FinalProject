package kr.or.ddit.service.stu.counsel;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.CriteriaCounsel;
import kr.or.ddit.dto.stu.CounselProfListVO;
import kr.or.ddit.dto.stu.CsApplyVO;

public interface CounselApplyService {

	
	List<CounselProfListVO> selectCounselProfList(String stuId)throws SQLException;
	List<CsApplyVO> selectCounselApplyList(CsApplyVO csApply)throws SQLException;

	public void insertCounselApply(CsApplyVO csApply)throws SQLException;

	CounselProfListVO selectCounselProfInfo(String profId)throws SQLException;
	CounselProfListVO selectCounselProfPic(int anoCd)throws SQLException;
	Map<String, Object> selectCounselApplyListByProfId(CriteriaCounsel cri) throws SQLException;
	public void modifyStatus(Map<String, Object> params, String profId, String name)throws SQLException;
	public CsApplyVO getCounselDetail(int counselNo);
	public void modfiyClassroom(Map<String, Object> params);
	public void modifyCounselContent(Map<String, Object> params);

	
}
