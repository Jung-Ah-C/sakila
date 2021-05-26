package com.gd.sakila.controller;

import java.util.HashMap;
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
	public String getFilmList(Model model, 
								@RequestParam(value="currentPage", defaultValue = "1") int currentPage,
								@RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage,
								@RequestParam(name = "category", required = false) String category,
								@RequestParam(name = "price", required = false) Double price, // 기본타입에 null이 들어갈 수 없어서, double 대신 Double로 설정
								@RequestParam(name = "rating", required = false) String rating,
								@RequestParam(name = "title", required = false) String title,
								@RequestParam(name = "actors", required = false) String actors) { 
		
		// 디버깅
		log.debug("☆★☆★☆★☆★ FilmController. getFilmList()의 currentPage : " + currentPage);
		log.debug("☆★☆★☆★☆★ FilmController. getFilmList()의 rowPerPage : " + rowPerPage);
		log.debug("☆★☆★☆★☆★ FilmController. getFilmList()의 category : " + category);
		log.debug("☆★☆★☆★☆★ FilmController. getFilmList()의 price : " + price);
		log.debug("☆★☆★☆★☆★ FilmController. getFilmList()의 rating : " + rating);
		log.debug("☆★☆★☆★☆★ FilmController. getFilmList()의 title : " + title);
		log.debug("☆★☆★☆★☆★ FilmController. getFilmList()의 actors : " + actors);
		
		// 매개변수가 많아서 Map에 담아서 넘겨줌 (paramMap)
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("currentPage", currentPage);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("category", category);
		paramMap.put("price", price);
		paramMap.put("rating", rating);
		paramMap.put("title", title);
		paramMap.put("actors", actors);
		
		// filmService 호출해서 filmMap 값에 담아줌
		Map<String, Object> filmMap = filmService.getFilmList(paramMap); // 서비스에서 결과물로 return returnMap; 그 결과물을 filmMap에 담아줌
		
		// 디버깅
		log.debug("☆★☆★☆★☆★ FilmController. getFilmList()의 filmMap.lastPage : " + filmMap.get("lastPage"));
		log.debug("☆★☆★☆★☆★ FilmController. getFilmList()의 filmMap.filmList : " + filmMap.get("filmList"));
		
		model.addAttribute("filmList", filmMap.get("filmList"));
		model.addAttribute("categoryNameList", filmMap.get("categoryNameList"));
		model.addAttribute("lastPage", filmMap.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("category", category);
		model.addAttribute("price", price);
		model.addAttribute("rating", rating);
		model.addAttribute("title", title);
		model.addAttribute("actors", actors);
		
		return "getFilmList";
	}
}
