package com.gd.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.SalesMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class SalesService {
	@Autowired SalesMapper salesMapper;
	// 베스트셀러 액션
	public List<Map<String, Object>> getBestSellerTop10() {
		return salesMapper.selectBestSellerTop10();
	}
	
	// 카테고리별 매출
	public List<Map<String, Object>> getSalesByCategoryList() {
		return salesMapper.selectSalesByCategoryList();
	}
	
	// 월별 리스트
	public List<Map<String, Object>> getMonthlySalesList(Integer storeId) {
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ SalesService.getMonthlySalesList의 storeId : " + storeId);
		return salesMapper.selectmonthlySalesList(storeId);
	}
}
