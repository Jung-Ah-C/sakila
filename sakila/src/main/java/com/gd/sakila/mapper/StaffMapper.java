package com.gd.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Page;
import com.gd.sakila.vo.Staff;
import com.gd.sakila.vo.StaffList;

/*
 * @Component, @Repository, @Service, @Controller --> Bean --> spring.getBean(클래스타입), @AutoWired <-- Dependency Injection (의존성 객체 주입)
 * @Mapper : mybatis의 애노테이션 --> @Repository의 역활 --> 맵퍼+인터페이스 --> 컴파일(?) 시 구현클래스 자동으로 생성
 */

@Mapper // mapper.xml을 찾아서 메서드명과 mapper의 id명의 같으면 합처서 메서드 구현클래스 생성시 오버라이딩을 한다.
public interface StaffMapper {
	Staff selectStaffByLogin(Staff staff);
	List<StaffList> getStaffList(Page page);
	List<StaffList> getStaffOne(int staffId);
}