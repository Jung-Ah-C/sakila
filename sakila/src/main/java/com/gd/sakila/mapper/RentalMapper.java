package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RentalMapper {
	int insertRental(Map<String, Object> map);
	int insertRentalPayment(Map<String, Object> map);
	List<Map<String, Object>> selectFilmTitle();
	List<Map<String, Object>>selectInventoryIdByFilmId(int filmId);
	int updateReturnDateByRentalId(Map<String, Object> map);
	int updatePaymentByRentalId(Map<String, Object> map);
}
