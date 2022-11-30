package kr.or.ddit.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dto.LecNoticeVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LectrueNoticeRegistCommand {

	private String title;
	private String content;
	private List<MultipartFile> uploadFile;
	
	public LecNoticeVO toLectureNoticeVO() {
		LecNoticeVO lectureNotice = new LecNoticeVO();
		lectureNotice.setContent(this.content);
		lectureNotice.setTitle(this.title);
		
		return lectureNotice;
	}
}
