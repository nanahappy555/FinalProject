package kr.or.ddit.service.prof;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.common.AttachDAO;
import kr.or.ddit.dao.prof.ProfCounselDAO;
import kr.or.ddit.dao.prof.ProfDAO;
import kr.or.ddit.dto.common.AttachVO;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.prof.ClassAttitudeVO;
import kr.or.ddit.dto.prof.ProfVO;
import kr.or.ddit.dto.prof.SpecialNoteVO;
import kr.or.ddit.dto.stu.StudentVO;
import kr.or.ddit.service.stu.StudentService;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProfCounselServiceImpl implements ProfCounselService {

	@Autowired
	private StudentService studentService;
	
	@Autowired
	private ProfCounselDAO profCounselDAO;
	
	@Autowired
	private AttachDAO attachDAO;
	
	@Autowired
	private ProfDAO profDAO;
	
	@Override
	public List<StudentVO> getStuListByMajorCd(HttpSession session) throws SQLException {
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String profId = member.getMemId();
		ProfVO profVO = profDAO.selectProfByProfId(profId);
		String majorCd = profVO.getMajorCd();
		
		List<StudentVO> stuList = profCounselDAO.selectStuListByMajorCd(majorCd);
		
		for (StudentVO eachVO : stuList) {
			int anoCd = eachVO.getAnoCd();
			List<AttachVO> attachList = attachDAO.selectAttachList(anoCd);
			eachVO.setAttachList(attachList);
		}
		
		return stuList;
	}

	@Override
	public List<ClassAttitudeVO> selectClassAttitudeList(String profId) throws SQLException {
		List<String> stuList = profCounselDAO.selectStuListByProfId(profId);
		
		List<ClassAttitudeVO> classAttitudeList = new ArrayList<ClassAttitudeVO>();
		for(String stuCd : stuList) {
			ClassAttitudeVO classAttitude= profCounselDAO.selectClassAttitude(stuCd);
			log.debug("classAttitude : "+classAttitude);
			StudentVO student = studentService.getStudentByStuCd(stuCd);
			classAttitude.setStudent(student);
			classAttitudeList.add(classAttitude);
		}
		return classAttitudeList;
	}

	@Override
	public List<SpecialNoteVO> selectSpecialNoticeList(String stuCd) throws SQLException {
		return profCounselDAO.selectSpecialNoticeList(stuCd);
	}

	@Override
	public SpecialNoteVO selectSpecialNotice(int specialSeq) throws SQLException {
		return profCounselDAO.selectSpecialNotice(specialSeq);
	}

	@Override
	public void registSpecialNotice(SpecialNoteVO special) throws SQLException {
		int specialSeq = special.getSpecialSeq();
		if(specialSeq>0) {
			profCounselDAO.updateSpecialNotice(special);
		}else {
			specialSeq = profCounselDAO.selectSpecialSeq();
			special.setSpecialSeq(specialSeq);
			profCounselDAO.insertSpecialNotice(special);
		}
		
	}

}
