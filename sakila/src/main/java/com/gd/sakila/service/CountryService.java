package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CountryMapper;
import com.gd.sakila.vo.Country;
import com.gd.sakila.vo.Page;

@Service // CountryService 객체를 만들 때, countryMapper 객체가 있는지 먼저 확인해줌
@Transactional // 트랜잭션을 처리함, rollback 기능을 처리해줌
public class CountryService {
	@Autowired // 해당 클래스의 객체가 존재한다면, 그 객체가 자동으로 주입됨 (그래서 콘솔창에 null pointer exception이 안남)
			   // 여기서의 객체는 의존성 객체라고 불림, 그리고 이 과정을 DI(Dependency Injection)이라고 부름
	private CountryMapper countryMapper; // 인터페이스 사용
	public Map<String, Object> getCountryList(int currentPage, int rowPerPage) {
		// 1. 컨트롤러에서 보내준 매개값(파라미터)을 가공함
		int beginRow = (currentPage-1) * rowPerPage;
		Page pageParam = new Page();
		pageParam.setBeginRow(beginRow);
		pageParam.setRowPerPage(rowPerPage);
		
		// 2. dao 호출
		List<Country> list = countryMapper.selectCountryList(pageParam);
		int total = countryMapper.selectCountryTotal();
		
		// 3. dao의 반환값을 가공
		int lastPage = total / rowPerPage;
		if(total % rowPerPage != 0) {
			lastPage += 1;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("lastPage", lastPage);
		return map;
	}
}