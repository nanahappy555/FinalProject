package kr.or.ddit.dto.stu;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GradAttachVO {

	private int gradAno;
	private String filename;
	private String uploadpath;
	private Date cdate;
	private String applyStatusCd;
	private String grAttClassCd;
	private String stuId;
	
}
