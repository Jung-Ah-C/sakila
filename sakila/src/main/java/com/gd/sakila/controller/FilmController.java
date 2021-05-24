package com.gd.sakila.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.FilmService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class FilmController {
	@Autowired FilmService filmService;
	
	// 영화 목록 맵핑
	@GetMapping("/getFilmList")
	public String getBoardList(Model model, 
			@RequestParam(value="currentPage", defaultValue = "1") int currentPage, 
			@RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage,
			@RequestParam(value="searchWord", required = false) String searchWord) {

		log.debug(currentPage + "<-- getFilmList()의 currentPage");
		log.debug(rowPerPage + "<-- getFilmList()의 rowPerPage");
		log.debug(searchWord + "<-- getFilmList()의 searchWord");
		
		Map<String, Object> map = filmService.getFilmList(currentPage, rowPerPage, searchWord);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("filmList", map.get("filmList"));
		
		return "getFilmList";
	}
	
	// 영화 상세보기 맵핑
	@GetMapping("/getFilmOne")
	public String getFilmOne() {
		filmService.getFilmOne(1, 1);
		return "getFilmOne";
	}
}
