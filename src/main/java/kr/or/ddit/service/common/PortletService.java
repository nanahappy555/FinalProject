package kr.or.ddit.service.common;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.common.PortletListVO;
import kr.or.ddit.dto.common.PortletVO;
import kr.or.ddit.dto.prof.LecOpenVO;
import kr.or.ddit.dto.stu.AttendVO;

public interface PortletService {

	List<PortletVO> getWidgetList(String memId) throws SQLException;
	
	List<PortletListVO> getAllWidgetList(String memClassCd) throws SQLException;
	
	int getTotalCountWidgetList(String memId) throws SQLException;
	
	PortletVO getWidgetById(PortletVO portlet) throws SQLException;
	
	void registWidgetList(String memId,String memClassCd) throws SQLException;
	
	void saveWidgetNewUser(String memId,String memClassCd, List<PortletVO> poList) throws SQLException;
	
	void saveWidgetExistingUser(String memId, String memClassCd, List<PortletVO> poList) throws SQLException;
	
	
	List<LecOpenVO> getLecAssSubmitStuList(String memId) throws SQLException;
	
	List<AttendVO> getAllAttendByStuCd(AttendVO attend) throws SQLException;
}
