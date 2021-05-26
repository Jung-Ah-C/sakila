package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CategoryMapper;
import com.gd.sakila.mapper.FilmMapper;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class FilmService {
	@Autowired FilmMapper filmMapper;
	@Autowired CategoryMapper categoryMapper;
	
	// 영화 목록 액션
	public Map<String, Object> getFilmList(Map<String, Object> paramMap) {
		// 디버깅
		log.debug("☆★☆★☆★☆★ FilmService.getFilmList()의 currentPage : " + paramMap.get("currentPage"));
		log.debug("☆★☆★☆★☆★ FilmService.getFilmList()의 rowPerPage : " + paramMap.get("rowPerPage"));
		log.debug("☆★☆★☆★☆★ FilmService.getFilmList()의 category : " + paramMap.get("category"));
		log.debug("☆★☆★☆★☆★ FilmService.getFilmList()의 price : " + paramMap.get("price"));
		log.debug("☆★☆★☆★☆★ FilmService.getFilmList()의 rating : " + paramMap.get("rating"));
		log.debug("☆★☆★☆★☆★ FilmService.getFilmList()의 title : " + paramMap.get("title"));
		log.debug("☆★☆★☆★☆★ FilmService.getFilmList()의 actors : " + paramMap.get("actors"));
		
		// 변수 정의
		int currentPage = (int)paramMap.get("currentPage");
		int rowPerPage = (int)paramMap.get("rowPerPage");
		String category = (String)paramMap.get("category");
		Double price = (Double)paramMap.get("price");
		String rating = (String)paramMap.get("rating");
		String title = (String)paramMap.get("title");
		String actors = (String)paramMap.get("actors");
		
		// 카테고리 목록을 가져오기 위해서 mapper 호출
		List<String> categoryNameList = categoryMapper.selectCategoryNameList();
		log.debug("☆★☆★☆★☆★ FilmService.getFilmList()의 categoryNameList : " + categoryNameList);
		
		// 페이징
		Page page = new Page();
		page.setBeginRow((currentPage-1)*rowPerPage);
		page.setRowPerPage(rowPerPage);
		
		// 페이징과 관련된 변수를 pageMap에 담아줌
		Map<String,Object> pageMap = new HashMap<>();
		pageMap.put("page", page);
		pageMap.put("category", category);
		pageMap.put("price", price);
		pageMap.put("rating", rating);
		pageMap.put("title", title);
		pageMap.put("actors", actors);
		
		// 페이징을 위해 데이터의 전체 개수를 파악하기 위해서 해당 mapper 호출
		int filmTotal = filmMapper.selectFilmTotal(pageMap);
		log.debug("☆★☆★☆★☆★ FilmService.getFilmList()의 filmTotal : " + filmTotal);
		int lastPage = (int)Math.ceil((double)filmTotal/ rowPerPage);
		log.debug("☆★☆★☆★☆★ FilmService.getFilmList()의 lastPage : " + lastPage);
		List<Map<String, Object>> filmList = filmMapper.selectFilmList(pageMap); // 페이징 변수까지 담아서 filmList 정의 및 mapper 호출
		log.debug("☆★☆★☆★☆★ FilmService.getFilmList()의 filmList : " + filmList);
		
		// controller에서 사용하기 위한 map
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("filmList", filmList);
		returnMap.put("categoryNameList", categoryNameList);
		returnMap.put("page", page); // beginRow, rowPerPage
		returnMap.put("lastPage", lastPage);
		returnMap.put("category", category);
		returnMap.put("price", price);
		returnMap.put("rating", rating);
		returnMap.put("title", title);
		returnMap.put("actors", actors);

		return returnMap;
	}
	
	// 영화 상세보기 액션
	public Map<String, Object> getFilmOne(int filmId) {
		// 디버깅
		log.debug("☆★☆★☆★☆★ FilmService.getFilmOne()의 filmId : " + filmId);
		
		// mapper 호출 (filmOn)
		Map<String, Object> filmOne = filmMapper.selectFilmOne(filmId);
		log.debug("☆★☆★☆★☆★ FilmService.getFilmOne()의 filmOne : " + filmOne);
		
		// mapper 호출 (stock)
		// store1
		Map<String, Object> store1Map = new HashMap<>();
		store1Map.put("filmId", filmId);
		store1Map.put("storeId", 1);
		
		int store1Count = 0;
		store1Map.put("stock", store1Count);
		List<Integer> store1Stock = filmMapper.selectFilmInStock(store1Map);
		log.debug("☆★☆★☆★☆★ FilmService.getFilmOne()의 store1Map : " + store1Map);
		log.debug("☆★☆★☆★☆★ FilmService.getFilmOne()의 store1Stock : " + store1Stock);
		
		// store2
		Map<String, Object> store2Map = new HashMap<>();
		store2Map.put("filmId", filmId);
		store2Map.put("storeId", 2);
		
		int store2Count = 0;
		store2Map.put("stock", store2Count);
		List<Integer> store2Stock = filmMapper.selectFilmInStock(store2Map);
		log.debug("☆★☆★☆★☆★ FilmService.getFilmOne()의 store2Map : " + store2Map);
		log.debug("☆★☆★☆★☆★ FilmService.getFilmOne()의 store2Stock : " + store2Stock);
		
		
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("store1Stock", store1Map.get("store1Count"));
		returnMap.put("store2Stock", store2Map.get("store2Count"));
		returnMap.put("filmOne", filmOne);
		
		return returnMap;
	}
}
