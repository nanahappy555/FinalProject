package kr.or.ddit.dao.stu.aca;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.common.CommCdVO;
import kr.or.ddit.dto.stu.AcaStatusVO;
import kr.or.ddit.dto.stu.StudentVO;
import kr.or.ddit.dto.stu.TlApplyVO;


public interface TlApplyDAO {

	List<TlApplyVO> selectTlListById(String id) throws SQLException;

	List<CommCdVO> selectTlClassReason()throws SQLException;

	void insertTlApply(TlApplyVO tlApplyVO)throws SQLException;
	
	int selectTlApplyNoNextVal() throws SQLException;
	
	Integer tlApplyDuplicateCheck(StudentVO student) throws SQLException;
	
	Integer backApplyDuplicateCheck(StudentVO student) throws SQLException;
	

	void updateTlApply(TlApplyVO tlApplyVO) throws SQLException;

	List<AcaStatusVO> selectBackListById(String stuCd) throws SQLException;

	void updateBackApply(AcaStatusVO backVO) throws SQLException;

	void insertBackApply(AcaStatusVO backVO) throws SQLException;

	int selectAcaChangeSeq() throws SQLException;

	void deleteBackApply(int acaChangeSeq) throws SQLException;
	TlApplyVO selectTlApply(int tlApplySeq) throws SQLException;

	void deleteTlApply(int tlApplySeq) throws SQLException;

	AcaStatusVO selectBackApply(int acaChangeSeq) throws SQLException;
}
