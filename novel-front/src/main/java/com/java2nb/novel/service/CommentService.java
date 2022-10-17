package com.java2nb.novel.service;

import com.java2nb.novel.vo.FirstLevelComment;
import com.java2nb.novel.vo.SecondLevelComment;

public interface CommentService {
	
	public void addFlcComment(FirstLevelComment firstLevelComment);
	
	public void removeFlcComment(int commentId, int sayingId);
	
	public void addSlcComment(SecondLevelComment secondLevelComment);
	
	public void removeSlcComment(int commentId, int sayingId);


}
