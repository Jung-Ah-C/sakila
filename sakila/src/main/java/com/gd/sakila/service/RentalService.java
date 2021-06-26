package com.gd.sakila.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.RentalMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class RentalService {
	@Autowired RentalMapper rentalMapper;
	
	// 반납 진행
	public void addReturn(Map<String, Object> map) {
		// 매개변수 디버깅
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RentalService.addReturn의 map : " + map.toString());
		
		// 1. rental 테이블에 return_date 업데이트 하기
		int updateReturnDate = rentalMapper.updateReturnDateByRentalId(map);
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RentalService.addReturn의 updateReturnDate : " + updateReturnDate);
		
		// 2. payment 테이블에 연체료가 포함해서 amount 업데이트 하기
		int updatePayment = rentalMapper.updatePaymentByRentalId(map);
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RentalService.addReturn의 updatePayment : " + updatePayment);
	}
	
	// 대여 진행
	public void addRental(Map<String, Object> map) {
		// 매개변수 디버깅
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RentalService.addRental의 map : " + map.toString());
		
		// 1. rental 테이블에 insert
		int addRental = rentalMapper.insertRental(map);
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RentalService.addRental의 addRental : " + addRental);
		
		// 2. payment 테이블에 insert (amount는 쿼리에서 처리)
		int addRentalPayment = rentalMapper.insertRentalPayment(map);
		log.debug("ㅇㅇㅇㅇㅇㅇㅇ RentalService.addRental의 addRentalPayment : " + addRentalPayment);
	}
}
