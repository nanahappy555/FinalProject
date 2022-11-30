package kr.or.ddit.service.common;

import java.sql.SQLException;

import kr.or.ddit.dto.common.MemberVO;

public interface AccountService {

	int selectResetPwd(MemberVO member)throws SQLException;
	
	void updatePwd(MemberVO member) throws SQLException;
}
