package com.java2nb.novel.controller;

import com.java2nb.novel.mapper.FirstLevelCommentMapper;
import com.java2nb.novel.mapper.SayingMapper;
import com.java2nb.novel.mapper.SecondLevelCommentMapper;
import com.java2nb.novel.service.CommentService;
import com.java2nb.novel.vo.CommentNumVO;
import com.java2nb.novel.vo.FirstLevelComment;
import com.java2nb.novel.vo.SecondLevelComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
//书友圈,同好区
@RequestMapping("/samehobby")
@RestController
public class SameHobbyController {
	
	@Autowired
	private CommentService commentService;
	@Autowired
	private SayingMapper sayingMapper;
	@Autowired
	private FirstLevelCommentMapper firstLevelCommentMapper;
	@Autowired
	private SecondLevelCommentMapper secondLevelCommentMapper;

	//添加第一层评论
	@RequestMapping(value="/add/first", method=RequestMethod.POST)
    public FirstLevelComment addFirstLevelCommment(FirstLevelComment firstLevelComment) {
		firstLevelComment.setSayingId(1);
//		System.out.print("---------------------------------CommentController.java----------------------nowBug---\n");
		//System.out.print("---firstLevelComment---"+firstLevelComment.getBookId()+"\n");
//		commentService.addFlcComment(firstLevelComment);
		firstLevelCommentMapper.insertsamehobbyFC(firstLevelComment);
		return firstLevelComment;
    }

	@RequestMapping(value="/add/second", method=RequestMethod.POST)
	public SecondLevelComment addSecondLevelCommment(SecondLevelComment secondLevelComment) {
		secondLevelCommentMapper.insertsamehobbySC(secondLevelComment);
		return secondLevelComment;
	}




}