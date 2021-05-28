package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CategoryMapper;
import com.gd.sakila.mapper.FilmMapper;
import com.gd.sakila.vo.Category;
import com.gd.sakila.vo.Film;
import com.gd.sakila.vo.FilmForm;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j // 디버깅
@Service // 서비스의 객체를 만들어줌
@Transactional // spring에는 트랜잭션 기능이 있음. 어떤 메서드를 실행하다가 오류가 발생하면, 그 서비스 롤백함(취소)
public class FilmService {
	@Autowired FilmMapper filmMapper;
	@Autowired CategoryMapper categoryMapper;
	
	/*
	 * param :film입력폼
	 * return : 입력된 filmId값
	 */
	
	// CategoryService.class로 이동해야 함
	public List<Category> getCategoryList() {
		return categoryMapper.selectCategoryList();
	}
	
	// 영화 추가
	public int addFilm(FilmForm filmForm) {
		Film film = filmForm.getFilm(); // filmForm에 있는 값을 다시 가공
		filmMapper.insertFilm(film); // filmId가 생성된 후, film.setFilmId() 호출
		
		// film_category에 영화 추가를 하기 위해서 film_id와 category_id 변수 가공
		Map<String, Object> map = new HashMap<>();
		map.put("categoryId", filmForm.getCategory().getCategoryId());
		map.put("filmId", film.getFilmId());
		
		// mapper 호출
		filmMapper.insertFilmCategory(map);
		
		return film.getFilmId();
	}
	
	// 영화 상세보기에서 영화 배우 목록 삭제 및 추가
	public void modifyFilmActorListByFilm(Map<String, Object> paramMap) {
		log.debug("☆★☆★☆★☆★ FilmService.modifyFilmActorListByFilm()의 paramMap : " + paramMap);
		// 배우 목록 삭제
		int filmId = (int)paramMap.get("filmId");
		int removeRow = filmMapper.removeFilmActorListByFilm(filmId);
		log.debug("☆★☆★☆★☆★ FilmService.modifyFilmActorListByFilm()의 removeRow : " + removeRow);
		
		// 배우 목록 추가
		if(paramMap.get("actorId") != null) {
			int[] actorId = (int[]) paramMap.get("actorId");

			for (int i : actorId) {
				log.debug("☆★☆★☆★☆★ FilmService.modifyFilmActorListByFilm() 반복문의 actorId : " + i);
				int insertRow = filmMapper.insertFilmActorListByFilm(i,filmId);
				log.debug("☆★☆★☆★☆★ FilmService.modifyFilmActorListByFilm()의 insertRow : " + insertRow);
			}
		}
	}
	
	// 영화 상세보기 영화 배우 목록 출력
	public List<Map<String, Object>> getFilmActorListByFilm(int filmId) {
		log.debug("☆★☆★☆★☆★ FilmService.getFilmActorListByFilm()의 filmId : " + filmId);
		return filmMapper.selectFilmActorListByFilm(filmId);
	}
	
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
		List<Category> categoryNameList = categoryMapper.selectCategoryList();
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
	
	// 영화 상세보기 액션 (재고 출력 버그 있음)
	public Map<String, Object> getFilmOne(int filmId) {
		// 디버깅
		log.debug("☆★☆★☆★☆★ FilmService.getFilmOne()의 filmId : " + filmId);
		
		// mapper 호출 (filmOne)
		Map<String, Object> filmOne = filmMapper.selectFilmOne(filmId);
		log.debug("☆★☆★☆★☆★ FilmService.getFilmOne()의 filmOne : " + filmOne);
		
		// mapper 호출 (stock)
		// store1
		Map<String, Object> store1Map = new HashMap<>();
		store1Map.put("filmId", filmId);
		store1Map.put("storeId", 1);
		
		int store1Count = 0;
		store1Map.put("store1Count", store1Count);
		List<Integer> store1Stock = filmMapper.selectFilmInStock(store1Map);
		log.debug("☆★☆★☆★☆★ FilmService.getFilmOne()의 store1Map : " + store1Map);
		log.debug("☆★☆★☆★☆★ FilmService.getFilmOne()의 store1Stock : " + store1Stock);
		
		// store2
		Map<String, Object> store2Map = new HashMap<>();
		store2Map.put("filmId", filmId);
		store2Map.put("storeId", 2);
		
		int store2Count = 0;
		store2Map.put("store2Count", store2Count);
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
