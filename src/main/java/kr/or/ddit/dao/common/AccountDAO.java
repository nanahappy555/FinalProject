package kr.or.ddit.dao.common;

import java.sql.SQLException;

import kr.or.ddit.dto.common.MemberVO;

public interface AccountDAO {

	int selectResetPwd(MemberVO member) throws SQLException;
	void updatePwd(MemberVO member) throws SQLException;
}
