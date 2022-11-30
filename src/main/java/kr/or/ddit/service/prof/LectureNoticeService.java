package kr.or.ddit.service.prof;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.LecNoticeVO;

public interface LectureNoticeService {
	
	//목록조회
	Map<String, Object> getLectureNoticeList(CriteriaLec cri) throws SQLException;
	
	//상세보기
	LecNoticeVO getLectureNotice(LecNoticeVO lecNotice) throws SQLException;
	LecNoticeVO getLectureNoticeForModify(LecNoticeVO lecNotice) throws SQLException;
	
	//등록
	void regist(LecNoticeVO lecNotice)throws SQLException;
	
	//수정
	void modify(LecNoticeVO lecNotice)throws SQLException;
	
	//삭제
	void delete(int lecNoticeNo)throws SQLException;

}
