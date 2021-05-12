package com.gd.sakila.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.CountryService;

@Controller // CountryController 클래스의 객체가 만들어질 때
public class CountryController {
	@Autowired // spring이 만들어 놓은 객체가 있다면, 자동으로 주입함
	private CountryService countryService;
	
	@GetMapping("/countryList") // 웹 상에서 countryList라고 요청값이 들어오면
	public String countryList(Model model, // 해당 메소드를 실행함
								@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
								@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage) {
		Map<String, Object> map = countryService.getCountryList(currentPage, rowPerPage);
		model.addAttribute("list", map.get("list")); // request.setAttribute와 같은 기능
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		return "countryList"; 	// 원래는 request.getDispatcher(/WEB-INF/view/adssad.jsp).forward(request, response)의 자리
								// 디폴트 값(application properties에서 설정한 값들)이 포워딩
	}
}