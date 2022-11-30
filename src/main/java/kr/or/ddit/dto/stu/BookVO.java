package kr.or.ddit.dto.stu;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BookVO {

	private String isbn;
	private String title;
	private String writer;
	private String publisher;
	private String publishedYear;
	
}
