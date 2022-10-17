package com.java2nb.novel.controller;

import com.java2nb.novel.mapper.SayingMapper;
import com.java2nb.novel.service.SayingService;
import com.java2nb.novel.vo.CommentNumVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.java2nb.novel.vo.Saying;

@RequestMapping("/saying")
@RestController
public class SayingController {
	@Autowired
	private SayingMapper sayingMapper;
	@Autowired
	private SayingService sayingService;
	
	@RequestMapping("/get/comment/{id}/{bookId}/{pageId}/{lineId}")
    public Saying showCommment(@PathVariable(value="id") Integer id,
							   @PathVariable(value = "bookId") Integer bookId,
							   @PathVariable(value = "pageId") long pageId,
							   @PathVariable(value = "lineId") Integer lineId) {
		CommentNumVO newcomment=new CommentNumVO(id,pageId,bookId,lineId,0);
		//System.out.print("----------------sayingService.QueryOneSaying(id)-------------------\n");
		//System.out.print(sayingService.QueryOneSaying(newcomment)+"\n");
		return sayingService.QueryOneSaying(newcomment);
    }
	@RequestMapping("/get/SameHobbycomment/{id}/{bookId}/{lineId}")
	public Saying showSameHobbycomment(@PathVariable(value="id") Integer id,
							   @PathVariable(value = "bookId") Integer bookId,
							   @PathVariable(value = "lineId") Integer lineId) {
		CommentNumVO newcomment=new CommentNumVO(id,0L,bookId,lineId,0);
		//System.out.print("----------------sayingService.QueryOneSaying(id)-------------------\n");
		//System.out.print(sayingService.QueryOneSaying(newcomment)+"\n");
		return sayingMapper.selectSameHobbycommentById(newcomment);
	}
	@RequestMapping(value="/likes", method=RequestMethod.POST)
    public void changeLikes(@RequestParam int id, @RequestParam String likes) {
		sayingService.modifySayingLikes(id, likes);
    }

	@RequestMapping(value="/test", method=RequestMethod.GET)
	public void test() {
		int id=1;
		sayingService.selectTest(id);

	}
}
