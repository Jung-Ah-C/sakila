package com.gd.sakila;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@ServletComponentScan // WebFilter를 사용하기 위해서 (빈을 만들기 위해) 이 annotation을 사용, 기본적으로 com.gd.sakila 안에 있는 것만 스캔함, 특정 범위를 지정할거면 componentScan annotation을 사용해야 함
@EnableScheduling // scheduled라고 되어 있는 빈을 찾아서 특정 시간에 실행시키기 위해서
public class SakilaApplication {

	public static void main(String[] args) {
		SpringApplication.run(SakilaApplication.class, args);
	}

}
