package kr.or.ddit.dto.staff;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class tbl_reserveVO {

	
	private String stuCd;
	private String grade;
	private String name;
	private String colName;
	private String majorName;
	private String birthday;
	private String phone;
	private String email;
	private String acaStateCd;
	public void setCret_ip(String remoteAddr) {
		// TODO Auto-generated method stub
		
	}
	public void setResv_gubun(String string) {
		// TODO Auto-generated method stub
		
	}
}
