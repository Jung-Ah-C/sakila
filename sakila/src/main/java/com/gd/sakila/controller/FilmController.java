package com.gd.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.FilmService;
import com.gd.sakila.service.LanguageService;
import com.gd.sakila.vo.Category;
import com.gd.sakila.vo.FilmForm;
import com.gd.sakila.vo.Language;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class FilmController {
	@Autowired FilmService filmService;
	@Autowired LanguageService languageService;
	
	// 영화 삭제 맵핑
	@GetMapping("/removeFilm")
	public String removeFilm(@RequestParam(value="filmId", required = true) int filmId) {
		// 매개변수 디버깅
		log.debug("☆★☆★☆★☆★ FilmController.removeFilm의 filmId : " + filmId);
		
		// 서비스 호출
		int removeFilm = filmService.removeFilm(filmId);
		log.debug("☆★☆★☆★☆★ FilmController.removeFilm의 removeFilm : " + removeFilm);
		
		return "redirect:/admin/getFilmList";
	}
	
	// 영화 수정 맵핑
	@GetMapping("/modifyFilm")
	public String modifyFilm(Model model, @RequestParam(value="filmId", required = true) int filmId) {
		// 서비스 호출
		// category list
		List<Category> categoryList = filmService.getCategoryList(); // CategoryService에서 가져옴
		log.debug("☆★☆★☆★☆★ FilmController.modifyFilm의 categoryList toString() : " + categoryList.toString());
		
		// language list
		List<Language> languageList = languageService.getLanguageList();
		log.debug("☆★☆★☆★☆★ FilmController.modifyFilm의 languageList toString() : " + languageList.toString());
		
		// 영화 상세 정보
		Map<String, Object> filmOneMap = filmService.getFilmOne(filmId);
		log.debug("☆★☆★☆★☆★ FilmController.modifyFilm의 filmOneMap : " + filmOneMap);
		
		// model에 넘길 값들 담기
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("languageList", languageList);
		model.addAttribute("store1Stock", filmOneMap.get("store1Stock"));
		model.addAttribute("store2Stock", filmOneMap.get("store2Stock"));
		model.addAttribute("filmOne", filmOneMap.get("filmOne"));
		
		return "modifyFilm";
	}
	
	@PostMapping("/modifyFilm") // 기본(값)타입 매개변수의 이름과 name이 같으면 맵핑
	public String modifyFilm(FilmForm filmForm) { // 참조타입은 필드명과 input name이 같으면 맵핑, 형변환도 알아서 됨 cf) 커맨드 타입
		// 서비스 호출하면서 filmId 리턴값으로 받음 -> redirect할 때 필요함
		int filmId = filmService.modifyFilm(filmForm);
		return "redirect:/admin/getFilmOne?filmId="+filmId;
	}
	
	// 영화 추가 맵핑
	@GetMapping("/addFilm")
	public String addFilm(Model model) {
		// category list
		List<Category> categoryList = filmService.getCategoryList(); // CategoryService에서 받자!
		log.debug("☆★☆★☆★☆★ FilmController.addFilm의 categoryList size() : " + categoryList.size());
		// language list
		List<Language> languageList = languageService.getLanguageList();
		log.debug("☆★☆★☆★☆★ FilmController.addFilm의 languageList size() : " + languageList.size());
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("languageList", languageList);
		
		return "addFilm";
	}
	
	@PostMapping("/addFilm") // 기본(값)타입 매개변수의 이름과 name이 같으면 맵핑
	public String addFilm(FilmForm filmForm) { // 참조타입은 필드명과 input name이 같으면 맵핑, 형변환도 알아서 됨 cf) 커맨드 타입
		int filmId = filmService.addFilm(filmForm);
		return "redirect:/admin/getFilmOne?filmId="+filmId;
	}
	
	// 영화 배우 수정 맵핑
	@GetMapping("/getFilmActorListByFilm")
	public String getFilmActorListByFilm(Model model, @RequestParam(value = "filmId", required = true) int filmId) {
		List<Map<String, Object>> list = filmService.getFilmActorListByFilm(filmId);
		log.debug("☆★☆★☆★☆★ FilmController.getFilmActorListByFilm의 list size() : " + list.size());
		
		model.addAttribute("filmActorList", list);
		model.addAttribute("filmId", filmId);
		
		return "getFilmActorListByFilm";
	}
	
	@PostMapping("/modifyFilmActor")
	public String modifyFilmActor(Model model,
								  @RequestParam(value = "filmId", required = true) int filmId,
								  @RequestParam(value = "ck") int[] ck) {
		log.debug("☆★☆★☆★☆★ FilmController.modifyFilmActor의 filmId : " + filmId);
		log.debug("☆★☆★☆★☆★ FilmController.modifyFilmActor의 ck length : " + ck.length);
		
		// 파라미터 값 가공
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("filmId", filmId);
		paramMap.put("actorId", ck); // 배열
		
		// 영화배우 목록 전체 삭제 및 새롭게 추가 기능
		if(ck != null) {
			filmService.modifyFilmActorListByFilm(paramMap);
		}
		
		return "redirect:/admin/getFilmOne?filmId="+filmId;
	}
	
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
	
	// 영화 상세보기 맵핑
	@GetMapping("/getFilmOne")
	public String getFilmOne(Model model, @RequestParam(value="filmId", required = true) int filmId) {
		// 디버깅
		log.debug("☆★☆★☆★☆★ FilmController. getFilmOne()의 filmId : " + filmId);
		
		Map<String, Object> filmOneMap = filmService.getFilmOne(filmId);
		log.debug("☆★☆★☆★☆★ FilmController. getFilmOne()의 filmOneMap : " + filmOneMap);
		
		model.addAttribute("store1Stock", filmOneMap.get("store1Stock"));
		model.addAttribute("store2Stock", filmOneMap.get("store2Stock"));
		model.addAttribute("filmOne", filmOneMap.get("filmOne"));
		
		return "getFilmOne";
	}
}
