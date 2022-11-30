package kr.or.ddit.dto.prof;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LectureListVO {
	private String subjName;
	private String name;
	private String emailAddr;
	private String lecCd;
	private String lecDate1;
	private String lecDate2;
	private String classroom;
	private String lecOpenStatusCd;
}
