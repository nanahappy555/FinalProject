package kr.or.ddit.controller.mylecture;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.command.CriteriaLec;
import kr.or.ddit.dto.LecNoticeVO;
import kr.or.ddit.service.prof.LectureNoticeService;
import kr.or.ddit.service.stu.lec.MyLectureService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mylecture/notice")
public class LectureNoticeController {
	
	@Autowired
	private MyLectureService myLectureService;
	
	@Autowired
	private LectureNoticeService lectureNoticeService;

	@GetMapping("/list")
	public String list(CriteriaLec cri,Model model) throws SQLException {
		String url = "mylecture/noticeList";
		log.debug("CriteriaLec확인 : "+cri);
		if(cri.getPerPageNum()<20) {
			cri.setPerPageNum(20);
		}
		Map<String,Object> dataMap= myLectureService.selectLecNoticeList(cri);
		log.debug("dataMap확인"+dataMap);
		model.addAttribute("dataMap",dataMap);
		model.addAttribute("lecCd",cri.getLecCd());
		return url;
	}
	
	@GetMapping("/detail")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
	public ModelAndView detail(LecNoticeVO lecNotice,ModelAndView mnv) throws SQLException {
		String url = "mylecture/noticeDetail";
		LecNoticeVO notice = lectureNoticeService.getLectureNotice(lecNotice);
		mnv.addObject("lecCd",lecNotice.getLecCd());
		mnv.addObject("notice",notice);
		mnv.setViewName(url);
		return mnv;
	}
	
	@GetMapping("/registForm")
	public String registForm() throws SQLException {
		String url = "mylecture/noticeRegistForm";
		
		return url;
	}
	
	@GetMapping("/modifyForm")
	public String modifyForm() throws SQLException {
		String url = "mylecture/noticeModifyForm";
		
		return url;
	}
	
	
}
