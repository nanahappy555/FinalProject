package kr.or.ddit.service.stu.aca;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.stu.SearchMajorCommand;
import kr.or.ddit.dto.stu.ChangeMajorVO;
import kr.or.ddit.dto.stu.CollegeVO;
import kr.or.ddit.dto.stu.MajorVO;
import kr.or.ddit.dto.stu.StudentVO;

public interface ChangeMajorService {
	public List<CollegeVO> selectCollegeList() throws SQLException;
	public List<MajorVO> selectMajorListByCollegeCd(String collegeCd) throws SQLException;
	public List<ChangeMajorVO> selectSearchMajorList(SearchMajorCommand searchMajorCommand)throws SQLException;
	public void updateStuPhone(StudentVO student) throws SQLException;
	public void changeMajorApply(ChangeMajorVO changeMajor) throws SQLException;
	public List<ChangeMajorVO> selectMajorChangeApplyList(String stuCd)throws SQLException;
	public void deleteChangeMajorApply(int majorChaSeq)throws SQLException;
	public Integer selectDuplicateOkChangeMajor(ChangeMajorVO changeMajor) throws SQLException;
	
}
