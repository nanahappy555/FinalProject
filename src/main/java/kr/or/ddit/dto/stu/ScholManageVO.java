package kr.or.ddit.dto.stu;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScholManageVO {
	
	private String scholCd;
	private String scholName;
	private int scholAmount;
	private String content;
	private int benefNum;
	private String reqDocContent;
	private String target;
	private Date startDate;
	private Date endDate;
	private String icon;
	
}
