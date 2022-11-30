package kr.or.ddit.dto.prof;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SyllabusVO {

	private String sylCd;
	private int maxStuNum;
	private String applyStatusCd;
	private Date applyDate;
	private Date approveDate;
	private String profId;
	private String subjCd;
	private String subjName;
	private String outline;
	private int lecHour;
	private String materials;
	private String rejReason;
	private String evalClassCd;
	private String lecCategoryCd;
	private String credit;
	private String lecDate1;
	private String lecDate2;
	private String classroom;
	private String semeCd;
}
