package com.gd.sakila.vo;

import lombok.Data;

@Data // getter, setter는 lombok을 이용해서 만듦
public class Country {
	private int countryId;
	private String country;
	private String lastUpdate;
}
