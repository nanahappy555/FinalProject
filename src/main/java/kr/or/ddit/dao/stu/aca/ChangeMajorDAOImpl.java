package kr.or.ddit.dao.stu.aca;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.stu.SearchMajorCommand;
import kr.or.ddit.dto.stu.ChangeMajorVO;
import kr.or.ddit.dto.stu.CollegeVO;
import kr.or.ddit.dto.stu.MajorVO;
import kr.or.ddit.dto.stu.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChangeMajorDAOImpl implements ChangeMajorDAO{
	
	SqlSession session;
	public void setSqlSession(SqlSession session){
		this.session=session;
	}
	@Override
	public List<CollegeVO> selectCollegeList() throws SQLException{
		return session.selectList("ChangeMajor-Mapper.selectCollegeList");
	}

	@Override
	public List<MajorVO> selectMajorListByCollegeCd(String collegeCd) throws SQLException{
		return session.selectList("ChangeMajor-Mapper.selectMajorListByCollegeCd",collegeCd);
	}
	@Override
	public List<ChangeMajorVO> selectSearchMajorList(SearchMajorCommand searchMajorCommand) throws SQLException {
		return session.selectList("ChangeMajor-Mapper.selectSearchMajorList",searchMajorCommand);
	}
	@Override
	public void updateStuPhone(StudentVO student) throws SQLException {
		
		session.update("ChangeMajor-Mapper.updateStuPhone",student);
	}
	@Override
	public void insertMajorChange(ChangeMajorVO changeMajor) throws SQLException{
		session.insert("ChangeMajor-Mapper.insertMajorChange",changeMajor);
	}
	@Override
	public int selectMajorChaSeqNextValue() throws SQLException {
		return session.selectOne("ChangeMajor-Mapper.selectMajorChaSeqNextValue");
	}
	@Override
	public List<ChangeMajorVO> selectMajorChangeApplyList(String stuCd) throws SQLException {
		return session.selectList("ChangeMajor-Mapper.selectMajorChangeApplyList",stuCd);
	}
	@Override
	public void deleteChangeMajorApply(int majorChaSeq) {
		session.delete("ChangeMajor-Mapper.deleteChangeMajorApply",majorChaSeq);
	}
	@Override
	public Integer selectDuplicateChangeMajor(ChangeMajorVO changeMajor) throws SQLException {
		
		
		Integer majorChaSeq =  session.selectOne("ChangeMajor-Mapper.selectDuplicateChangeMajor",changeMajor);
		return majorChaSeq;
	}
	@Override
	public void updatetMajorChange(ChangeMajorVO changeMajor) throws SQLException {
		 session.update("ChangeMajor-Mapper.updatetMajorChange",changeMajor);
	}
	@Override
	public Integer selectDuplicateOkChangeMajor(ChangeMajorVO changeMajor) throws SQLException {
		log.debug("다오 changeMajor : "+changeMajor);
		Integer majSeq= session.selectOne("ChangeMajor-Mapper.selectDuplicateOkChangeMajor",changeMajor);
		return majSeq;
	}
	
	
	

}
