package kr.or.ddit.dao.common;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.common.MenuVO;
import kr.or.ddit.dto.common.MyLectureVO;
import kr.or.ddit.dto.stu.LecVO;

public class MenuDAOImpl implements kr.or.ddit.dao.common.MenuDAO {
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<MenuVO> selectMainMenu() throws SQLException {
		List<MenuVO> menuList = session.selectList("Menu-Mapper.selectMainMenu");
		return menuList;
	}


	@Override
	public List<MenuVO> selectSubMenu(String mCode) throws SQLException {
		List<MenuVO> menuList = session.selectList("Menu-Mapper.selectSubMenu",mCode);
		return menuList;
	}


	@Override
	public MenuVO selectMenuByMcode(String mCode) throws SQLException {
		MenuVO menu = session.selectOne("Menu-Mapper.selectMenuByMcode",mCode);
		return menu;
	}


	@Override
	public MenuVO selectMenuByMname(String mName) throws SQLException {
		MenuVO menu = session.selectOne("Menu-Mapper.selectMenuByMname",mName);
		return menu;
	}

	@Override
	public List<MyLectureVO> getLecListByProf(String memId) {
		return session.selectList("Menu-Mapper.getLecListByProf",memId);
	}

	@Override
	public List<MyLectureVO> getLecListByStu(LecVO lec) {
		return session.selectList("Menu-Mapper.getLecListByStu",lec);
	}

}
