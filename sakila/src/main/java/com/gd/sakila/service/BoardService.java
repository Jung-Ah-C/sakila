package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.BoardMapper;
import com.gd.sakila.mapper.CommentMapper;
import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.Page;
import com.gd.sakila.vo.Comment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service // spring이 생성한 객체가 있는지 확인해줌
@Transactional
public class BoardService {
	// 생성된 객체가 자동으로 주입됨
	@Autowired BoardMapper boardMapper;
	@Autowired CommentMapper commentMapper;
	
	// modifyBoard 메소드
	public int modifyBoard(Board board) {
		log.debug("modifyBoard() param : " + board.getBoardId());
		return boardMapper.updateBoard(board);
	}
	
	// removeBoard 메소드
	public int removeBoard(Board board) {
		log.debug("removeBoard() param : "+board.toString()); // 디버깅 (해쉬코드 출력)
		return boardMapper.deleteBoard(board);
	}
	
	// addBoard 메소드
	public int addBoard(Board board) {
		return boardMapper.insertBoard(board);
	}
	
	// getBoardOne, 1) 상세보기 + 2) 댓글목록, 수정 폼
	public Map<String, Object> getBoardOne (int boardId) {
		// 1) 상세보기
		Map<String, Object> boardMap = boardMapper.selectBoardOne(boardId);
		log.debug("boardMap : " + boardMap);
		
		// 2) 댓글목록
		List<Comment> commentList = commentMapper.selectCommentListByBoard(boardId);
		log.debug("commentlist size() : " + commentList.size());
		
		// 상세보기와 댓글목록을 map에 저장
		Map<String, Object> map = new HashMap<>();
		map.put("boardMap", boardMap);
		map.put("commentList", commentList);
		return map;
	}
	
	// getBoardList 메소드
	public Map<String, Object> getBoardList(int currentPage, int rowPerPage, String searchWord) {
		// 1. 변수 가공
		int boardTotal = boardMapper.selectBoardTotal(searchWord); // searchWord 필요
		int lastPage = (int)(Math.ceil((double)boardTotal / rowPerPage));
		
		// 2. controller에서 넘어온 파라미터 값들을 가공해서 dao에 전달
		Page page = new Page();
		page.setBeginRow((currentPage-1)*rowPerPage);
		page.setRowPerPage(rowPerPage);
		page.setSearchWord(searchWord);
		
		System.out.println("BoardService.getBoardList의 page : " + page);
		
		// 3. dao 호출
		List<Board> boardList = boardMapper.selectBoardList(page); // Page 필요
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lastPage", lastPage);
		map.put("boardList", boardList);
		
		System.out.println("BoardService.getBoardList의 map : " + map.toString());
		
		return map;
	}
}
