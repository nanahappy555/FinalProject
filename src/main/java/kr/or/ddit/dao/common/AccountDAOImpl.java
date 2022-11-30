package kr.or.ddit.dao.common;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.dto.common.MemberVO;
import lombok.extern.slf4j.Slf4j;


@Repository
@Slf4j
public class AccountDAOImpl implements AccountDAO {
	
	@Autowired
	private SqlSession session;


	@Override
	public int selectResetPwd(MemberVO member) throws SQLException {
		
		return session.selectOne( "Account-Mapper.selectResetPwd", member);
		
	}

	@Override
	public void updatePwd(MemberVO member) throws SQLException {
		log.debug("다오확인"+member);
		session.update("Account-Mapper.updatePwd", member);
		
	}

	
}
