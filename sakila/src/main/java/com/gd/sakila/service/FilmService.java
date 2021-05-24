package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.FilmMapper;
import com.gd.sakila.vo.Film;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class FilmService {
	@Autowired FilmMapper filmMapper;
	
	// 영화 목록 액션
	public Map<String, Object> getFilmList(int currentPage, int rowPerPage, String searchWord) {
		// 1. 변수 가공
		int filmTotal = filmMapper.selectFilmTotal(searchWord); // searchWord 필요
		int lastPage = (int)(Math.ceil((double)filmTotal / rowPerPage));
		log.debug("▶▶▶▶▶▶▶ FilmService.getFilmList의 filmTotal : " + filmTotal);
		log.debug("▶▶▶▶▶▶▶ FilmService.getFilmList의 lastPage : " + lastPage);
		
		
		// 2. controller에서 넘어온 파라미터 값들을 가공해서 dao에 전달
		Page page = new Page();
		page.setBeginRow((currentPage-1)*rowPerPage);
		page.setRowPerPage(rowPerPage);
		page.setSearchWord(searchWord);
		log.debug("▶▶▶▶▶▶▶ FilmService.getFilmList의 page : " + page);
		
		// 3. dao 호출
		List<Film> filmList = filmMapper.selectFilmList(page); // Page 필요
		
		Map<String, Object> filmMap = new HashMap<String, Object>();
		filmMap.put("lastPage", lastPage);
		filmMap.put("filmList", filmList);
		log.debug("▶▶▶▶▶▶▶ FilmService.getFilmList의 map : " + filmMap.toString());
		
		return filmMap;
	}
	
	// 영화 상세보기 액션
	// map <-- film, filmCount
	public Map<String, Object> getFilmOne(int filmId, int storeId) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("filmId", filmId);
		paramMap.put("storeId", storeId);
		int filmCount = 0;
		paramMap.put("filmCount", filmCount);
		List<Integer> list = filmMapper.selectFilmInStock(paramMap); // filmCount를 입력해주면, mapper 쿼리가 실행되면서 filmCount 값이 출력됨
		log.debug("▶▶▶▶▶▶▶ FilmService.getFlimOne()의 filmCount : " + paramMap.get("filmCount"));
		log.debug("▶▶▶▶▶▶▶ FilmService.getFilmOne()의 list : " + list);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		return returnMap;
	}
}
