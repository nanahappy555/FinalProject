package kr.or.ddit.dao.common;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.common.AttachVO;

public interface AttachDAO {

	//글 하나에 첨부된 모든 첨부파일 조회
	List<AttachVO> selectAttachList(int anoCd) throws SQLException;
	
	//글 하나에 첨부된 한 개 첨부파일 조회
	AttachVO selectAttach(AttachVO attach) throws SQLException;
	
	//파일첨부
	void insertAttach(AttachVO attach)throws SQLException;
	
	//글 하나에 첨부된 모든 첨부파일 지우기
	void deleteAllAttach(int anoCd)throws SQLException;

	//글 하나에 첨부된 한 개 첨부파일 지우기
	void deleteAttach(AttachVO attach)throws SQLException;
	
	int selectAnoNextval()throws SQLException;
	
	//수정시 다음 최대값
	Integer selectMaxAnoSeq(int anoCd)throws SQLException;
	
}
