package kr.or.ddit.service.prof;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.or.ddit.dto.prof.ClassAttitudeVO;
import kr.or.ddit.dto.prof.SpecialNoteVO;
import kr.or.ddit.dto.stu.StudentVO;

public interface ProfCounselService {
	public List<StudentVO> getStuListByMajorCd(HttpSession session)throws SQLException;
	
	public List<ClassAttitudeVO> selectClassAttitudeList(String profId) throws SQLException;

	public List<SpecialNoteVO> selectSpecialNoticeList(String stuCd) throws SQLException;

	public SpecialNoteVO selectSpecialNotice(int specialSeq)throws SQLException;

	public void registSpecialNotice(SpecialNoteVO special)throws SQLException;
}
