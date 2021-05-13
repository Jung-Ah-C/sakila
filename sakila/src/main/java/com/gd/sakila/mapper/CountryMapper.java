package com.gd.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Country;
import com.gd.sakila.vo.Page;

@Mapper
// @Mapper의 역할 : CountryMapper의 서브클래스 생성, 서브 클래스의 객체를 생성해줌
public interface CountryMapper {
	List<Country> selectCountryList(Page pageParam);
	int selectCountryTotal(); // 페이징에 활용하기 위해서 전체 행 개수 변수를 생성
}