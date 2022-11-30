package kr.or.ddit.service.common;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dao.common.MenuDAO;
import kr.or.ddit.dto.common.MenuVO;
import kr.or.ddit.dto.common.MyLectureVO;
import kr.or.ddit.dto.stu.LecVO;

public class MenuServiceImpl implements MenuService {
	
	private MenuDAO menuDAO;// = new MenuDAOImpl();
	public void setMenuDAO(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}
	
	@Override
	public List<MenuVO> getMainMenuList() throws SQLException {
		List<MenuVO> menuList = null;
		menuList = menuDAO.selectMainMenu();
		return menuList;
	}

	@Override
	public MenuVO getMenuByMcode(String mCode) throws SQLException {
		MenuVO menu = null;
		menu = menuDAO.selectMenuByMcode(mCode);
		return menu;
	}

	@Override
	public MenuVO getMenuByMname(String mName) throws SQLException {
		MenuVO menu = null;
		menu = menuDAO.selectMenuByMname(mName);
		return menu;
	}

	@Override
	public List<MenuVO> getSubMenuList(String mCode) throws SQLException {
		List<MenuVO> menuList = null;
		menuList = menuDAO.selectSubMenu(mCode);
		return menuList;
	}

	@Override
	public List<MyLectureVO> getLecListByProf(String memId) {
		return menuDAO.getLecListByProf(memId);
	}

	@Override
	public List<MyLectureVO> getLecListByStu(LecVO lec) {
		return menuDAO.getLecListByStu(lec);
	}

}
