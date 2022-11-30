package kr.or.ddit.dao.stu;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.stu.AcaVO;
import kr.or.ddit.dto.stu.ClubVO;
import kr.or.ddit.dto.stu.StuColMajor;
import kr.or.ddit.dto.stu.StudentVO;



public interface InfoDAO {

	StudentVO selectInfo(String id)throws SQLException;
	
	void updateInfo(StudentVO student) throws SQLException;
	void updateAccount(StudentVO student) throws SQLException;
	public StuColMajor selectStuColMajorInfo(String stuCd) throws SQLException;

	List<AcaVO> selectAllAcaRecord(String stuCd) throws SQLException;
	List<ClubVO> selectClubList()throws SQLException;

	void updateMbti(StudentVO stu)throws SQLException;

	MemberVO checkInfo(MemberVO member) throws SQLException;;

	
	
	
}

