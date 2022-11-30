package kr.or.ddit.dao.prof;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.stu.AttendVO;

public interface LecAttendDAO {

	List<AttendVO> selectAttendListByLecCd(AttendVO attend) throws SQLException;
	
	AttendVO lastDateByLecCd(String lecCd) throws SQLException;
	
	int selectTotalCountAttend(AttendVO attend) throws SQLException;
	
	void insertAttend(AttendVO attend) throws SQLException;
	
	void updateAttend(AttendVO attend) throws SQLException;

	void deleteAttend(AttendVO attend) throws SQLException;
	
	int selectAttendSeqNext() throws SQLException;
	
	List<AttendVO> selectAttendListByStuCd(AttendVO attend) throws SQLException;
}
