package kr.or.ddit.service.prof;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.prof.LecAttendDAO;
import kr.or.ddit.dao.stu.lec.LecDAO;
import kr.or.ddit.dto.stu.AttendVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class LecAttendServiceImpl implements LecAttendService {

	@Autowired
	private LecAttendDAO lecAttendDAO;
	
	@Autowired
	private LecDAO lecDAO;
	
	@Override
	public List<AttendVO> getAttendList(AttendVO attend) throws SQLException {
		log.debug("서비스임플 어텐드확인"+attend);
		
		if(attend.getAttendDate() == null) {
			String lecCd = attend.getLecCd();
			
			//최근데이터의 날짜 구하기
			AttendVO vo = lecAttendDAO.lastDateByLecCd(lecCd);
			Date attendDate = vo.getAttendDate();
			log.debug("서비스임플 날짜확인"+attendDate);
			
			//최근데이터의 날짜 세팅
			attend.setAttendDate(attendDate);
			log.debug("서비스임플 날짜 들어갔는지 확인"+attend.getAttendDate());
		}
		
		List<AttendVO> attendList = lecAttendDAO.selectAttendListByLecCd(attend);
		log.debug("서비스임플 리스트 확인"+attendList);
		return attendList;
	}
	

	@Override
	public List<AttendVO> getStuAttendList(AttendVO attend) throws SQLException {
		List<AttendVO> attendList = lecAttendDAO.selectAttendListByStuCd(attend);
		return attendList;
	}

	@Override
	public void registAttend(AttendVO attend) throws SQLException {
		String lecCd = attend.getLecCd();
		//게시글 등록할 수강생 목록
		List<String> stuCdList = lecDAO.selectStuCdListByLecCd(lecCd);
		for(String stuCd : stuCdList) {
			//출석 등록
			int attendSeq = lecAttendDAO.selectAttendSeqNext();
			attend.setStuCd(stuCd);
			attend.setAttendSeq(attendSeq);
			log.debug("서비스"+attend);
			lecAttendDAO.insertAttend(attend);
		}
	}

	@Override
	public void modifyAttendList(AttendVO attend) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyAttend(AttendVO attend) throws SQLException {
		lecAttendDAO.updateAttend(attend);
	}

	@Override
	public void removeAttend(AttendVO attend) throws SQLException {
		// TODO Auto-generated method stub
		
	}


}
