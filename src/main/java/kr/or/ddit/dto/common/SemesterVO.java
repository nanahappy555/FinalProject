package kr.or.ddit.dto.common;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SemesterVO {
	private String semeCd;
	private String scYear;
	private String scSemester;
	private String available;
	private Date semeStartDate;
	private Date semeEndDate;
	private int currentWeek;
}
