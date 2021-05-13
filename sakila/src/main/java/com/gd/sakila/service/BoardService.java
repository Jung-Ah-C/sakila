package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.sakila.mapper.BoardMapper;
import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.Page;

@Service
public class BoardService {
	@Autowired
	BoardMapper boardMapper;
	
	// addBoard 서비스 구현
	public int addBoard(Board board) {
		return boardMapper.insertBoard(board);
	}
	
	// getBoardOne 서비스 구현
	public Map<String, Object> getBoardOne (int boardId) {
		return boardMapper.selectBoardOne(boardId);
	}
	
	// getBoardList 서비스 구현
	public Map<String, Object> getBoardList(int currentPage, int rowPerPage, String searchWord) {
		// 1
		int boardTotal = boardMapper.selectBoardTotal(searchWord); // searchWord 필요
		int lastPage = (int)(Math.ceil((double)boardTotal / rowPerPage));
		
		// 2
		Page page = new Page();
		page.setBeginRow((currentPage-1)*rowPerPage);
		page.setRowPerPage(rowPerPage);
		page.setSearchWord(searchWord);
		List<Board> boardList = boardMapper.selectBoardList(page); // Page 필요
		
		// 3
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lastPage", lastPage);
		map.put("boardList", boardList);
		return map;
	}
}
