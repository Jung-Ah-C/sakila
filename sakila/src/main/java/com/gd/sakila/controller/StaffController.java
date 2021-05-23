package com.gd.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.StaffService;
import com.gd.sakila.vo.Page;
import com.gd.sakila.vo.StaffList;

import lombok.extern.slf4j.Slf4j;

@Slf4j // logger (디버깅) 객체를 자동 생성
@Controller // controller의 객체가 만들어졌는지 찾음
@RequestMapping("/admin") // 클래스 위에 매핑을 설정할 때는 RequestMapping을 사용해야 함 (get, post 방식 모두 받음)
public class StaffController {
	@Autowired StaffService staffService;
	
	// staff 목록 맵핑
	@GetMapping("/getStaffList")
	public String getStaffList(Model model, @RequestParam(value="searchWord", required = false) String searchWord) {
		// param 디버깅
		log.debug("getStaffList()의 searchWord : " + searchWord); // 디버깅
		
		// 서비스 호출
		List<StaffList> staffList = staffService.getStaffList(searchWord);
		log.debug("getStaffList()의 staffList : " + staffList);
		
		model.addAttribute("staffList", staffList);
		
		return "getStaffList";
	}
	
	// staff 상세보기 맵핑
	@GetMapping("/getStaffOne")
	public String getStaffOne(Model model, @RequestParam(value="staffId", required = true) int staffId) {
		// param 디버깅
		log.debug("getStaffOne()의 param staffId : " + staffId);
		
		// 서비스 호출
		List<StaffList> staffOne = staffService.getStaffOne(staffId);
		log.debug("getStaffOne()의 staffOne : " + staffOne);
		
		model.addAttribute("staffOne", staffOne);
		
		return "getStaffOne";
	}
}
