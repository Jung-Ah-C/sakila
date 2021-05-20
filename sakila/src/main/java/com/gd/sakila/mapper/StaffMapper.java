package com.gd.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Staff;

/*
 * @Componetn, @Repository, @Service, @Controller --> Bean --> spring.getBean(클래스타입), @AutoWired <-- Dependecy Injection
 * @Mapper : mybatis의 애노테이션 --> @Repository의 역활 --> 맵퍼+인터페이스 --> 컴파일(?) 시 구현클래스 자동으로 생성
 */

@Mapper // mapper.xml을 찾아서 메서드명과 mapper의 id명의 같으면 합처서 메서드 구현클래스 생성시 오버라이딩을 한다.
public interface StaffMapper {
	Staff selectStaffByLogin(Staff staff);
}