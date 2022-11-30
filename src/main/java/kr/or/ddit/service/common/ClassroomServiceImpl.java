package kr.or.ddit.service.common;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.common.ClassroomDAO;

@Service
public class ClassroomServiceImpl implements ClassroomService {

	@Autowired
	private ClassroomDAO classroomDAO;
	
	@Override
	public List<String> getClassroomList() throws SQLException {
		
		List<String> classroomList = classroomDAO.selectClassroomList();
		return classroomList;
	}

}
