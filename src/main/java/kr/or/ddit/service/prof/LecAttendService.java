package kr.or.ddit.service.prof;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.stu.AttendVO;

public interface LecAttendService {

	List<AttendVO> getAttendList(AttendVO attend) throws SQLException;
	
	List<AttendVO> getStuAttendList(AttendVO attend) throws SQLException;
	
	void registAttend(AttendVO attend) throws SQLException;
	
	void modifyAttendList(AttendVO attend) throws SQLException;
	
	void modifyAttend(AttendVO attend) throws SQLException;

	void removeAttend(AttendVO attend) throws SQLException;
}
