package kr.or.ddit.dao.common;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.common.MenuVO;
import kr.or.ddit.dto.common.MyLectureVO;
import kr.or.ddit.dto.stu.LecVO;

public interface MenuDAO {
	
	// 메인메뉴
	List<MenuVO> selectMainMenu() throws SQLException;

	// 서브메뉴
	List<MenuVO> selectSubMenu( String mCode) throws SQLException;

	// 메뉴정보
	MenuVO selectMenuByMcode( String mCode) throws SQLException;
	MenuVO selectMenuByMname( String mName) throws SQLException;

	List<MyLectureVO> getLecListByProf(String memId);

	List<MyLectureVO> getLecListByStu(LecVO lec);
	
}








