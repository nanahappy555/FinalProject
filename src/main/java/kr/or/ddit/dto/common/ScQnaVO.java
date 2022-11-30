package kr.or.ddit.dto.common;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScQnaVO {
	
	private int scqBno;
	private String scTitle;
	private String scContent;
	private Date cdate;
	private int viewCnt;
	private String writer;
	private String secretCd;
	private String scRcontent;
	private Date redate;
	
	
	
}
