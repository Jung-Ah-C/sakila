package com.gd.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.mapper.AddressMapper;
import com.gd.sakila.mapper.RentalMapper;
import com.gd.sakila.vo.City;
import com.gd.sakila.vo.Country;
import com.gd.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController // Spring MVC Controller에 @ResponseBody가 추가된 것 -> Json 형태로 객체 데이터를 반환
@RequestMapping("/admin")
public class RestApi { // select 값을 전달해주기 위해 restController가 필요한 맵핑만 모아서 메소드화
	@Autowired AddressMapper addressMapper;
	@Autowired RentalMapper rentalMapper;
	
	// Rental에서 선택한 영화 제목의 inventoryId 목록
	@GetMapping("/inventory")
	public List<Integer> getFilmInventory(
			@RequestParam(value="filmId", required = true) int filmId,
			HttpSession session) {
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RestApi.getFilmInventory의 filmId : " + filmId);
		
		// storeId 값 session에서 받아오기
		Staff loginStaff = (Staff)session.getAttribute("loginStaff");
		int storeId = loginStaff.getStoreId();
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RestApi.getFilmInventory의 storeId : " + storeId);
		
		return ;
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
