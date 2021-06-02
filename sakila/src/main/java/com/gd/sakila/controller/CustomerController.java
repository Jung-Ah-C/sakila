package com.gd.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.CustomerService;
import com.gd.sakila.vo.CustomerList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class CustomerController {
	@Autowired CustomerService customerService;
	
	@GetMapping("/getCustomerList")
	public String getCustomerList(Model model,
	         @RequestParam(value="currentPage", defaultValue = "1") int currentPage,
	         @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
	         @RequestParam(value="searchWord", required = false) String searchWord) {
		// 디버깅
		log.debug("ㅇㅇㅇㅇㅇ CustomerController.getCustomerList의 currentPage : " + currentPage);
		log.debug("ㅇㅇㅇㅇㅇ CustomerController.getCustomerList의 rowPerPage : " + rowPerPage);
		log.debug("ㅇㅇㅇㅇㅇ CustomerController.getCustomerList의 searchWord : " + searchWord);
		
		// 페이징 변수 가공
		// customerTotal 메서드 호출
		int customerTotal = customerService.selectCustomerTotal(searchWord);
		log.debug("ㅇㅇㅇㅇㅇ CustomerController.getCustomerList의 customerTotal : " + customerTotal);
		
		// lastPage, beginRow 계산
		int beginRow = (currentPage - 1) * rowPerPage;
		int lastPage = (int)Math.ceil((double)customerTotal / rowPerPage); // 값이 소수점으로 나올 수도 있어서 int로 강제변환
		log.debug("ㅇㅇㅇㅇㅇ CustomerController.getCustomerList의 beginRow : " + beginRow);
		log.debug("ㅇㅇㅇㅇㅇ CustomerController.getCustomerList의 lastPage : " + lastPage);
		
		// 서비스에 쓰일 페이징 변수들을 map에 담음
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("currentPage", currentPage);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("beginRow", beginRow);
		paramMap.put("searchWord", searchWord);
		paramMap.put("lastPage", lastPage);
		
		// 서비스 호출
		// 고객 목록 출력 서비스
		List<CustomerList> customerList = customerService.getCustomerList(paramMap);
		// 블랙리스트 고객 목록 출력 서비스
		List<Map<String, Object>> blackList = customerService.getBlackCustomerList();
		
		// model에 담음
		model.addAttribute("customerList", customerList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("beginRow", beginRow);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("blackList", blackList);
		
		return "getCustomerList";
	}
}
