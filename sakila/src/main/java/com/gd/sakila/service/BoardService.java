package com.gd.sakila.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gd.sakila.mapper.BoardMapper;
import com.gd.sakila.mapper.BoardfileMapper;
import com.gd.sakila.mapper.CommentMapper;
import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.BoardForm;
import com.gd.sakila.vo.Boardfile;
import com.gd.sakila.vo.Comment;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j // logger 객체를 만들어줌
@Service // spring이 생성한 BoardService 객체가 있는지 스캔해줌 -> 자동으로 객체 생성
@Transactional // 예외처리 해줌
public class BoardService {
	// spring에 의해 생성된 객체가 자동으로 대입됨
	@Autowired BoardMapper boardMapper;
	@Autowired BoardfileMapper boardfileMapper;
	@Autowired CommentMapper commentMapper;
	
	// modifyBoard 메소드
	public int modifyBoard(Board board) {
		log.debug("▶▶▶▶▶▶ modifyBoard() param : " + board.getBoardId());
		return boardMapper.updateBoard(board);
	}
	
	// removeBoard 메소드
	public int removeBoard(Board board) {
		log.debug("▶▶▶▶▶▶ removeBoard() param : " + board.toString()); // 디버깅 (배열을 출력하기 위해서 toString 메소드 사용)
		
		// 2) 게시글 삭제 (FK board_id 설정하지 않거나, FK delete no action으로 설정)
		int boardRow = boardMapper.deleteBoard(board);
		if(boardRow == 0) { // 삭제가 완료가 안되면 0을 리턴
			return 0;
		}
		
		// 1) 댓글 삭제
		int commentRow = commentMapper.deleteCommentByBoardId(board.getBoardId());
		log.debug("▶▶▶▶▶▶ removeBoard() commentRow : " + commentRow);
		
		log.debug("▶▶▶▶▶▶ removeBoard() boardRow : " + boardRow);
		return boardRow; // 댓글삭제 완료 된 후에 게시글삭제가 실행되기 때문에 리턴값은 boardRow만 확인해도 됨
	}
	
	// addBoard 메소드
	public int addBoard(BoardForm boardForm) {
		// 넘겨 받은 BoardForm 타입을 Board로 변환
		// 1)
		Board board = boardForm.getBoard(); // boardId값이 null인 상태
		log.debug("addBoard()의 board : " + board);
		boardMapper.addBoard(board); // 입력 시 만들어진 key값을 리턴받아야 한다. -> mybatis에 리턴값을 설정할 수 없기 때문에 리턴값을 받을 수 없다.
		// 매개 변수 board의 boardId 값을 변경해준다.
		log.debug("addBoard()의 board : " + board.getBoardId()); // auto increment로 입력된 값
		
		// 2)
		List<MultipartFile> list = boardForm.getBoardfile();
		if(list != null) {
			for(MultipartFile f : list) {
				Boardfile boardfile = new Boardfile();
				boardfile.setBoardId(board.getBoardId()); // auto increment로 입력된 값
				// test.txt -> newname.txt
				String originalFilename = f.getOriginalFilename();
				int p = originalFilename.lastIndexOf("."); // 마지막에 있는 파일 확장자 명을 찾기 위해서 
				String ext = originalFilename.substring(p).toLowerCase(); // .txt
				String prename = UUID.randomUUID().toString().replace("-", ""); // 무작위의 문자열을 만드는 라이브러리
				
				String filename = prename+ext;
				boardfile.setBoardfileName(filename); // 중복으로 인한 덮어쓰기 이슈가 발생함
				boardfile.setBoardfileSize(f.getSize());
				boardfile.setBoardfiletype(f.getContentType());
				log.debug("addBoard()의 boardfile : " + boardfile);
				// 2-1)
				// DB에 입력
				boardfileMapper.insertBoardfile(boardfile);
				
				// 2-2)
				// 파일을 저장
				try {
					f.transferTo(new File("D:\\upload\\"+filename)); // 빈 파일에 f안에 들어있는 파일을 복사함
				} catch (Exception e) {
					throw new RuntimeException(); // 복사하다가 예외가 발생하면 예외처리
				}
			}
		}
		
		
		return boardMapper.addBoard(board);
	}
	
	// getBoardOne, 1) 상세보기 + 2) 댓글목록, 수정 폼
	public Map<String, Object> getBoardOne (int boardId) {
		// 1) 상세보기
		Map<String, Object> boardMap = boardMapper.selectBoardOne(boardId);
		log.debug("▶▶▶▶▶▶ boardMap : " + boardMap);
		
		// 2) 댓글목록
		List<Comment> commentList = commentMapper.selectCommentListByBoard(boardId);
		log.debug("▶▶▶▶▶▶ commentlist size() : " + commentList.size());
		
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
		
		System.out.println("▶▶▶▶▶▶ BoardService.getBoardList의 page : " + page);
		
		// 3. dao 호출
		List<Board> boardList = boardMapper.selectBoardList(page); // Page 필요
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lastPage", lastPage);
		map.put("boardList", boardList);
		
		System.out.println("▶▶▶▶▶▶ BoardService.getBoardList의 map : " + map.toString());
		
		return map;
	}
}
