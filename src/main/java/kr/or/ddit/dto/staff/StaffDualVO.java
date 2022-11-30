package kr.or.ddit.dto.staff;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StaffDualVO {
	
	private String majClassName;
	private String name;
	private String stuCd;
	private String presentMajName;
	private String hopeColName;
	private String hopeMajorName;
	private String presentCollegeName;
	private String grade;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date applyDate;
	private String phone;
	private String applyStatusCd;
	private int majorChaSeq;
	private String majClassCd;
	
	
	

}
