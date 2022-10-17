package com.java2nb.novel.service;

import com.java2nb.novel.vo.CommentNumVO;
import com.java2nb.novel.vo.Saying;

public interface SayingService {

	public Saying QueryOneSaying(CommentNumVO newcomment);
	
	public void modifySayingLikes(int id, String likes);

	public  void selectTest(int id);

}