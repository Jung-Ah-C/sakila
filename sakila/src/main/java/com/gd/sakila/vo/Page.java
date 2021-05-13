package com.gd.sakila.vo;

import lombok.Data;

@Data // lombok을 통해서 getter, setter 생성
public class Page { // 페이징을 위한 변수 정의
	private int rowPerPage;
	private int beginRow;
	private String searchWord;
}
