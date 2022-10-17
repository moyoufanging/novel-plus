package com.java2nb.novel.service.impl;

import com.java2nb.novel.service.SayingService;
import com.java2nb.novel.vo.CommentNumVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.java2nb.novel.vo.Saying;
import com.java2nb.novel.mapper.SayingMapper;

@Service
public class SayingServiceImpl implements SayingService {
	
	@Autowired
    private SayingMapper sayingMapper;
	
	@Override
	public Saying QueryOneSaying(CommentNumVO newcomment) {
		return sayingMapper.selectOneById(newcomment);
	}

	@Override
	public void modifySayingLikes(int id, String likes) {
		sayingMapper.updateLikesById(id, likes);
	}

	public void selectTest(int id){
		sayingMapper.selectTest(id);
	}
}
