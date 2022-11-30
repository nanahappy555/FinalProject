package kr.or.ddit.dao.common;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.common.PortletListVO;

public interface PortletListDAO {

	List<Integer> selectDefaultWidgetList(String memClassCd) throws SQLException;
	List<Integer> selectNotDefaultWidgetList(String memClassCd) throws SQLException;
	
	List<PortletListVO> selectAllWidgetListByMemClassCd(String memClassCd) throws SQLException;
}
