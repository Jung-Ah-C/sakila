package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CategoryMapper;
import com.gd.sakila.mapper.FilmMapper;
import com.gd.sakila.vo.FilmList;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class FilmService {
	@Autowired FilmMapper filmMapper;
	@Autowired CategoryMapper categoryMapper;
	
	// 영화 목록 액션
	public Map<String, Object> getFilmList(String categoryName) {
		log.debug("☆★☆★☆★☆★ FilmService.getFilmList()의 categoryName : " + categoryName);
		Map<String, Object> paramMap = new HashMap<>();
	      paramMap.put("categoryName", categoryName);
	      
	      List<Map<String, Object>> filmList = filmMapper.selectFilmList(paramMap);
	      List<String> categoryNameList = categoryMapper.selectCategoryNameList();
	      Map<String, Object> returnMap = new HashMap<>();
	      
	      returnMap.put("filmList", filmList);
	      returnMap.put("categoryNameList", categoryNameList);
	      
	      return returnMap;
	}
}
