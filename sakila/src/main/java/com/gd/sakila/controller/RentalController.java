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
	
	// 반납 버튼 클릭 시 view에서 data (서비스 호출에 필요한 매개변수들) 값 가져오고 service 실행
	@PostMapping("/addReturn")
	public String addReturn(@RequestParam(value="filmId", required = true) int filmId,
							@RequestParam(value="rentalId", required = true) int rentalId,
							@RequestParam(value="overdue", required = true) int overdue,
							@RequestParam(value="customerId", required = true) int customerId) {
		// 디버깅
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RentalController.addReturn의 filmId : " + filmId);
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RentalController.addReturn의 rentalId : " + rentalId);
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RentalController.addReturn의 overdue : " + overdue);
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RentalController.addReturn의 customerId : " + customerId);
		
		// 매개변수 가공
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("filmId", filmId);
		paramMap.put("rentalId", rentalId);
		paramMap.put("overdue", overdue);
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RentalController.addReturn의 param : " + paramMap.toString()); // 디버깅
		
		// 서비스 호출
		rentalService.addReturn(paramMap);
		
		return "redirect:/admin/getCustomerOne?customerId="+customerId;
	}
		
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
