package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.StaffMapper;
import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.Page;
import com.gd.sakila.vo.Staff;
import com.gd.sakila.vo.StaffList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class StaffService {
	@Autowired StaffMapper staffMapper; // DI, @AutoWired 없으면 --> NullPoiintException 발생...
	// staff 로그인 메서드
	public Staff login(Staff staff) {
		log.debug("login() param staff : " + staff);
		
		return staffMapper.selectStaffByLogin(staff); // null or staff객체
	}
	
	// staff 목록 메서드
	public List<StaffList> getStaffList(String searchWord) {
		// page 객체 생성, searchWord 복사
		Page page = new Page();
		page.setSearchWord(searchWord);
		log.debug("▶▶▶▶▶▶ StaffService.getStaffList의 page : " + page);
		
		// DAO 호출
		List<StaffList> staffList = staffMapper.getStaffList(page); // Page 필요
		log.debug("▶▶▶▶▶▶ StaffService.getStaffList의 staffList : " + staffList);
		
		return staffList;
	}
}