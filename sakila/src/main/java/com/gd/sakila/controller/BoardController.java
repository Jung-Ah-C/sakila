package com.gd.sakila.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.BoardService;
import com.gd.sakila.vo.Board;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Slf4j // logger (디버깅) 객체를 자동 생성
@Controller // controller의 객체가 만들어졌는지 찾음
@RequestMapping("/admin") // 클래스 위에 매핑을 설정할 때는 RequestMapping을 사용해야 함 (get, post 방식 모두 받음)
public class BoardController {
	@Autowired // 생성된 객체가 있다면 자동으로 주입함
	BoardService boardService;
	
	// 수정
	@GetMapping("/modifyBoard")
	public String modifyBoard(Model model, @RequestParam(value = "boardId", required = true) int boardId) {
		log.debug("modifyBoard() param : " + boardId);
		// select
		Map<String, Object> map = boardService.getBoardOne(boardId);
		System.out.println("@@@@@@@@@@@@@map"+map);
		model.addAttribute("map", map.get("boardMap")); // map에 boardMap과 commentList 같이 들어있어서 boardMap만 꺼내줌
		return "modifyBoard";
	}
	
	@PostMapping("/modifyBoard")
	public String modifyBoard(Board board) {
		log.debug("modifyBoard() param : " + board.toString());
		int row = boardService.modifyBoard(board);
		log.debug("modifyBoard() row : " + row);
		return "redirect:/getBoardOne?boardId="+board.getBoardId();
	}
	
	// 삭제
	// 리턴타입 뷰이름 문자열 C -> V
	@GetMapping("/removeBoard") // 컨트롤러 메소드의 리턴타입은 뷰 이름 (문자열)
	public String removeBoard(Model model, @RequestParam(value = "boardId", required = true) int boardId) {
		log.debug("removeBoard() param : " + boardId); // 디버깅 코드 int값만 출력 불가능, String 추가해서 출력함
		model.addAttribute("boardId", boardId);
		return "removeBoard";
	}
	
	// C -> M -> redirect(C)
	@PostMapping("/removeBoard")
	public String removeBoard(Board board) {
		int row = boardService.removeBoard(board);
		log.debug("removeBoard의 row : "+row);
		if(row == 0) { // 삭제 실패 시
			return "redirect:/getBoardOne?boardId="+board.getBoardId();
		}
		return "redirect:/getBoardList";
	}
	
	// 추가
	@GetMapping("/addBoard") // addBoard로 요청이 들어오면 뷰로 보냄
	public String addBoard() {
		return "addBoard";
	}
	
	@PostMapping("/addBoard") // 뷰에서 입력한 값을 처리함
	public String addBoard(Board board) { // board와 관련된 값을 한꺼번에 묶어서 받아옴, 커맨드 객체
		boardService.addBoard(board);
		return "redirect:/getBoardList"; // 입력 후에 getBoardList로 리다이렉트
	}
	
	// boardOne
	@GetMapping("/getBoardOne")
	public String getBoardOne(Model model, @RequestParam(value="boardId", required = true) int boardId) {
		Map<String, Object> map = boardService.getBoardOne(boardId);
		log.debug("map : " + map); // log.debug(맵) 맵 풀어서 출력해줌 
		log.debug("!!!!!!!!!!!!!!!!!!!!!" + map.get("boardMap").toString());
		model.addAttribute("boardMap", map.get("boardMap"));
		model.addAttribute("commentList", map.get("commentList"));
		return "getBoardOne";
	}
	
	// boardList
	@GetMapping("/getBoardList")
	public String getBoardList(Model model, 
								@RequestParam(value="currentPage", defaultValue = "1") int currentPage, 
								@RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage,
								@RequestParam(value="searchWord", required = false) String searchWord) {
			
			System.out.println(currentPage+"<--currentPage");
			System.out.println(rowPerPage+"<--rowPerPage");
			System.out.println(searchWord+"<--searchWord");
			
		Map<String, Object> map = boardService.getBoardList(currentPage, rowPerPage, searchWord);
		// model.addAttribute("map", map);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("boardList", map.get("boardList"));
		
		return "getBoardList";
	}
}
