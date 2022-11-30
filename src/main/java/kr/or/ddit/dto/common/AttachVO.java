package kr.or.ddit.dto.common;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AttachVO {

	private int anoCd;
	private int anoSeq;
	private String filename;
	private String uploadpath;
	private Double filesize;
}
