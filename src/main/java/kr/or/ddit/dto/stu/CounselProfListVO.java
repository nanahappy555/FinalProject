package kr.or.ddit.dto.stu;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class CounselProfListVO {
	
	private String name; //교수이름
	private String profCd; // 교수코드
	private String majorName; // 전공명
	private String phone; //연락처
	private String emailAddr; //이메일
	private int anoCd;
}
