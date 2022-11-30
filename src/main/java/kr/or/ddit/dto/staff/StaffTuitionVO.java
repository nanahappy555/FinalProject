package kr.or.ddit.dto.staff;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StaffTuitionVO {

	private String stuCd;
	private String grade;
	private String name;
	private String colName;
	private String majorName;
	private int amount;
	private String phone;
	private String email;
	private Date paymentDate;
	private String payStatusCd;
	
}
