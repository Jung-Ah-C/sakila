package com.gd.sakila.service;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gd.sakila.mapper.BoardfileMapper;
import com.gd.sakila.vo.Boardfile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class BoardfileService {
	@Autowired BoardfileMapper boardfileMapper;
	
	// 파일 추가 액션
	public int addBoardfile(MultipartFile multipartFile, int boardId) {
		// 1) 물리적 파일 저장
		File temp = new File("");
		// 프로젝트 경로
		String path = temp.getAbsolutePath();
		// 확장자
		int p = multipartFile.getOriginalFilename().lastIndexOf("."); // .을 기준으로 파일명 끝까지 저장 (확장자명), 정수로 저장됨
		String ext = multipartFile.getOriginalFilename().substring(p); // p를 기준으로 끝까지 자름 -> 확장자명
		
		String prename = UUID.randomUUID().toString().replace("-", ""); // 랜덤 이름에서 -부분을 없애줌
		File file = new File(path+"\\src\\main\\webapp\\resource\\"+prename+ext);
		try {
			multipartFile.transferTo(file); // multipart안의 파일을 빈 file로 복사함
		} catch (Exception e) {
			throw new RuntimeException(); // runtime 예외를 따로 처리
		}
		
		// 2) DB 저장
		Boardfile boardfile = new Boardfile();
		boardfile.setBoardId(boardId);
		boardfile.setBoardfileName(prename+ext);
		boardfile.setBoardfileSize(multipartFile.getSize());
		boardfile.setBoardfiletype(multipartFile.getContentType());
		
		int row = boardfileMapper.insertBoardfile(boardfile);
		
		return row;
	}
	
	// 파일 삭제 액션 (선택한 파일 삭제, 전체 X)
	public int removeBoardfileOne(Boardfile boardfile) {
		log.debug("removeBoardfileOne()의 boardfile : " + boardfile); // 뷰에서 받아온 param 확인
		
		// 1) 물리적 파일 삭제
		File temp = new File("");
		String path = temp.getAbsolutePath();
		File file = new File(path+"\\src\\main\\webapp\\resource"+boardfile.getBoardfileName());
		if(file.exists()) { // 파일이 존재한다면
			log.debug("removeBoardfileOne()의 if문 실행됨");
			file.delete(); // 파일을 삭제함
		}
		
		// 2) DB 삭제
		int row = boardfileMapper.deleteBoardfileOne(boardfile.getBoardfileId());
		log.debug("삭제 성공시 1, 삭제 실패는 0 : " + row);
		
		return row;
	}
}
