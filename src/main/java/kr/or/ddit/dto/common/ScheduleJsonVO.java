package kr.or.ddit.dto.common;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScheduleJsonVO {
	private int id;//scheduleId
	private String title;
	private String start;//시작 날짜
	private String end;
	private String detail;//상세 내용
	private String memId;
}
