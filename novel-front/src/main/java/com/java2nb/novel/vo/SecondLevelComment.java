package com.java2nb.novel.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class SecondLevelComment {
	private Integer id;
	private Integer sayingId;
	private Integer bookId;
	private Long pageId;
	private Integer lineId;
	private Integer flcId;
	private String replier;
	private String toCommenter;
	private String replyContent;
	private Integer thumpsup2;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	private Date replyTime;
	private FirstLevelComment flc;
	
	public SecondLevelComment() {
		this.replyTime = new Date();
	}

	public FirstLevelComment getFlc() {
		return flc;
	}

	public void setFlc(FirstLevelComment flc) {
		this.flc = flc;
	}

	public Integer getSayingId() {
		return sayingId;
	}

	public void setSayingId(Integer sayingId) {
		this.sayingId = sayingId;
	}
	public  void setBookId(int bookId){this.bookId=bookId;}

	public Integer getBookId(){return this.bookId;}


	public  void setPageId(Long pageId){this.pageId=pageId;}
	public  void setPageId(String pageId){this.pageId=Long.parseLong(pageId);}

	public Long getPageId(){return this.pageId;}


	public  void setLineId(Integer lineId){this.lineId=lineId;}

	public Integer getLineId(){return this.lineId;}
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getFlcId() {
		return flcId;
	}
	
	public void setFlcId(Integer flcId) {
		this.flcId = flcId;
	}
	
	public String getReplier() {
		return replier;
	}
	
	public void setReplier(String replier) {
		this.replier = replier;
	}
	
	public String getToCommenter() {
		return toCommenter;
	}
	
	public void setToCommenter(String toCommenter) {
		this.toCommenter = toCommenter;
	}
	
	public String getReplyContent() {
		return replyContent;
	}
	
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	
	public Date getReplyTime() {
		return replyTime;
	}
	
	public void setReplyTime(Date replyTime) {
		this.replyTime = replyTime;
	}
	public Integer getThumpsup(){return this.thumpsup2;}
	public Integer setThumpsup(Integer thumpsup){return this.thumpsup2=thumpsup;}
	@Override
	public String toString() {
		return "SecondLevelComment [id=" + id + ", sayingId=" + sayingId + ", bookId=" + bookId+ ", thumpsup2="+thumpsup2+", pageId=" + pageId+ ", lineId=" + lineId+", flcId=" + flcId + ", replier=" + replier
				+ ", toCommenter=" + toCommenter + ", replyContent=" + replyContent + ", replyTime=" + replyTime + "]";
	}
}
