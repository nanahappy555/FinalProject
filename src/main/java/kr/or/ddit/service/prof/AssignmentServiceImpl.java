package kr.or.ddit.service.prof;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.command.PageMakerLec;
import kr.or.ddit.controller.MakeFileName;
import kr.or.ddit.dao.common.AlarmDAO;
import kr.or.ddit.dao.common.AttachDAO;
import kr.or.ddit.dao.prof.AssignmentDAO;
import kr.or.ddit.dao.stu.lec.LecDAO;
import kr.or.ddit.dto.common.AlarmVO;
import kr.or.ddit.dto.common.AttachVO;
import kr.or.ddit.dto.prof.AssignmentVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AssignmentServiceImpl implements AssignmentService{

	@Autowired
	private AssignmentDAO assignmentDAO;
	
	@Autowired
	private AttachDAO attachDAO;
	
	@Autowired
	private LecDAO lecDAO;

	@Autowired
	private AlarmDAO alarmDAO;
	
	@Override
	public Map<String, Object> getAssignemtList(CriteriaLec cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<AssignmentVO> assignmentList = assignmentDAO.selectList(cri);
		int totalCount = assignmentDAO.selectTotalCountBylecCd(cri);
		
		PageMakerLec pageMaker = new PageMakerLec();
		pageMaker.setDisplayPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("assignmentList",assignmentList);
		dataMap.put("pageMaker",pageMaker);
		
		return dataMap;
	}

	@Override
	public AssignmentVO getDetail(AssignmentVO vo) throws SQLException {
		
		AssignmentVO detail = assignmentDAO.selectDetail(vo);
		
		addAttachList(detail);
		
		if(detail!=null&&detail.getAttachList()!=null) {
			for(AttachVO attach:detail.getAttachList()) {
				String originalFileName
					= MakeFileName.parseFileNameFromUUID(attach.getFilename(), "\\$\\$");
				attach.setFilename(originalFileName);
			}
		}
		return detail;
	}

	
	private void addAttachList(AssignmentVO vo) throws SQLException {

		if (vo == null)
			return;

		int anoCd = vo.getAnoCd();
		log.debug("anoCd : "+anoCd);
		List<AttachVO> attachList = attachDAO.selectAttachList(anoCd);

		vo.setAttachList(attachList);
	}
	
	
	@Override
	public void registAssignment(AssignmentVO vo) throws SQLException {
		int nextVal = assignmentDAO.selectAssBnoSeqNextVal();
		
		if (vo.getAttachList() != null) {
		int anoNextval = attachDAO.selectAnoNextval();
		int anoSeq = 1;
		
		List<AttachVO> attachList = vo.getAttachList();
		
		for (AttachVO eachVO : attachList) {
			eachVO.setAnoCd(anoNextval);
			eachVO.setAnoSeq(anoSeq);
			attachDAO.insertAttach(eachVO);
			anoSeq++;
		}
		vo.setAnoCd(anoNextval);
		
		
		}
		vo.setAssBno(nextVal);
		assignmentDAO.insert(vo);
		
		//알림 등록할 수강생 목록
		String lecCd = vo.getLecCd();
		List<String> stuCdList = lecDAO.selectStuCdListByLecCd(lecCd);
		
		for(String memId : stuCdList) {
			
			//DB 알림 등록
			int alarmSeq = alarmDAO.selectAlarmSeqNext();
			
			AlarmVO alarm = new AlarmVO();
			alarm.setAlarmSeq(alarmSeq); //알람seq
			alarm.setMemId(memId);	//회원아이디
			alarm.setSylCd(lecCd); //강의코드
			alarm.setBoardName(" - 과제게시판"); //현재 게시판
			alarmDAO.insertAlarmFromLecture(alarm);
		}
		
	}

	@Override
	public void modifyAssignment(AssignmentVO vo) throws SQLException {
		
	}

	@Override
	public void removeAssignment(int assBno) throws SQLException {
		AssignmentVO vo = assignmentDAO.selectDetailByAssBno(assBno);
		Integer anoCd = vo.getAnoCd();
		if (anoCd != null) {
			attachDAO.deleteAllAttach(anoCd);
		}
		
		
		assignmentDAO.delete(assBno);
		
	}

}
