package com.gd.sakila.vo;

import lombok.Data;

@Data
public class Boardfile {
	private int boardfileId;
	private int boardId;
	private String boardfileName;
	private String boardfiletype;
	private long boardfileSize;
}