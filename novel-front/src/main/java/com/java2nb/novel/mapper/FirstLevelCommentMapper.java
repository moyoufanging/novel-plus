package com.java2nb.novel.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.java2nb.novel.vo.FirstLevelComment;

@Mapper
public interface FirstLevelCommentMapper {
	public void insertFlcComment(FirstLevelComment firstLevelComment);
	public void insertsamehobbyFC(FirstLevelComment firstLevelComment);

	public void deleteFlcComment(@Param("commentId") int commentId, @Param("sayingId") int sayingId);

	public void addCommentThumbs(Integer flcid);
	public void addshuyouCommentThumbs(Integer flcid);

}
