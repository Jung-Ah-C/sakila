package com.gd.sakila.vo;

import lombok.Data;

@Data // getter, setter 생성해주는 어노테이션
public class FilmList {
	private int FID;
	private String title;
	private String description;
	private String category;
	private double price;
	private int length;
	private String rating;
	private String actors;
}
