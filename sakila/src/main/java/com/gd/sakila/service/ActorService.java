package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.ActorMapper;
import com.gd.sakila.vo.Actor;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ActorService {
	@Autowired ActorMapper actorMapper;
	// 배우 추가 액션
	public int addActor(Actor actor) {
		log.debug("☆★☆★☆★☆★ ActorService.addActor()의 actor : " + actor);
		return actorMapper.insertActor(actor);
	}
	
	// 배우 목록 액션
	public Map<String, Object> getActorList(Map<String, Object> paramMap) {
		// 디버깅
		log.debug("☆★☆★☆★☆★ ActorService.getActorList()의 currentPage : " + paramMap.get("currentPage"));
		log.debug("☆★☆★☆★☆★ ActorService.getActorList()의 rowPerPage : " + paramMap.get("rowPerPage"));
		log.debug("☆★☆★☆★☆★ ActorService.getActorList()의 searchWord : " + paramMap.get("searchWord"));
		
		// 변수 정의
		int currentPage = (int)paramMap.get("currentPage");
		int rowPerPage = (int)paramMap.get("rowPerPage");
		String searchWord = (String)paramMap.get("searchWord");
		
		// 페이징
		Page page = new Page();
		page.setBeginRow((currentPage-1)*rowPerPage);
		page.setRowPerPage(rowPerPage);
		page.setSearchWord(searchWord);
		
		// 페이징을 위해 데이터 전체 개수 파악하는 메서드
		int actorTotal = actorMapper.selectActorTotal(paramMap);
		log.debug("☆★☆★☆★☆★ ActorService.getActorList()의 actorTotal : " + actorTotal);
		int lastPage = (int)Math.ceil((double)actorTotal/ rowPerPage);
		log.debug("☆★☆★☆★☆★ ActorService.getActorList()의 lastPage : " + lastPage);
		
		List<Map<String, Object>> actorList = actorMapper.selectActorInfoList(page);
		log.debug("☆★☆★☆★☆★ ActorService.getActorList()의 actorList : " + actorList);
		
		// controller에서 호출하기 위한 returnMap 설정
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("actorList", actorList);
		returnMap.put("page", page); // currentPage, rowPerPage, searchWord
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
	}
}
