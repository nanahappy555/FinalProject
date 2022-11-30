package kr.or.ddit.dto.stu;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MajorChangeVO {
	
	private int majorChaSeq; // 과정보 변경 번호
	private String stuCd; // 학번
	private String majorCd; // 학과코드
	private String semeCd; // 학사년도 학기 코드
	private String applyDate; // 신청일자
	private String applyStatusCd; // 신청상태코드
	private String rejContent; // 반려사유내용
	private String majClassCd; // 전공구분코드
	
}
