package com.java2nb.novel.vo;

import java.util.Date;
import java.util.List;
//对应数据库评论表comments_line_number
public class CommentNumVO {

	private Integer id;
	private Long pageId;
	private Integer bookId;
	private Integer lineId;
	private Integer commentNum;
	public  CommentNumVO(Long  pageId,Integer bookId,Integer lineId,Integer commentNum){
		this.pageId=pageId;
		this.commentNum=commentNum;
		this.lineId=lineId;
		this.bookId=bookId;
	}
	public  CommentNumVO(Integer id,Long  pageId,Integer bookId,Integer lineId,Integer commentNum){
		this.id=id;
		this.pageId=pageId;
		this.commentNum=commentNum;
		this.lineId=lineId;
		this.bookId=bookId;
	}


}