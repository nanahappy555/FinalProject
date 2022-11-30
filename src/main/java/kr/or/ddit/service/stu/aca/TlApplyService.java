package kr.or.ddit.service.stu.aca;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.common.CommCdVO;
import kr.or.ddit.dto.stu.AcaStatusVO;
import kr.or.ddit.dto.stu.TlApplyVO;

public interface TlApplyService {
	
	List<TlApplyVO> getTlListByStuId(String stuCd) throws SQLException;
	List<CommCdVO> getTlClassReason() throws SQLException;
	List<AcaStatusVO> getBackListByStuId(String stuCd) throws SQLException;
	void insertTlApply(TlApplyVO tlApplyVO) throws SQLException;
	void applyBack(AcaStatusVO backVO) throws SQLException;
	void deleteBackApply(int acaChangeSeq) throws SQLException;
	void deleteTlApply(int tlApplySeq)  throws SQLException;
	
}
