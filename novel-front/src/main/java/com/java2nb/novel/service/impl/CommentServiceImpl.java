package com.java2nb.novel.service.impl;

import com.java2nb.novel.mapper.SayingMapper;
import com.java2nb.novel.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.java2nb.novel.vo.FirstLevelComment;
import com.java2nb.novel.vo.SecondLevelComment;
import com.java2nb.novel.mapper.FirstLevelCommentMapper;
import com.java2nb.novel.mapper.SecondLevelCommentMapper;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private FirstLevelCommentMapper firstLevelCommentMapper;
	
	@Autowired
	private SecondLevelCommentMapper secondLevelCommentMapper;

	@Autowired
	private SayingMapper sayingMapper;

	@Override
	public void addFlcComment(FirstLevelComment firstLevelComment) {
		firstLevelCommentMapper.insertFlcComment(firstLevelComment);
	}

	@Override
	public void removeFlcComment(int commentId, int sayingId) {

		firstLevelCommentMapper.deleteFlcComment(commentId, sayingId);
	}

	@Override
	public void addSlcComment(SecondLevelComment secondLevelComment) {
		secondLevelCommentMapper.insertSlcComment(secondLevelComment);
	}

	@Override
	public void removeSlcComment(int commentId, int sayingId) {
		secondLevelCommentMapper.deleteSlcComment(sayingId, commentId);
	}



}
