package kr.or.ddit.service.prof;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.common.AttachDAO;
import kr.or.ddit.dao.prof.AssignmentEvalDAO;
import kr.or.ddit.dto.common.AttachVO;
import kr.or.ddit.dto.stu.MyLecAssignmentVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AssignmentEvalServiceImpl implements AssignmentEvalService {

	@Autowired
	private AssignmentEvalDAO assignmentEvalDAO;
	
	@Autowired
	private AttachDAO attachDAO;
	
	@Override
	public List<MyLecAssignmentVO> getLecStuListByLecCdAssBno(MyLecAssignmentVO vo) throws SQLException {
		List<MyLecAssignmentVO> allStuList = assignmentEvalDAO.selectAllStuListByLecCdAssBno(vo);
		return allStuList;
	}

	@Override
	public MyLecAssignmentVO getStuAssDetail(MyLecAssignmentVO vo) throws SQLException {
		MyLecAssignmentVO stuAssDetail = assignmentEvalDAO.selectStuAssDetail(vo);

		List<AttachVO> attachList = attachDAO.selectAttachList(stuAssDetail.getAnoCd());
		
		stuAssDetail.setAttachList(attachList);
		log.debug("과제디테일" + stuAssDetail);
		return stuAssDetail;
	}

	@Override
	public void modifyAssignment(MyLecAssignmentVO vo) throws SQLException {
		assignmentEvalDAO.updateAssignment(vo);
	}
	

}
