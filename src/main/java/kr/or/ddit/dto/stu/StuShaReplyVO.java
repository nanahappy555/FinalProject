package kr.or.ddit.dto.stu;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StuShaReplyVO {
	
	private int shaRno;
	private int shaBno;
	private String content;
	private Date cdate;
	private String stuId;
	private String lecCd = "SYL0000"; //all일 경우
	
	private String name;

}
