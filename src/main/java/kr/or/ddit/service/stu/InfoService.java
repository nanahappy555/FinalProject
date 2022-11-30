package kr.or.ddit.service.stu;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.stu.AcaVO;
import kr.or.ddit.dto.stu.ClubVO;
import kr.or.ddit.dto.stu.StuColMajor;
import kr.or.ddit.dto.stu.StudentVO;

public interface InfoService {
	
	StudentVO getInfo(String id) throws SQLException;
	void modifyInfo(StudentVO student) throws SQLException;
	void modifyAccount(StudentVO student) throws SQLException;
	public StuColMajor getStuColMajorInfo(String stuCd) throws SQLException;
	public List<AcaVO> selectAllAcaRecord(String stuCd) throws SQLException;
	public List<ClubVO> selectClubList()throws SQLException;
	void updateMbti(StudentVO stu)throws SQLException;
	Boolean checkInfo(MemberVO member)throws SQLException;
}
