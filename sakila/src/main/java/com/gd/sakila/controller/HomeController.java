package com.gd.sakila.controller;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j // 컴파일 시에 logger를 자동으로 만들어줌 (Logger 변수를 선언할 필요가 없어짐)
@Controller
public class HomeController {
	// Logger log = LoggerFactory.getLogger(this.getClass()); // (HomeController.class)
	@GetMapping({"/", "/home", "/index"}) // 매핑 주소 배열로 잡을 수 있음 (여러개 설정할 시에)
	public String home() {
		// System.out.println("home...");
		log.debug("test"); // 디버깅할 때 system.println.out() 대신 쓸 수 있음
		return "home";
	}
}
