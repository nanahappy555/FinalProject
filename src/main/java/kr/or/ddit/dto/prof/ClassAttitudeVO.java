package kr.or.ddit.dto.prof;

import kr.or.ddit.dto.stu.StudentVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class ClassAttitudeVO {
	private int missAttend;
	private int missAss;
	private int midScore;
	private int finScore;
	private StudentVO student;
}
