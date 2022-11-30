package kr.or.ddit.dao.prof;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.dto.stu.AttendVO;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class LecAttendDAOImpl implements LecAttendDAO {

	@Autowired
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<AttendVO> selectAttendListByLecCd(AttendVO attend) throws SQLException {
		List<AttendVO> attendList = session.selectList("Attend-Mapper.selectAttendListByLecCd", attend);
		return attendList;
	}

	//날짜만 쓸 것임
	@Override
	public AttendVO lastDateByLecCd(String lecCd) throws SQLException {
		AttendVO attend = session.selectOne("Attend-Mapper.lastDateByLecCd", lecCd);
		return attend;
	}


	@Override
	public int selectTotalCountAttend(AttendVO attend) throws SQLException {
		return session.selectOne("Attend-Mapper.selectTotalCountAttend", attend);
	}

	@Override
	public void insertAttend(AttendVO attend) throws SQLException {
		session.update("Attend-Mapper.insertAttend", attend);
	}

	@Override
	public void updateAttend(AttendVO attend) throws SQLException {
		session.update("Attend-Mapper.updateAttend", attend);
	}

	@Override
	public void deleteAttend(AttendVO attend) throws SQLException {
		session.update("Attend-Mapper.deleteAttend", attend);
	}

	@Override
	public int selectAttendSeqNext() throws SQLException {
		int count = session.selectOne("Attend-Mapper.selectAttendSeqNext");
		return count;
	}

	@Override
	public List<AttendVO> selectAttendListByStuCd(AttendVO attend) throws SQLException {
		return session.selectList("Attend-Mapper.selectAttendListByStuCd", attend);
	}

	}
