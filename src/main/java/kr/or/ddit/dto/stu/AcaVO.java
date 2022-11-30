package kr.or.ddit.dto.stu;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class AcaVO {
	
	private String stuCd;
	private String semeCd;
	private String acaClass;
	private String applyStatusCd;
	private Date applyDate;
}
