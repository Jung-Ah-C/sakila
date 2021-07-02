package com.gd.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.InventoryMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class InventoryService {
	@Autowired InventoryMapper inventoryMapper;
	
	// 재고 추가 메서드
	public int addInventory(Map<String, Object> map) {
		log.debug("ㅇㅇㅇㅇㅇ InventoryService.addInventory map : " + map.toString());
		return inventoryMapper.insertInventory(map);
	}
	
	// 재고 목록 메서드
	public List<Map<String, Object>> getInventoryList(Map<String, Object> map) {
		log.debug("ㅇㅇㅇㅇㅇ InventoryService.getInventoryList의 map : " + map.toString());
		return inventoryMapper.selectInventoryList(map);
	}
	
	// 재고 데이터 전체 개수 (페이징)
	public int getInventoryTotal(Map<String, Object> map) {
		log.debug("ㅇㅇㅇㅇㅇ InventoryService.getInventoryTotal의 map : " + map.toString());
		return inventoryMapper.selectInventoryTotal(map);
	}
}
