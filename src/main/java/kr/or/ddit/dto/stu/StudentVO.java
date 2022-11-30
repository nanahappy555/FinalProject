package kr.or.ddit.dto.stu;

import java.util.Date;
import java.util.List;

import kr.or.ddit.dto.common.AttachVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StudentVO {

	private String stuCd; //학번
	private String grade; // 학년
	private String stuSemester; //학기
	private Date admDate; // 입학일
	private String nation; //국적
	private String tlTryCount; //휴학시도횟수
	private String acaStateCd; //학적상태
	private String companyCd; // 회사정보코드
	private String clubCd; // 동아리
	private String secCd; // 취업분야코드
	private String name; // 이름
	private String ename; // 영문 이름
	private String phone; // 연락처
	private String zipcode; // 우편번호
	private String add1; // 주소
	private String add2; // 세부주소
	private String email; // 이메일
	private String bankName; // 은행명
	private String accHolder; // 예금주
	private String accNum; // 계좌번호
	private String birthday; // 생년월일
	private String mbtiCd; //mbti
	private String firMajName;
	private String colName;
	private String semeCd;
	private List<AttachVO> attachList;
	private int AnoCd;
	private String majClassCd;
	private String majorCd;
	
	private int totalCredit;
	private int totalSeme;
	
//	private String collegeCd; //학부
//	private String lecApplyCredit; //신청가능학점
//	private String stuMajorCd; //학생-전공
//	private Date regDate; // 등록일
//	private String authority; // 권한
//	private int enabled;   // 사용여부
//	private String register;//등록자

}