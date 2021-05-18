package com.gd.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CommentMapper;
import com.gd.sakila.vo.Comment;

import lombok.extern.slf4j.Slf4j;

@Slf4j // logger 객체 자동 생성
@Service // spring이 생성한 CommentService 객체가 있는지 탐색 (자동생성)
@Transactional // 예외처리를 자동으로 해줌 (트랜잭션 기능)
public class CommentService {
	// 생성된 객체 자동 주입
	@Autowired CommentMapper commentMapper;
	
	// addComment 메소드
	public int addComment(Comment comment) {
		log.debug("▶▶▶▶▶▶ addComment()의 comment : " + comment.toString()); // 디버깅
		return commentMapper.addComment(comment);
	}
	
	// deleteCommentByCommentId 메소드
	public int deleteCommentByCommentId(int commentId) {
		log.debug("▶▶▶▶▶▶ deleteCommentByCommentId() param : " + commentId); // 디버깅
		return commentMapper.deleteCommentByCommentId(commentId);
	}
}
