package kr.or.ddit.dao.common;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.common.PortletVO;
import kr.or.ddit.dto.stu.AttendVO;

public interface PortletDAO {
	
	List<PortletVO> selectWidgetList(String memId) throws SQLException;
	
	List<PortletVO> selectAllWidgetListByMemId(String memId) throws SQLException;
	
	int selectTotalCountWidgetList(String memId) throws SQLException;
	
	PortletVO selectWidgetById(PortletVO portlet) throws SQLException;
	
	void insertWidgetByIdAvail(PortletVO portlet) throws SQLException;
	
	
	void updateWidget(PortletVO portlet) throws SQLException;
	
	void updateWidgetAvail(PortletVO portlet) throws SQLException;
	
	void updateWidgetXY(PortletVO portlet) throws SQLException;
	
	
	List<AttendVO> selectAllAttendByStuCd(AttendVO attend) throws SQLException;
	
	
}
