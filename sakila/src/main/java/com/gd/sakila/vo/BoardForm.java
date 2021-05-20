package com.gd.sakila.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardForm {
	private Board board;
	private List<MultipartFile> boardfile; // 파일 형식에 상관없이 첨부하면 다 받을 수 있게 해주는 라이브러리, 파일이 여러개라면 배열이나 리스트로 받을 수 있음
}
