package com.gd.sakila.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Comment;

@Mapper
public interface CommentMapper {
	// comment 추가 메소드 선언
	int addComment(Comment comment);
	
	// comment 삭제 메소드 선언
	int deleteCommentByCommentId(int commentId);
	
	// 게시글 삭제 시에 comment 삭제 메소드 선언
	int deleteCommentByBoardId(int boardId);
	
	// 해당 boardOne에 맞는 comment 리스트 출력 메소드 선언
	List<Comment> selectCommentListByBoard(int boardId);
}
