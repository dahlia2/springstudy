package com.gdu.app06.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.app06.domain.BoardDTO;
import com.gdu.app06.service.BoardService;

@RequestMapping("/board")   // ① board 폴더의
@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	// ParameterCheckAOP에 의해서 파라미터를 체크할 메소드의 이름은 모두 ParamCheck로 끝난다. 
	
	// [ 게시판 목록 ] - Model 사용
	@GetMapping("/list.do")  // ② list.do 으로 부른 요청 응답!
	public String list(Model model) {
		model.addAttribute("boardList", boardService.getBoardList());
		return "board/list";
	}
	
	
	// [ 게시판 작성 ]
	@GetMapping("/write.do")  
	public String write() {    // 페이지 이동시 가져갈 데이터는 없음.
		return "board/write";
	}
	
	
	// [ 게시판 작성 끝 -> 목록 이동 ] - 커맨드 객체로 파라미터(입력값) 받음 (자동으로 Model에 저장) /  (주소창에 파라미터 노출은 X)
	@PostMapping("/add.do")
	public String addParamCheck(BoardDTO board) {  
		boardService.addBoard(board);      // 작성한 토대로 쿼리문 돌리러 가고 (INSERT)
		return "redirect:/board/list.do";  // 그대로 요청 전달 (POST Mapping, 목록으로 redirect)
	}
	
	
	// [ 상세 조회 ]  -  @RequestParam로 파라미터 받음
	@GetMapping("/detail.do") 
	public String detailParamCheck(@RequestParam(value="board_no", required=false, defaultValue="0") int board_no
								   , Model model) { 
		model.addAttribute("b", boardService.getBoardByNo(board_no));   // service 에게 번호를 줘서 -> board 객체를 받아온다
		return "board/detail";   // 받아온 board 객체를 담은 상태로 detail.jsp로 이동 - (jsp에서 el언어로 'b' 라고 꺼내올 수 있음)
	}
	
	
	// [ 게시판 삭제 ]
	@GetMapping("/remove.do")
	public String removeParamCheck(@RequestParam(value="board_no", required=false, defaultValue="0") int board_no) {
		boardService.removeBoard(board_no);  // jsp에서 el 언어를 통해 게시판번호를 전달 받았음
		return "redirect:/board/list.do";    // 그대로 요청 전달 (목록으로 redirect)
	}
	
	
	// [ 게시판 수정 ]
	@PostMapping("/modify.do")
	public String modifyParamCheck(BoardDTO board) {
		boardService.modifyBoard(board);
		return "redirect:/board/detail.do?board_no=" + board.getBoard_no(); // 번호는 커맨드객체 값을 가져옴(겟셋메소드)
	}
	
	
	// 트랜잭션 처리 확인을 위한 testTx() 메소드 호출하기
	@GetMapping("/tx.do")  // http://localhost:9090/app06/board/tx.do
	public String tx() {
		boardService.testTx();
		return "redirect:/board/list.do";
	}
	
}