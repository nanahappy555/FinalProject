package kr.or.ddit.service.common;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.exception.InvalidPasswordException;
import kr.or.ddit.exception.NotFoundIdException;

public interface MemberService {
	
	//login
	void login(String id, String pwd)throws NotFoundIdException,InvalidPasswordException,
											SQLException;
	
	//회원목록조회
	Map<String,Object> getMemberList(Criteria cri)throws SQLException;
	
	//회원상세조회
	MemberVO getMember(String id)throws SQLException;	

	//회원등록
	public void regist(MemberVO member) throws Exception;
	
	//회원수정
	public void modify(MemberVO member)throws Exception;
	
	//회원탈퇴
	public void remove(String id)throws Exception; 
	
}
