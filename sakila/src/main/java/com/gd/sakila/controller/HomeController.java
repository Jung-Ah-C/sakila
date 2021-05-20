package com.gd.sakila.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.sakila.service.StaffService;
import com.gd.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;

@Slf4j // 컴파일 시에 logger를 자동으로 만들어줌 (Logger 변수를 선언할 필요가 없어짐)
@Controller
public class HomeController {
	@Autowired StaffService staffService;
	
	// Logger log = LoggerFactory.getLogger(this.getClass()); // (HomeController.class)
	@GetMapping({"/", "/home", "/index"}) // 매핑 주소 배열로 잡을 수 있음 (여러개 설정할 시에)
	public String home() {
		// System.out.println("home...");
		log.debug("test"); // 디버깅할 때 system.println.out() 대신 쓸 수 있음
		return "home";
	}
	
	@GetMapping("/admin/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public String login(HttpSession session, Staff staff) { // servlet 세션을 직접 사용, 컨트롤러 메서드의 매개변수는 DI대상
		log.debug("▶▶▶▶▶ login() param staff :"+staff);
		
		Staff loginStaff = staffService.login(staff);
		log.debug("▶▶▶▶▶ login() return loginStaff :"+loginStaff);
		
		if(loginStaff != null) { // 로그인 실패
			
			session.setAttribute("loginStaff", loginStaff); 
		} 
		return "redirect:/";
	}
}
