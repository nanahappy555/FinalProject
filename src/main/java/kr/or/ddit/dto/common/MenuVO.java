package kr.or.ddit.dto.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MenuVO {
	
	private String mcode;
	private String mname;
	private String murl;
	private String micon;
	private String upcode;
	private String isnav;
	private int mlevel;
	private String memClassCd;
	private String mnotice;
	private int morder;
	private String mvalDate;
	private String available;
	
}
