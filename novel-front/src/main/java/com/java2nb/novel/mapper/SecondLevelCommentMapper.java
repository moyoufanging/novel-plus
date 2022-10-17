package com.java2nb.novel.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.java2nb.novel.vo.SecondLevelComment;

@Mapper
public interface SecondLevelCommentMapper {

	public int insertSlcComment(SecondLevelComment secondLevelComment);
	public int insertsamehobbySC(SecondLevelComment secondLevelComment);
	public void deleteSlcComment(@Param("sayingId") int sayingId, @Param("commentId") int commentId);

	public void addCommentThumbs(Integer slcid);
	public void shuyouaddCommentThumbs(Integer slcid);
}
