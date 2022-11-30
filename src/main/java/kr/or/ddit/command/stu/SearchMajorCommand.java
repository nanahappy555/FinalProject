package kr.or.ddit.command.stu;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchMajorCommand {
	private String colCd;
	private String majorCd;
	private String semeCd;
}
