package com.gd.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Address;
import com.gd.sakila.vo.City;
import com.gd.sakila.vo.Country;

@Mapper
public interface AddressMapper {
	List<Country> selectCountry();
	List<City> selectCity(Integer countryId);
	int addCustomerAddress(Address address);
}
