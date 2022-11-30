package kr.or.ddit.dao.common;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.dto.common.PortletVO;
import kr.or.ddit.dto.stu.AttendVO;
@Repository
public class PortletDAOImpl implements PortletDAO {

	@Autowired
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<PortletVO> selectWidgetList(String memId) throws SQLException {
		List<PortletVO> poList = session.selectList("Portlet-Mapper.selectWidgetList", memId);
		return poList;
	}
	
	@Override
	public List<PortletVO> selectAllWidgetListByMemId(String memId) throws SQLException {
		List<PortletVO> poList = session.selectList("Portlet-Mapper.selectWidgetList", memId);
		return poList;
	}
	@Override
	public int selectTotalCountWidgetList(String memId) throws SQLException {
		int count = session.selectOne("Portlet-Mapper.selectTotalCountWidgetList", memId);
		return count;
	}
	@Override
	public PortletVO selectWidgetById(PortletVO portlet) throws SQLException {
		PortletVO portletVO = session.selectOne("Portlet-Mapper.selectWidgetList", portlet);
		return portletVO;
	}
	
	@Override
	public void insertWidgetByIdAvail(PortletVO portlet) throws SQLException {
		session.insert("Portlet-Mapper.insertWidgetByIdAvail", portlet);
	}
	
	@Override
	public void updateWidget(PortletVO portlet) throws SQLException {
		session.update("Portlet-Mapper.updateWidget", portlet);
	}
	@Override
	public void updateWidgetAvail(PortletVO portlet) throws SQLException {
		session.update("Portlet-Mapper.updateWidgetAvail", portlet);
	}
	@Override
	public void updateWidgetXY(PortletVO portlet) throws SQLException {
		session.update("Portlet-Mapper.updateWidgetXY", portlet);
	}

	@Override
	public List<AttendVO> selectAllAttendByStuCd(AttendVO attend) throws SQLException {
		return session.selectList("Attend-Mapper.selectAllAttendByStuCd",attend);
	}

}
