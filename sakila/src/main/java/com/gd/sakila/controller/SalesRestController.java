package com.gd.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.mapper.SalesMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class SalesRestController {
	@Autowired SalesMapper salesMapper;
	
	// 베스트셀러
	@GetMapping("/getBestSeller")
	public List<Map<String, Object>> getBestSeller() {
		List<Map<String, Object>> bestSellerList = salesMapper.selectBestSellerTop10();
		// 디버깅
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ SalesRestController.getBestSeller의 bestSellerList : " + bestSellerList);
		
		return bestSellerList;
	}
	
	// 카테고리별 매출
	@GetMapping("/categorySalesList")
	public List<Map<String, Object>> getCategorySales() {
		List<Map<String, Object>> categorySalesList = salesMapper.selectSalesByCategoryList();
		// 디버깅
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ SalesRestController.getCategorySales의 categorySalesList : " + categorySalesList);
		
		return categorySalesList;
	}
	
	
	// 월별 매출
	@GetMapping("/monthlySalesList")
	public List<Map<String, Object>> getMonthlySales() {
		List<Map<String, Object>> monthlySalesList = salesMapper.selectmonthlySalesList();
		// 디버깅
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ SalesRestController.getMonthlySales의 monthlySalesList : " + monthlySalesList);
		
		return monthlySalesList;
	}
}
