package com.gd.sakila.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.mapper.AddressMapper;
import com.gd.sakila.mapper.RentalMapper;
import com.gd.sakila.service.RentalService;
import com.gd.sakila.vo.City;
import com.gd.sakila.vo.Country;
import com.gd.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController // Spring MVC Controller에 @ResponseBody가 추가된 것 -> Json 형태로 객체 데이터를 반환
public class RestApi { // select 값을 전달해주기 위해 restController가 필요한 맵핑만 모아서 메소드화
	@Autowired AddressMapper addressMapper;
	@Autowired RentalMapper rentalMapper;
	@Autowired RentalService rentalService;
	
	// 반납 버튼 클릭 시 view에서 data (서비스 호출에 필요한 매개변수들) 값 가져오고 service 실행
	@PostMapping("/return")
	public String addReturn(@RequestBody Map<String, Object> map) {
		// 매개변수 디버깅
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RestApi.addReturn의 map : " + map.toString());
		
		// 서비스 호출
		rentalService.addReturn(map);
		
		return "getCustomerOne";
	}
	
	// Rental에서 선택한 영화 제목의 inventoryId 목록
	@GetMapping("/inventory")
	public List<Integer> getFilmInventory(
			@RequestParam(value="filmId", required = true) int filmId,
			HttpSession session) {
		// 매개변수 디버깅
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RestApi.getFilmInventory의 filmId : " + filmId);
		
		// storeId 값 session에서 받아오기
		Staff loginStaff = (Staff)session.getAttribute("loginStaff");
		int storeId = loginStaff.getStoreId();
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RestApi.getFilmInventory의 storeId : " + storeId);
		
		// filmId 값에 따른 전체 inventory 가져오기
		List<Map<String, Object>> inventoryListByFilmId = rentalMapper.selectInventoryIdByFilmId(filmId);
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RestApi.getFilmInventory의 inventoryListByFilmId : " + inventoryListByFilmId.toString());
		
		// 해당 storeId와 대여 가능한 재고들로만 리스트 작성
		List<Integer> rentableInventoryList = new ArrayList<Integer>();
		for(Map<String, Object> i : inventoryListByFilmId) {
			if((int)i.get("storeId") == storeId && i.get("rentable").equals("T")) {
				rentableInventoryList.add((int)i.get("inventoryId"));
			}
		}
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RestApi.getFilmInventory의 rentableInventoryList : " + rentableInventoryList.toString());
		
		return rentableInventoryList;
	}
	
	// Rental에서 영화 제목을 선택할 때
	@GetMapping("/filmTitle")
	public List<Map<String, Object>> getFilmTitleList() {
		return rentalMapper.selectFilmTitle();
	}
	
	@GetMapping("/country")
	public List<Country> getCountryList() {
		return addressMapper.selectCountry();
	}
	
	@GetMapping("/city")
	public List<City> getCityList(
			@RequestParam(value="countryId", required = true) Integer countryId) {
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RestApi.getCityList의 countryId : " + countryId);
		return addressMapper.selectCity(countryId);
	}
}
