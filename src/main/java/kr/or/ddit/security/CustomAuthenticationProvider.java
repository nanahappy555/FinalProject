package kr.or.ddit.security;

import java.sql.SQLException;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.exception.InvalidPasswordException;
import kr.or.ddit.exception.NotFoundIdException;
import kr.or.ddit.service.common.MemberService;

public class CustomAuthenticationProvider implements AuthenticationProvider {
	private MemberService memberService;
	public void setMemberService(MemberService memberService) {
		this.memberService=memberService;
	}
	
	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		String login_id=(String) auth.getPrincipal();
		String login_pwd=(String) auth.getCredentials();
		try {
			memberService.login(login_id,login_pwd);
			
			MemberVO member = memberService.getMember(login_id);
			UserDetails authUser = new User(member);
			boolean invalidCheck = authUser.isAccountNonExpired()
					&& authUser.isAccountNonLocked()
					&& authUser.isCredentialsNonExpired()
					&& authUser.isEnabled();
			if(invalidCheck) {
				UsernamePasswordAuthenticationToken result = 
						new UsernamePasswordAuthenticationToken(authUser.getUsername(), authUser.getPassword(),
																authUser.getAuthorities());
				result.setDetails(authUser);
				return result;
			}
		} catch (NotFoundIdException e) {
			throw new UsernameNotFoundException("존재하지 않는 아이디입니다.");
		} catch (InvalidPasswordException e) {
			throw new BadCredentialsException("패스워드가 일치하지 않습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
			throw new BadCredentialsException("서버에러");
		}
		return null;
	}

	@Override
	public boolean supports(Class<?> auth) {
		return auth.equals(UsernamePasswordAuthenticationToken.class);
	}

}
