package kr.or.ddit.dto.stu;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BookHistoryVO {
	private int bookHistoryCd;
	private String stuId;
	private String isbn;
	private Date rentDate;
	private Date returnDate;
}
