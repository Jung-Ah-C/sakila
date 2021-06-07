package com.gd.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.SalesService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class SalesController {
	@Autowired SalesService salesService;
	
	// 베스트 셀러, 카테고리별 매출, 월별 매출 맵핑
	@GetMapping("/getSalesList")
	public String getSalesList(Model model, @RequestParam(value = "storeId", required = false) Integer storeId) {
		// 매개변수 디버깅
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ SalesController.getSalesList의 storeId : " + storeId);
		
		// 서비스 호출
		List<Map<String, Object>> bestSellerList = salesService.getBestSellerTop10();
		List<Map<String, Object>> categorySalesList = salesService.getSalesByCategoryList();
		List<Map<String, Object>> monthlySalesList = salesService.getMonthlySalesList(storeId);

		// 디버깅
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ SalesController.getSalesList의 bestSellerList : " + bestSellerList);
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ SalesController.getSalesList의 categorySalesList : " + categorySalesList);
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ SalesController.getSalesList의 monthlySalesList : " + monthlySalesList);
		
		// 모델에 담기
		model.addAttribute("bestSellerList", bestSellerList);
		model.addAttribute("categorySalesList", categorySalesList);
		model.addAttribute("monthlySalesList" ,monthlySalesList);
		model.addAttribute("storeId", storeId);
		
		return "getSalesList";
	}
}
