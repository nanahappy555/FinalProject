package kr.or.ddit.dao.prof;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.prof.ClassAttitudeVO;
import kr.or.ddit.dto.prof.SpecialNoteVO;
import kr.or.ddit.dto.stu.StudentVO;

public interface ProfCounselDAO {
	public List<StudentVO> selectStuListByMajorCd(String majorCd)throws SQLException;
	
	public ClassAttitudeVO selectClassAttitude(String stuCd)throws SQLException;
	
	public List<String> selectStuListByProfId(String profCd)throws SQLException;

	public List<SpecialNoteVO> selectSpecialNoticeList(String stuCd)throws SQLException;

	public SpecialNoteVO selectSpecialNotice(int specialSeq)throws SQLException;

	public void insertSpecialNotice(SpecialNoteVO special)throws SQLException;

	public void updateSpecialNotice(SpecialNoteVO special)throws SQLException;

	public int selectSpecialSeq()throws SQLException;
}
