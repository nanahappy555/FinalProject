package kr.or.ddit.dao.prof;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.LecNoticeVO;



public interface LectureNoticeDAO {

	//글목록
	List<LecNoticeVO> selectLectureNoticeListByLecCd(CriteriaLec cri)throws SQLException;
	
	//글갯수
	int selectLectureNoticeTotalCountByLecCd(CriteriaLec cri) throws SQLException;
	
	//글번호로 글 가져오기
	LecNoticeVO selectLectureNoticeByLecNoticeNo(LecNoticeVO lecNotice) throws SQLException;
	
	//이미지파일
	LecNoticeVO selectLectureNoticeByImage(String imageFile) throws SQLException;
	
	//글등록
	void insertLectureNotice(LecNoticeVO lecNotice) throws SQLException;
	
	//글수정
	void updateLectureNotice(LecNoticeVO lecNotice) throws SQLException;
	
	//글삭제
	void deleteLectureNotice(int lecNoticeNo) throws SQLException;
	
	//조회수 증가
	void increaseViewCnt(int lecNoticeNo) throws SQLException;
	
	//글번호 증가
	int selectLectureNoticeSeqNext() throws SQLException;

	
}

