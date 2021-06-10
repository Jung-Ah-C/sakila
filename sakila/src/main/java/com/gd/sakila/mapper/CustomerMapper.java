package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.CustomerList;

@Mapper
public interface CustomerMapper {
	int updateCustomerActiveByScheduler();
	List<CustomerList> selectCustomerList(Map<String, Object> map);
	int selectCustomerTotal(String searchWord);
	List<Map<String, Object>> selectBlackCustomerList();
	Map<String, Object> selectCustomerOne(Integer customerId);
	List<Map<String, Object>> selectRentalList(Map<String, Object> map);
	int selectCustomerRentalTotal(Integer customerId);
}
