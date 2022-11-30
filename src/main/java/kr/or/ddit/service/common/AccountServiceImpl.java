package kr.or.ddit.service.common;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.common.AccountDAO;
import kr.or.ddit.dto.common.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j

public class AccountServiceImpl implements AccountService {
	
	@Autowired 
	private AccountDAO accountDAO;


	@Override
	public int selectResetPwd(MemberVO member) throws SQLException {
		
		return accountDAO.selectResetPwd(member);
		
		
	}

	@Override
	public void updatePwd(MemberVO member) throws SQLException {
		log.debug("서비스확인"+member);
		accountDAO.updatePwd(member);
		
	}

}
