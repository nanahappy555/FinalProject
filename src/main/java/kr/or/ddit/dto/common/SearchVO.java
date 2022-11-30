package kr.or.ddit.dto.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchVO {

	private String memId;
	private String memPwd;
	private String name;
	private String memStatusCd;
	private int loginFailed;
	private String memClassCd;
	private String phone;
	private String birthday;
	
	
	
}