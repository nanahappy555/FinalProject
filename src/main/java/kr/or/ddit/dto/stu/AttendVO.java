package kr.or.ddit.dto.stu;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AttendVO {
	private int attendSeq;
	private String stuCd;
	private String lecCd;
	private String attendStatusCd;
	private Date attendDate;
	private int attendCnt;
	private int weekSeq;
	private String semeCd;
	private int lecHour;
	private String name;
	private int semeWeek;
	private int lateCnt;
	private int leCnt;
	private int absentCnt;
	private int count;
	
	private String subjName;
}
