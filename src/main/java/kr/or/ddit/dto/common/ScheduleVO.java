package kr.or.ddit.dto.common;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScheduleVO {
	private int scheId;//scheduleId
	private String title;
	private String memId;
	private String startDate;//시작 날짜
	private String endDate;
	private int id;
	private Date start;
	private Date end;
	private String detail;
}
