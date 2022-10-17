package com.java2nb.novel.mapper;

import com.java2nb.novel.vo.CommentNumVO;
import com.java2nb.novel.vo.FirstLevelComment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.java2nb.novel.vo.Saying;

@Mapper
public interface SayingMapper {
	
	public Saying selectOneById(CommentNumVO newcomment);
	public Saying selectSameHobbycommentById(CommentNumVO newcomment);

	public void updateLikesById(@Param("id") int id, @Param("likes") String likes);
	public int selectTest(@Param("id") int id);

	public Long  getLineCommentNum(FirstLevelComment params);
	public void updateCommentNum(FirstLevelComment params);
	public void insertCommentNum(CommentNumVO params);

}
