package com.gd.sakila.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.RentalService;
import com.gd.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class RentalController {
	@Autowired RentalService rentalService;
	
	@PostMapping("/addRental")
	public String addRental (@RequestParam(value="customerId", required = true) int customerId,
							@RequestParam(value="filmId", required = true) int filmId,
							@RequestParam(value="inventoryId", required = true) int inventoryId,
							HttpSession session) {
		// 매개변수 디버깅
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RentalController.addRental의 customerId : " + customerId);
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RentalController.addRental의 filmId : " + filmId);
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RentalController.addRental의 inventoryId : " + inventoryId);
		
		// session에서 storeId와 staffId 값 가져오기
		Staff loginStaff = (Staff)session.getAttribute("loginStaff");
		
		int storeId = loginStaff.getStoreId();
		int staffId = loginStaff.getStaffId();
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RentalController.addRental의 storeId : " + storeId);
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RentalController.addRental의 staffId : " + staffId);
		
		// 매개변수 map에 담아서 service 메소드 실행
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("customerId", customerId);
		paramMap.put("filmId", filmId);
		paramMap.put("inventoryId", inventoryId);
		paramMap.put("storeId", storeId);
		paramMap.put("staffId", staffId);
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RentalController.addRental의 paramMap : " + paramMap.toString());
		
		// service 메서드 실행
		rentalService.addRental(paramMap);
		
		return "redirect:/admin/getCustomerOne?customerId="+customerId;
	}
}
