package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.FilmList;
import com.gd.sakila.vo.Page;

@Mapper
public interface FilmMapper {
	List<Integer> selectFilmInStock(Map<String, Object> map);
	List<Map<String, Object>> selectFilmList(Map<String, Object> map);
	// int selectFilmTotal(String searchWord);
}
