package kr.or.ddit.dto.common;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScScheduleVO {

	private int scScheduleSeq;
	private String content;
	private Date startDate;
	private Date endDate;
	private String note;
	private String semeCd;
}
