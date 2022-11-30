package kr.or.ddit.dto.staff;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StaffVO {
	
	private String staffId;
	private Date hireDate;
	private Date resigeDate;
	private String name;
	private String ename;
	private String phone;
	private String zipcode;
	private String add1;
	private String add2;
	private String emailAddr;
	private String birthday;
	private String anoCd;
}
