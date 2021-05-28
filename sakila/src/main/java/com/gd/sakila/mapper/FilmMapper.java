package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Film;

@Mapper
public interface FilmMapper {
	List<Integer> selectFilmInStock(Map<String, Object> map);
	List<Map<String, Object>> selectFilmList(Map<String, Object> map);
	int selectFilmTotal(Map<String, Object> map);
	Map<String, Object> selectFilmOne(int filmId);
	List<Map<String,Object>> selectFilmActorListByFilm(int filmId);
	int removeFilmActorListByFilm(int filmId);
	int insertFilmActorListByFilm(int actorId, int filmId);
	
	int insertFilm(Film film);
	int insertFilmCategory(Map<String, Object> map);
}
