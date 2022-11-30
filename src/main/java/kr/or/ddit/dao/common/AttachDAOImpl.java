package kr.or.ddit.dao.common;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.common.AttachVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AttachDAOImpl implements AttachDAO {

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<AttachVO> selectAttachList(int anoCd) throws SQLException {
		
		List<AttachVO> attachList = session.selectList("Attach-Mapper.selectAttachList", anoCd);
		log.debug("다오어태치리스트 :" +attachList);
		log.debug("다오에이엔오 : " +anoCd);
		return attachList;
	}
	
	@Override
	public AttachVO selectAttach(AttachVO attach) throws SQLException {
		AttachVO atta = session.selectOne("Attach-Mapper.selectAttach",attach);
		return atta;
	}

	@Override
	public void insertAttach(AttachVO attach) throws SQLException {
		session.update("Attach-Mapper.insertAttach",attach);
	}

	@Override
	public void deleteAllAttach(int anoCd) throws SQLException {
		session.update("Attach-Mapper.deleteAllAttach",anoCd);

	}
	//하나만 지우는거임
	@Override
	public void deleteAttach(AttachVO attach) throws SQLException {
		session.update("Attach-Mapper.deleteAttach",attach);
	}

	@Override
	public int selectAnoNextval() throws SQLException {
		return session.selectOne("Attach-Mapper.selectAnoNextval");
	}

	@Override
	public Integer selectMaxAnoSeq(int anoCd) throws SQLException {
		Integer maxVal = session.selectOne("Attach-Mapper.selectMaxSeqByAnoCd",anoCd);
		if (maxVal == null) {
			maxVal = 0;
		}
		return maxVal;
	}

}
