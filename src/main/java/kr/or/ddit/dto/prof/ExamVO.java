package kr.or.ddit.dto.prof;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class ExamVO {
	private String examSeq;
	private String lecCd;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date examDate;
	private String examCr;
	private String examDivCd;
	private String examDivName;
	private String subjName;
}
