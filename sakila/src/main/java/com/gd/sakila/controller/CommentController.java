package com.gd.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.CommentService;
import com.gd.sakila.vo.Comment;

import lombok.extern.slf4j.Slf4j;

@Slf4j // logger 객체 자동 생성
@Controller // controller 객체가 있는지 탐색
@RequestMapping("/admin") // 클래스 위에 매핑을 설정할 때는 RequestMapping을 사용해야 함 (get, post 방식 모두 받음)
public class CommentController {
	@Autowired // 생성된 객체가 있다면 자동 주입 (nullpointException 발생 예방)
	CommentService commentService;
	
	// 댓글 추가
	@GetMapping("/addComment")
	public String addComment(Comment comment, @RequestParam(value="boardId", required = true) int boardId) {
		log.debug("@@@@@@@ addComment()의 boardId : " + boardId);
		log.debug("@@@@@@@ addComment()의 comment : " + comment.toString()); // 디버깅
		
		comment.setBoardId(boardId);
		
		int commentRow = commentService.addComment(comment);
		log.debug("@@@@@@@ addComment()의 commentRow : " + commentRow); // 디버깅
		
		return "redirect:/getBoardOne?boardId=" + boardId; // 재요청
	}
	
	// 댓글 삭제
	@GetMapping("/deleteCommentByCommentId")
	public String deleteCommentByCommentId(@RequestParam(value="commentId", required = true) int commentId,
											@RequestParam(value="boardId", required = true) int boardId) {
		// 디버깅
		log.debug("@@@@@@@ deleteCommentByCommentId()의 boardId" + boardId);
		log.debug("@@@@@@@ deleteCommentByCommentId()의 commentId" + commentId);
		
		int commentRow = commentService.deleteCommentByCommentId(commentId);
		log.debug("@@@@@@@ deleteCommentByCommentId()의 commentRow : " + commentRow);
		
		return "redirect:/getBoardOne?boardId=" + boardId; // 재요청
	}
}
