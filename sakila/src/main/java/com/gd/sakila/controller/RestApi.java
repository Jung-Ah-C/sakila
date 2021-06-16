package com.gd.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.mapper.AddressMapper;
import com.gd.sakila.vo.City;
import com.gd.sakila.vo.Country;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController // Spring MVC Controller에 @ResponseBody가 추가된 것 -> Json 형태로 객체 데이터를 반환
@RequestMapping("/admin")
public class RestApi { // select 값을 전달해주기 위해 restController가 필요한 맵핑만 모아서 메소드화
	@Autowired AddressMapper addressMapper;
	@GetMapping("/country")
	public List<Country> getCountryList() {
		return addressMapper.selectCountry();
	}
	
	@GetMapping("/city")
	public List<City> getCityList(
			@RequestParam(value="countryId", required = true) Integer countryId) {
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ AddressRestController.getCityList의 countryId : " + countryId);
		return addressMapper.selectCity(countryId);
	}
}
