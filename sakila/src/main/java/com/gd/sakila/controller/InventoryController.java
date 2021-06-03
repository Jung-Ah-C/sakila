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

import com.gd.sakila.service.InventoryService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class InventoryController {
	@Autowired InventoryService inventoryService;
	
	// 재고 목록 맵핑
	@GetMapping("/getInventoryList")
	public String getInventoryList (Model model, 
									@RequestParam(value = "storeId", required = false) Integer storeId,
									@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
									@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
									@RequestParam(value = "searchWord", required = false) String searchWord) {
		// 매개변수 디버깅
		log.debug("ㅇㅇㅇㅇㅇ InventoryController.getInventoryList의 storeId : " + storeId);
		log.debug("ㅇㅇㅇㅇㅇ InventoryController.getInventoryList의 currentPage : " + currentPage);
		log.debug("ㅇㅇㅇㅇㅇ InventoryController.getInventoryList의 rowPerPage : " + rowPerPage);
		log.debug("ㅇㅇㅇㅇㅇ InventoryController.getInventoryList의 searchWord : " + searchWord);
		
		// storeId 전처리
		if(storeId != null && storeId == 0) {
			storeId = null;
		}
		
		// 페이징 매개변수 가공
		int beginRow = (currentPage - 1) * rowPerPage;
		log.debug("ㅇㅇㅇㅇㅇ InventoryController.getInventoryList의 beginRow : " + beginRow);
		
		// 서비스에 필요한 매개변수 map에 담기
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("storeId", storeId);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		// 페이징을 위한 서비스 호출 및 매개변수 가공
		int inventoryTotal = inventoryService.getInventoryTotal(paramMap);
		log.debug("ㅇㅇㅇㅇㅇ InventoryController.getInventoryList의 inventoryTotal : " + inventoryTotal);
		
		int lastPage = (int)Math.ceil((double)inventoryTotal/rowPerPage);
		log.debug("ㅇㅇㅇㅇㅇ InventoryController.getInventoryList의 lastPage : " + lastPage);
		
		// 서비스 호출
		List<Map<String, Object>> inventoryList = inventoryService.getInventoryList(paramMap);
		log.debug("ㅇㅇㅇㅇㅇ InventoryController.getInventoryList의 inventoryList.size() : " + inventoryList.size());
		
		// 모델에 담기
		model.addAttribute("inventoryList", inventoryList);
		model.addAttribute("storeId", storeId);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("beginRow", beginRow);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", lastPage);
		
		return "getInventoryList";
	}
}
