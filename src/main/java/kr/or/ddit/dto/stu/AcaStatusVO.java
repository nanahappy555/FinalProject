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
public class AcaStatusVO {
	
	private int acaChangeSeq; //학적코드
	private String stuId; //학번
	private String acaClassCd; //학적구분코드
	private Date applyDate; //신청 일자
	private String applyYearSeme; //신청 년도
	private String applyStatusCd; //신청 상태 코드
	private String rejContent; //반려 사유 내용
	private String applyDateString;
	private String semeCd;
	private int anoCd;
	private String applyReason;
	
	private List<AttachVO> attachList;
	
}
