package com.java2nb.novel.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;
import java.util.List;

import lombok.Data;


public class FirstLevelComment {
	private Integer id;
	private Integer sayingId;
	private Integer bookId;
	private Long pageId;
	private Integer lineId;
	private String commenter;
	private String avatar;
	private String commentContent;

	private Integer thumpsup;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	private Date commentTime;
	private Saying saying;
	private List<SecondLevelComment> slcs;



	public FirstLevelComment() {
		this.commentTime = new Date();
	}
	public FirstLevelComment(Long pageId,Integer bookId,  Integer lineId){
		this.bookId=bookId;
		this.lineId=lineId;
		this.pageId=pageId;
	}
	
	public List<SecondLevelComment> getSlcs() {
		return slcs;
	}

	public void setSlcs(List<SecondLevelComment> slcs) {
		this.slcs = slcs;
	}

	public Saying getSaying() {
		return saying;
	}

	public void setSaying(Saying saying) {
		this.saying = saying;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSayingId() {
		return sayingId;
	}
	
	public void setSayingId(Integer sayingId) {
		this.sayingId = sayingId;
	}
	
	public String getCommenter() {
		return commenter;
	}
	
	public void setCommenter(String commenter) {
		this.commenter = commenter;
	}
	
	public String getAvatar() {
		return avatar;
	}
	
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	public String getCommentContent() {
		return commentContent;
	}
	
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public  void setBookId(int bookId){this.bookId=bookId;}

	public Integer getBookId(){return this.bookId;}

	public Integer getThumpsup(){return this.thumpsup;}
	public  void setPageId(Long pageId){this.pageId=pageId;}
	public  void setPageId(String pageId){this.pageId=Long.parseLong(pageId);}

	public Long getPageId(){return this.pageId;}


	public  void setLineId(Integer lineId){this.lineId=lineId;}

	public Integer getLineId(){return this.lineId;}
	public Date getCommentTime() {
		return commentTime;
	}
	
	public void setCommentTime(Date commentTime) {
		this.commentTime = commentTime;
	}

	@Override
	public String toString() {
		return "FirstLevelComment [flc_id=" + id + ", sayingId=" + sayingId +",thumpsup="+thumpsup+ ", bookId=" + bookId+ ", pageId=" + pageId+ ", lineId=" + lineId+", commenter=" + commenter
				+ ", avatar=" + avatar + ", commentContent=" + commentContent + ", commentTime=" + commentTime + "]";
	}
}
