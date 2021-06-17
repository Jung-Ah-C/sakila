package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RentalMapper {
	void insertRental(Map<String, Object> map);
	void insertRentalPayment(Map<String, Object> map);
	List<Map<String, Object>> selectFilmTitle();
	List<Integer> selectInventoryForRental(Map<String, Object> map);
}
