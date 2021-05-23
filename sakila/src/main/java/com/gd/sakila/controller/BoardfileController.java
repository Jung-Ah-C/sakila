package com.gd.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gd.sakila.service.BoardfileService;
import com.gd.sakila.vo.Boardfile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class BoardfileController {
	@Autowired BoardfileService boardfileService;
	
	@GetMapping("/addBoardfile")
	public String addBoardfile(Model model, @RequestParam(value = "boardId", required = true) int boardId) { // required를 true로 설정하면 무조건 받아야 하는 매개변수임
		model.addAttribute("boardId", boardId);
		return "addBoardfile";
	}
	
	@PostMapping("/addBoardfile")
	public String addBoardfile(MultipartFile multipartFile, @RequestParam(value = "boardId", required = true) int boardId) {
		// view에서 받은 param 디버깅
		log.debug("▶▶▶▶▶▶▶ addBoardfile() boardId : " + boardId);
		log.debug("▶▶▶▶▶▶▶ addBoardfile() multipartFile : " + multipartFile);
		// service 메소드 실행
		boardfileService.addBoardfile(multipartFile, boardId);
		return "redirect:/admin/getBoardOne?boardId="+boardId;
	}
	
	@GetMapping("/removeBoardfile")
	public String removeBoardfile(Boardfile boardfile) {
		// 글쓴이가 아니더라도 삭제가 가능한 이슈가 있음
		boardfileService.removeBoardfileOne(boardfile);
		return "redirect:/admin/getBoardOne?boardId="+boardfile.getBoardId();
	}
}
