package kr.or.ddit.dao.stu.aca;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.common.CommCdVO;
import kr.or.ddit.dto.stu.AcaStatusVO;
import kr.or.ddit.dto.stu.StudentVO;
import kr.or.ddit.dto.stu.TlApplyVO;

public class TlApplyDAOImpl implements TlApplyDAO{
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<TlApplyVO> selectTlListById(String stuCd) throws SQLException {
		List<TlApplyVO> TlListByStuId = session.selectList("StuTlApply-Mapper.selectTlListById",stuCd);
		
		return TlListByStuId;
	}

	@Override
	public List<CommCdVO> selectTlClassReason()throws SQLException {
		return session.selectList("StuTlApply-Mapper.selectTlClassReason");
	}

	@Override
	public void insertTlApply(TlApplyVO tlApplyVO) throws SQLException{
		session.insert("StuTlApply-Mapper.insertTlApply",tlApplyVO);
	}

	@Override
	public int selectTlApplyNoNextVal() throws SQLException {
		return session.selectOne("StuTlApply-Mapper.selectTlApplyNoNextVal");
	}

	@Override
	public Integer backApplyDuplicateCheck(StudentVO student) throws SQLException {
		int tlApplySeq=0;
		if(session.selectOne("StuTlApply-Mapper.backApplyDuplicateCheck",student)!=null) {
			tlApplySeq=session.selectOne("StuTlApply-Mapper.backApplyDuplicateCheck",student);
		}
		return tlApplySeq;
	}
	@Override
	public Integer tlApplyDuplicateCheck(StudentVO student) throws SQLException {
		int tlApplySeq=0;
		if(session.selectOne("StuTlApply-Mapper.tlApplyDuplicateCheck",student)!=null) {
			tlApplySeq=session.selectOne("StuTlApply-Mapper.tlApplyDuplicateCheck",student);
		}
		return tlApplySeq;
	}
	
	@Override
	public int selectAcaChangeSeq() throws SQLException {
		return session.selectOne("StuTlApply-Mapper.selectAcaChangeSeq");
	}
	
	@Override
	public void updateTlApply(TlApplyVO tlApplyVO) throws SQLException {
		session.update("StuTlApply-Mapper.updateTlApply",tlApplyVO);
	}

	@Override
	public List<AcaStatusVO> selectBackListById(String stuCd) throws SQLException {
		return session.selectList("StuTlApply-Mapper.selectBackListById",stuCd);
	}

	@Override
	public void updateBackApply(AcaStatusVO backVO) throws SQLException {
		session.update("StuTlApply-Mapper.updateBackApply",backVO);
	}

	@Override
	public void insertBackApply(AcaStatusVO backVO) throws SQLException {
		session.insert("StuTlApply-Mapper.insertBackApply",backVO);
	}

	@Override
	public void deleteBackApply(int acaChangeSeq)throws SQLException {
		session.delete("StuTlApply-Mapper.deleteBackApply",acaChangeSeq);
	}

	@Override
	public TlApplyVO selectTlApply(int tlApplySeq)throws SQLException {
		return session.selectOne("StuTlApply-Mapper.selectTlApply",tlApplySeq);
	}

	@Override
	public void deleteTlApply(int tlApplySeq) throws SQLException {
		session.delete("StuTlApply-Mapper.deleteTlApply",tlApplySeq);
	}

	@Override
	public AcaStatusVO selectBackApply(int acaChangeSeq) throws SQLException {
		return session.selectOne("StuTlApply-Mapper.selectBackApply",acaChangeSeq);
	}
}
