package kr.or.ddit.service.stu.aca;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.stu.SearchMajorCommand;
import kr.or.ddit.dao.stu.aca.ChangeMajorDAO;
import kr.or.ddit.dto.stu.ChangeMajorVO;
import kr.or.ddit.dto.stu.CollegeVO;
import kr.or.ddit.dto.stu.MajorVO;
import kr.or.ddit.dto.stu.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChangeMajorServiceImpl implements ChangeMajorService{
	
	ChangeMajorDAO changeMajorDAO;
	public void setChangeMajorDAO(ChangeMajorDAO changeMajorDAO) {
		this.changeMajorDAO=changeMajorDAO;
	}
	@Override
	public List<CollegeVO> selectCollegeList() throws SQLException{
		return changeMajorDAO.selectCollegeList();
	}

	@Override
	public List<MajorVO> selectMajorListByCollegeCd(String collegeCd) throws SQLException{
		return changeMajorDAO.selectMajorListByCollegeCd(collegeCd);
	}
	
	public List<ChangeMajorVO> selectSearchMajorList(SearchMajorCommand searchMajorCommand)throws SQLException{
		return changeMajorDAO.selectSearchMajorList(searchMajorCommand);
	}
	
	public void updateStuPhone(StudentVO student) throws SQLException{
		changeMajorDAO.updateStuPhone(student);
	}
	@Override
	public void changeMajorApply(ChangeMajorVO changeMajor) throws SQLException{
		
		Integer majorChaSeq = changeMajorDAO.selectDuplicateChangeMajor(changeMajor);
		if(majorChaSeq==null) {
			majorChaSeq = changeMajorDAO.selectMajorChaSeqNextValue();
			changeMajor.setMajorChaSeq(majorChaSeq);
			changeMajorDAO.insertMajorChange(changeMajor);
		}else {
			changeMajor.setMajorChaSeq(majorChaSeq);
			changeMajorDAO.updatetMajorChange(changeMajor);
			
		}
		log.info("majorChaSeq : "+majorChaSeq+"");
	}
	@Override
	public List<ChangeMajorVO> selectMajorChangeApplyList(String stuCd) throws SQLException {
		List<ChangeMajorVO> majorApplyList=changeMajorDAO.selectMajorChangeApplyList(stuCd);
		return majorApplyList;
	}
	@Override
	public void deleteChangeMajorApply(int majorChaSeq) throws SQLException {
		changeMajorDAO.deleteChangeMajorApply(majorChaSeq);
	}
	@Override
	public Integer selectDuplicateOkChangeMajor(ChangeMajorVO changeMajor) throws SQLException {
		return changeMajorDAO.selectDuplicateOkChangeMajor(changeMajor);
	}
	
}
