package com.gd.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CustomerMapper;
import com.gd.sakila.vo.CustomerList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CustomerService {
	@Autowired CustomerMapper customerMapper;
	// 휴면 고객 처리 액션
	public void modifyCustomerActiveByScheduler() {
		log.debug("▶▶▶▶▶▶▶ modifyCustomerActiveByScheduler() 실행");
		int row = customerMapper.updateCustomerActiveByScheduler();
		log.debug("▶▶▶▶▶▶▶ modifyCustomerActiveByScheduler() 휴면고객 처리 행 수 : " + row);
	}
	
	// 고객 목록 액션
	public List<CustomerList> getCustomerList(Map<String, Object> map) {
		return customerMapper.selectCustomerList(map);
	}
	
	// 고객 데이터 개수 (customerTotal)
	public int selectCustomerTotal(String searchWord) {
		return customerMapper.selectCustomerTotal(searchWord);
	}
	
	// 블랙리스트 고객 목록 액션
	public List<Map<String, Object>> getBlackCustomerList() {
		return customerMapper.selectBlackCustomerList();
	}
	
	// 고객 상세보기 액션
	public Map<String, Object> getCustomerOne(Integer customerId) {
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ CustomerService.getCustomerOne의 customerId : " + customerId);
		return customerMapper.selectCustomerOne(customerId);
	}
	
	// 고객 상세보기의 대여리스트 액션
	public List<Map<String, Object>> getCustomerRentalList(Integer customerId) {
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ CustomerService.getCustomerRentalList의 customerId : " + customerId);
		return customerMapper.selectRentalList(customerId);
	}
	
	// 고객 상세보기의 대여리스트 데이터 개수 (CustomerRentalTotal)
	public int selectCustomerRentalTotal() {
		return customerMapper.selectCustomerRentalTotal();
	}
}