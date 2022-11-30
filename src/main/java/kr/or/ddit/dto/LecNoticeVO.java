package kr.or.ddit.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LecNoticeVO {
	private int lecNoticeNo;
	private String lecCd;
	private Date cdate;
	private String content;
	private String title;
	private int viewCnt;
	private Integer anoCd;
	private String subjName;
	
	
}
