package kr.or.ddit.dao.common;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.dto.common.PortletListVO;

@Repository
public class PortletListDAOImpl implements PortletListDAO{

	@Autowired
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}


	@Override
	public List<Integer> selectDefaultWidgetList(String memClassCd) throws SQLException {
		return session.selectList("PortletList-Mapper.selectDefaultWidgetList", memClassCd);
	}
	@Override
	public List<Integer> selectNotDefaultWidgetList(String memClassCd) throws SQLException {
		return session.selectList("PortletList-Mapper.selectNotDefaultWidgetList", memClassCd);
	}


	@Override
	public List<PortletListVO> selectAllWidgetListByMemClassCd(String memClassCd) throws SQLException {
		return session.selectList("PortletList-Mapper.selectAllWidgetListByMemClassCd", memClassCd);
	}
	
	

}
