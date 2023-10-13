package egov.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egov.service.MemberService;

@Controller
public class MemberController {
	
	@Resource(name="memberService")
	MemberService memberService;

	@RequestMapping("/memberWrite.do")
	public String memberWrite() {
		return "member/memberWrite";
	}
	
	@RequestMapping("/useridChk.do")
	@ResponseBody  //비동기방식(ajax) 메세지 전송을 위한 수단
	public String selectMemberUseridCnt(String userid) throws Exception {
		
		//cnt = 1 or cnt = 0 ;
		// 숫자 + 영문자 + "_-" => 2 :: 특수문자 여부 체크
		int cnt = memberService.selectMemberUseridCnt(userid);
		//[] => 범위   {} => 갯수	   :: 첫번째 글자는 대소문자 영어만 가능 그 후에 올 5번째~11번째 숫자는 숫자, 대소문자 영어, _, - 가능
		String pattern = "[a-zA-Z]{1}[0-9a-zA-Z_-]{5,11}";
		boolean result = userid.matches(pattern);
		if (result == false) {
			cnt = 2;
		}

		return cnt + "";
	}
	
	@RequestMapping("/loginWrite.do")
	public String loginWrite(HttpSession session) {
		
		//Session SessionID="test123";
		// 					(변수명, 사용자ID)
		session.setAttribute("SessionID", "test123");
		
		
		return "redirect:sample.do";
		
	}
	
	@RequestMapping("/logoutWrite.do")
	public String logout(HttpSession session) {
		session.removeAttribute("SessionID");
		
		return "redirect:sample.do";
	}
}
