package kr.or.ddit.service.stu.counsel;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.CriteriaCounsel;
import kr.or.ddit.command.PageMakerCounsel;
import kr.or.ddit.dao.common.AlarmDAO;
import kr.or.ddit.dao.stu.StudentDAO;
import kr.or.ddit.dao.stu.counsel.CounselApplyDAO;
import kr.or.ddit.dto.common.AlarmVO;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.stu.CounselProfListVO;
import kr.or.ddit.dto.stu.CsApplyVO;
import kr.or.ddit.dto.stu.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CounselApplyServiceImpl implements CounselApplyService {

	private CounselApplyDAO counselApplyDAO;
	
	private AlarmDAO alarmDAO;
	
	private StudentDAO studentDAO;
	

	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}

	public void setCounselApplyDAO(CounselApplyDAO counselApplyDAO) {
		this.counselApplyDAO = counselApplyDAO;

	}
	
	public void setAlarmDAO(AlarmDAO alarmDAO) {
		this.alarmDAO = alarmDAO;
	}

	@Override
	public List<CounselProfListVO> selectCounselProfList(String stuId) throws SQLException {
		List<CounselProfListVO> counselProfList = counselApplyDAO.selectCounselProfList(stuId);
		return counselProfList;
	}
	

	@Override
	public CounselProfListVO selectCounselProfInfo(String stuId) throws SQLException {
		CounselProfListVO counselProfInfo = counselApplyDAO.selectCounselProfInfo(stuId);
		return counselProfInfo;
	}

	@Override
	public CounselProfListVO selectCounselProfPic(int anoCd) throws SQLException {
		CounselProfListVO counselProfPic = counselApplyDAO.selectCounselProfPic(anoCd);
		return counselProfPic;
	}

	@Override
	public void insertCounselApply(CsApplyVO csApply) throws SQLException {
		int counselNo = counselApplyDAO.selectCouncelNoNextVal();
		csApply.setCounselNo(counselNo);
		
		counselApplyDAO.insertCounselApply(csApply);
		

		//DB 알림 등록
		int alarmSeq = alarmDAO.selectAlarmSeqNext();
		String stuId = csApply.getStuId();
		StudentVO student = studentDAO.selectStudentByStuCd(stuId);
		String stuName = student.getName();
		
		AlarmVO alarm = new AlarmVO();
		alarm.setAlarmSeq(alarmSeq); //알람seq
		alarm.setMemId(csApply.getProfId());	//상담신청한 사람 아이디
		alarm.setName(stuName); //상담신청한 사람 이름11
		alarmDAO.insertAlarmFromNewCS(alarm);
	}

	@Override
	public List<CsApplyVO> selectCounselApplyList(CsApplyVO csApply) throws SQLException {
		List<CsApplyVO> counselProfList = counselApplyDAO.selectCounselApplyList(csApply);
		return counselProfList;
	}
	
	
	@Override
	public Map<String, Object> selectCounselApplyListByProfId(CriteriaCounsel cri) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		
		List<CsApplyVO> counselProfList = counselApplyDAO.selectCounselApplyListByProfId(cri);
		int totalCount = counselApplyDAO.selectTotalCounselApplyListByProfId(cri);
		
		PageMakerCounsel pageMaker = new PageMakerCounsel();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("counselProfList", counselProfList);
		dataMap.put("pageMaker", pageMaker);
		
		
		return dataMap;
	}

	@Override
	public void modifyStatus(Map<String, Object> params, String profCd, String name) throws SQLException {
		
		String status = (String) params.get("status");
		
		ArrayList<String> chkList  = (ArrayList<String>) params.get("chkList");
		
		log.debug("리스트" + chkList);
		for (String no : chkList) {
			log.debug("숫자" + no);
			int counselNo=Integer.parseInt(no);
			CsApplyVO vo = new CsApplyVO();
			vo.setCounselNo(counselNo);
			vo.setAppStatusCd(status);
			counselApplyDAO.updateStatus(vo);

			//알람
			//DB 알림 등록
			int alarmSeq = alarmDAO.selectAlarmSeqNext();

			AlarmVO alarm = new AlarmVO();
			alarm.setAlarmSeq(alarmSeq); //알람seq
			alarm.setMemId(profCd);	//승인하는 교수 아이디 profCd
			alarm.setName(name); //승인하는 교수 이름
			alarmDAO.insertAlarmFromApproved(alarm);
		}
		
		
	}

	@Override
	public CsApplyVO getCounselDetail(int counselNo) {
		CsApplyVO vo = counselApplyDAO.selectCounselApplyDetail(counselNo);
		
		return vo;
	}

	@Override
	public void modfiyClassroom(Map<String, Object> params) {
		
		
		String counselNoStr = (String) params.get("counselNo");
		int counselNo = Integer.parseInt(counselNoStr);
		String csLocation = (String) params.get("csLocation");
		String appStatusCd = (String) params.get("status");
		String rejReason = (String) params.get("rejReason");
		CsApplyVO csApplyVO = new CsApplyVO();
		csApplyVO.setCounselNo(counselNo);
		csApplyVO.setCsLocation(csLocation);
		csApplyVO.setAppStatusCd(appStatusCd);
		csApplyVO.setRejReason(rejReason);
		
		counselApplyDAO.updateStatusClassroom(csApplyVO);
	}

	@Override
	public void modifyCounselContent(Map<String, Object> params) {
		
		String counselNoStr = (String) params.get("counselNo");
		int counselNo = Integer.parseInt(counselNoStr);
		String counselContent = (String) params.get("counselContent");
		CsApplyVO vo = new CsApplyVO();
		vo.setCounselNo(counselNo);
		vo.setCounselContent(counselContent);
		counselApplyDAO.updateCounselContent(vo);
		
	}





	
}
