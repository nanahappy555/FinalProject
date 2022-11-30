package kr.or.ddit.service.stu.schol;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.common.AttachDAO;
import kr.or.ddit.dao.stu.schol.ManageDAO;
import kr.or.ddit.dto.stu.ScholApplyVO;
import kr.or.ddit.dto.stu.ScholManageVO;
import kr.or.ddit.dto.stu.StuScholApplyListVO;
import kr.or.ddit.dto.stu.StudentVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class ManageServiceImpl implements ManageService {
	
	@Autowired
	private ManageDAO manageDAO;
	
	@Autowired
	private AttachDAO attachDAO;

	@Override
	public List<ScholManageVO> selectManageList() throws SQLException {
		
		List<ScholManageVO> manageList = manageDAO.selectManageList();
		/* log.debug("------------------저기------------------"+ manageList); */
		return manageList;
	}
	
	@Override
	public List<StuScholApplyListVO> selectApplyInfo(String stuCd) throws SQLException {
		
		List<StuScholApplyListVO> applyInfo = manageDAO.selectApplyInfo(stuCd);
		/* log.debug("------------------저기------------------"+ applyInfo); */
		return applyInfo;
	}

	@Override
	public StudentVO selectManageRegistList(String stuCd) throws SQLException {
		StudentVO stuInfo = manageDAO.selectManageRegistList(stuCd);
		return stuInfo;
	}

	@Override
	public void insertInfo(ScholApplyVO scholApply) throws SQLException {
		
		log.debug("ScholApply서비스확인"+scholApply);
		String stuId = scholApply.getStuId();
		String semeCd = scholApply.getSemeCd();
		StudentVO student = new StudentVO();
		student.setStuCd(stuId);
		student.setSemeCd(semeCd);
		
		int scholAppSeq = manageDAO.selectScholAppSeqNextVal();
		scholApply.setScholAppSeq(scholAppSeq);
		manageDAO.insertInfo(scholApply);
	}

	@Override
	public void deleteInfo(ScholApplyVO scholApply) throws SQLException {
		log.debug("ScholApply서비스확인"+scholApply);
		manageDAO.deleteInfo(scholApply);
		
	}
	
	
	
	
}
