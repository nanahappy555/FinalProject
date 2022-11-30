package kr.or.ddit.service.common;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.common.MenuVO;
import kr.or.ddit.dto.common.MyLectureVO;
import kr.or.ddit.dto.stu.LecVO;

public interface MenuService {


	List<MenuVO> getMainMenuList()throws SQLException;
	
	List<MenuVO> getSubMenuList(String mCode)throws SQLException;
	
	MenuVO getMenuByMcode(String mCode)throws SQLException;
	
	MenuVO getMenuByMname(String mName)throws SQLException;

	List<MyLectureVO> getLecListByProf(String memId);

	List<MyLectureVO> getLecListByStu(LecVO lec);
}
