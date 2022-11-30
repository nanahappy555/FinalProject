package kr.or.ddit.dto.prof;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CsRecordVO {
	
	private int counselNo;
	private String counselContent;
	private Date recordDate;
	private Date counselDate;
	

}
