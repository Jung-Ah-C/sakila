package com.gd.sakila.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.BoardService;
import com.gd.sakila.vo.Board;

@Controller // controller의 객체가 만들었는지 찾음
public class BoardController {
	@Autowired // 생성된 객체가 있다면 자동으로 주입함
	BoardService boardService;
	
	@GetMapping("/addBoard") // addBoard로 요청이 들어오면 뷰로 보냄
	public String addBoard() {
		return "addBoard";
	}
	
	@PostMapping("/addBoard") // 뷰에서 입력한 값을 처리함
	public String addBoard(Board board) { // board와 관련된 값을 한꺼번에 묶어서 받아옴, 커맨드 객체
		boardService.addBoard(board);
		return "redirect:/getBoardList"; // 입력 후에 getBoardList로 리다이렉트
	}
	
	@GetMapping("/getBoardOne")
	public String getBoardOne(Model model, @RequestParam(value="boardId", required = true) int boardId) {
		Map<String, Object> map = boardService.getBoardOne(boardId);
		model.addAttribute("map", map);
		return "getBoardOne";
	}
	
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
