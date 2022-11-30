package kr.or.ddit.controller.stu;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.dto.common.MemberVO;
import kr.or.ddit.dto.stu.StuShaReplyVO;
import kr.or.ddit.service.stu.support.ShaReplyService;
import lombok.extern.slf4j.Slf4j;


/**
	/replies/{shaBno}			list : GET
	/replies/					regist : POST
	/replies/{shaRno}			modify : PUT
	/replies/{shaBno}/{shaRno}  remove : DELETE
 **/
@Slf4j
@Controller
@RequestMapping("replies")
public class StuShareReplyController {

	@Autowired
	private ShaReplyService shaReplyService;
	
	
	@GetMapping(value="/{shaBno}", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<StuShaReplyVO> replyList(@PathVariable("shaBno") int shaBno) throws SQLException{
		
		List<StuShaReplyVO> replyList = shaReplyService.getReplyList(shaBno);
		
		return replyList;
	}
	
	@PostMapping(value="", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String regist(@RequestBody StuShaReplyVO shaReply, HttpServletRequest request) throws SQLException{
		String result = "댓글이 등록되었습니다.";
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String stuId = member.getMemId();
		shaReply.setStuId(stuId);
		log.debug("컨트롤러 들어오나요?"+shaReply);
		shaReplyService.registReply(shaReply);
		
		return result;
	}
	
	@PutMapping(value="/{shaRno}", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String modify(@PathVariable("shaRno") int shaRno, @RequestBody StuShaReplyVO shaReply) throws SQLException{
		String result = "댓글이 수정되었습니다.";
	
		shaReply.setShaRno(shaRno);
		
		shaReplyService.modifyReply(shaReply);
		
		return result;
	}
	
	@DeleteMapping(value="/{shaBno}/{shaRno}", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String remove(@PathVariable("shaBno") int shaBno, @PathVariable("shaRno") int shaRno) throws SQLException{
		String result = "댓글이 삭제되었습니다.";
		
		shaReplyService.removeReply(shaRno);
		return result;
	}
	
	
	
	
}
