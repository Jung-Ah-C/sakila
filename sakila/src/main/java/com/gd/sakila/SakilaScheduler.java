package com.gd.sakila;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.gd.sakila.service.CustomerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SakilaScheduler {
	@Autowired CustomerService customerService;
	
	// Scheduled 메서드 void 반환, 매개변수는 없음
	@Scheduled(cron = "0 0 0 1 * *") // 매달 1일 0시 0분에 스케쥴링이 되어 있는 것, 순서대로 자리는 -> 초 분 시 월 년 요일
	public void modifyCustomerActive() {
		customerService.modifyCustomerActiveByScheduler();
		log.debug("▶▶▶▶▶▶▶ SakilaScheduler.modifyCustomerActive() 스케쥴러 실행 완료");
	}
}
