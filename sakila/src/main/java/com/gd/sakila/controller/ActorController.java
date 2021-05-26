package com.gd.sakila.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.ActorService;
import com.gd.sakila.vo.Actor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class ActorController {
	@Autowired ActorService actorService;
	
	// 배우 추가 맵핑
	@GetMapping("/addActor")
	public String addActor() {
		return "addActor";
	}
	@PostMapping("/addActor")
	public String addActor(Actor actor) {
		log.debug("▶▶▶▶▶▶▶ addActor()의 actor : " + actor); // view에서 입력한 값이 넘어오는지 디버깅
		actorService.addActor(actor); // 입력한 값을 서비스 호출을 통해서 DB에 입력함
		return "redirect:/admin/getActorList";
	}
	
	// 배우 목록 맵핑
	@GetMapping("/getActorList") // actor_view
	public String getActorList(Model model,
							   @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
							   @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
							   @RequestParam(value = "searchWord", required = false) String searchWord) {
		// 디버깅
		log.debug("▶▶▶▶▶▶▶ ActorController.getActorList()의 currentPage : " + currentPage);
		log.debug("▶▶▶▶▶▶▶ ActorController.getActorList()의 rowPerPage : " + rowPerPage);
		log.debug("▶▶▶▶▶▶▶ ActorController.getActorList()의 searchWord : " + searchWord);
		
		// 매개변수를 paramMap 객체 담아줌
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("currentPage", currentPage);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		// 서비스 호출해서, 결과물을 actorMap에 담아줌
		Map<String, Object> actorMap = actorService.getActorList(paramMap); // service의 returnMap값이 actorMap에 복사
		log.debug("▶▶▶▶▶▶▶ ActorController.getActorList()의 actorMap : " + actorMap);
		
		// model 객체에 결과값 추가
		model.addAttribute("actorList", actorMap.get("actorList"));
		model.addAttribute("page", actorMap.get("page"));
		model.addAttribute("lastPage", actorMap.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("searchWord", searchWord);
		
		return "getActorList";
	}
}
