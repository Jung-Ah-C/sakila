package com.gd.sakila.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Comment;

@Mapper
public interface CommentMapper {
	int addComment(Comment comment);
	int deleteCommentByCommentId(int commentId);
	int deleteCommentByBoardId(int boardId);
	List<Comment> selectCommentListByBoard(int boardId);
}
