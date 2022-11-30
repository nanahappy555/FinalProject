package kr.or.ddit.dao.stu.counsel;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.CriteriaCounsel;
import kr.or.ddit.dto.stu.CounselProfListVO;
import kr.or.ddit.dto.stu.CsApplyVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
public class CounselApplyDAOImpl implements CounselApplyDAO{
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertCounselApply(CsApplyVO csApply) throws SQLException {
		session.insert("StuCounsel-Mapper.insertCounselApply",csApply);
		
	}
	@Override
	public List<CounselProfListVO> selectCounselProfList(String stuId) throws SQLException {
		
		List<CounselProfListVO> counselProfList = session.selectList("StuCounsel-Mapper.selectCounselProfList",stuId);
		return counselProfList;
	}
	@Override
	public CounselProfListVO selectCounselProfInfo(String profId) throws SQLException {
		CounselProfListVO profInfo = session.selectOne("StuCounsel-Mapper.selectCounselProfInfo",profId);
		return profInfo;
	}
	

	
	@Override
	public int selectCouncelNoNextVal() {
		return session.selectOne("StuCounsel-Mapper.selectCouncelNoNextVal");
	}

	@Override
	public List<CsApplyVO> selectCounselApplyList(CsApplyVO csApply) throws SQLException {
		List<CsApplyVO> counselProfList = session.selectList("StuCounsel-Mapper.selectCounselApplyList",csApply);
		return counselProfList;
	}

	
	@Override
	public List<CsApplyVO> selectCounselApplyListByProfId(CriteriaCounsel cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		log.debug("정렬타입" + cri.getOrderType());
		List<CsApplyVO> counselProfList = session.selectList("StuCounsel-Mapper.selectCounselApplyListByProfId",cri,rowBounds);
		
		log.debug("상담리스트" + counselProfList);
		
		return counselProfList;
	}

	@Override
	public void updateStatus(CsApplyVO vo) {
		session.update("StuCounsel-Mapper.updateStatus",vo);
		
	}

	@Override
	public int selectTotalCounselApplyListByProfId(CriteriaCounsel cri) {
		int totalCount = session.selectOne("StuCounsel-Mapper.selectToTalCounselApplyListByProfId",cri);
		log.debug("상담리스트숫자" + totalCount);
		return totalCount;
	}

	@Override
	public CsApplyVO selectCounselApplyDetail(int counselNo) {
		CsApplyVO detail = session.selectOne("StuCounsel-Mapper.selectCounselApplyDetail",counselNo);
		return detail;
	}

	@Override
	public void updateStatusClassroom(CsApplyVO csApplyVO) {
		session.update("StuCounsel-Mapper.updateClassroom",csApplyVO);
	}

	@Override
	public void updateCounselContent(CsApplyVO vo) {
		session.update("StuCounsel-Mapper.updateCounselContent",vo);
		
	}

	@Override
	public CounselProfListVO selectCounselProfPic(int anoCd) throws SQLException {
		return session.selectOne("StuCounsel-Mapper.selectCounselProfPic",anoCd);
	}



}
