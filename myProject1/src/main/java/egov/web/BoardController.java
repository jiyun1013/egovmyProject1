package egov.web;

import java.util.List;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egov.service.BoardService;
import egov.service.BoardVO;

@Controller
public class BoardController {

	@Resource(name = "boardService")
	public BoardService boardService;

	@RequestMapping(value = "/boardWrite.do")
	public String boardWrite() {

		return "board/boardWrite";
	}
	
	@RequestMapping(value = "/reboardWrite.do")
	public String reboardWrite() {
		return "board/reboardWrite";
	}

	@RequestMapping(value = "/boardWriteSave.do")
	@ResponseBody
	public String insertBoard(BoardVO vo) throws Exception {

		String msg = "";
		String result = boardService.insertBoard(vo);
		if (result == null) {
			System.out.println("===== 저장완료 =====");
			msg = "ok";
		} else {
			System.out.println("===== 저장실패 =====");
			msg = "fail";
		}

		return msg;
	}
	
	@RequestMapping(value = "/reBoardWriteSave.do")
	@ResponseBody
	public String insertReBoard(BoardVO vo) throws Exception {

		String msg = "";
		String result = boardService.insertReBoard(vo);
		if (result == null) {
			System.out.println("===== 저장완료 =====");
			msg = "ok";
		} else {
			System.out.println("===== 저장실패 =====");
			msg = "fail";
		}

		return msg;
	}

	@RequestMapping(value = "/boardList.do")
	public String selectBoardList(BoardVO vo, ModelMap model) throws Exception {
		
		System.out.println("=== page : "+vo.getPage());
		
		//unit 갯수만큼 보기
		int unit = 10;
		
		int page = vo.getPage();
		// 1=>1, 2=>11, 3=>21
		int startno = (page - 1) * unit + 1;
		int endno = startno + (unit - 1);
		
		vo.setStartno(startno);
		vo.setEndno(endno);

		int total = boardService.selectBoardTotal(vo);
		
		List<?> list = boardService.selectBoardList(vo);

		// ceil(1.2) => 2 (나눗셈하고 나머지 올림) ceil은 double타입이라 2.0의 값이 나옴 (int타입으로 쓸거면 타입캐스팅 필요)
		int lastpage = 0;
		lastpage = (int) Math.ceil((double) total / unit);
//		lastpage = (int) Math.ceil(total / 10.0);
		int pageno = total - ((page - 1) * unit);

		// ("jsp에서 사용할 이름", 실제데이터)
		model.addAttribute("resultList", list);
		model.addAttribute("total", total);
		model.addAttribute("lastpage", lastpage);
		model.addAttribute("pageno", pageno);

		return "board/boardList";
	}
	
	@RequestMapping(value="/reboardList.do")
	public String selectReBoardList(BoardVO vo, ModelMap model) throws Exception{
		
		List<?> list = boardService.selectReBoardList(vo);
		model.addAttribute("resultList", list);
		
		return "board/reboardList";
	}

	@RequestMapping(value = "/boardDetail.do")
	public String selectBoardDetail(int unq, ModelMap model) throws Exception {

		BoardVO vo = boardService.selectBoardDetail(unq);

		String content = vo.getContent();
		content = content.replace("\n", "<br>");
		content = content.replace(" ", "&nbsp;");
		vo.setContent(content);

		model.addAttribute("vo", vo);

		// 조회수 증가
		int cnt = boardService.updateBoardHits(unq);

		return "board/boardDetail";
	}

	@RequestMapping(value = "/boardPassWrite.do")
	public String boardPassWrite(int unq, ModelMap model) {

		model.addAttribute("unq", unq);

		return "board/boardPassWrite";
	}

	@RequestMapping("/boardDelete.do")
	public String deleteBoard(BoardVO vo) throws Exception {

		// 암호 확인 서비스
		int cnt = boardService.selectBoardPass(vo);

		if (cnt == 1) {
			// 삭제 서비스
			System.out.println("==== 암호 일치 ====");
			int result = boardService.deleteBoard(vo);
			if (result == 1) {
				System.out.println("==== 삭제 성공 ====");
			} else {
				System.out.println("==== 삭제 실패 ====");
			}
		} else {
			System.out.println("==== 암호 불일치 ====");
		}

		// redirect:해당 클래스 내 다른 매핑중 하나를 실행하겠다
		return "redirect:/boardList.do";
	}
	
	
}