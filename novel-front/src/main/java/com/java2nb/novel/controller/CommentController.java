package com.java2nb.novel.controller;

import com.java2nb.novel.mapper.SayingMapper;
import com.java2nb.novel.service.CommentService;
import com.java2nb.novel.vo.CommentNumVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.java2nb.novel.vo.FirstLevelComment;
import com.java2nb.novel.vo.SecondLevelComment;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RequestMapping("/comment")
@RestController
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	@Autowired
	private SayingMapper sayingMapper;
	
	@RequestMapping(value="/add/first", method=RequestMethod.POST)
    public FirstLevelComment addFirstLevelCommment(FirstLevelComment firstLevelComment) {
		firstLevelComment.setSayingId(1);
//		System.out.print("---------------------------------CommentController.java----------------------nowBug---\n");
		//System.out.print("---firstLevelComment---"+firstLevelComment.getBookId()+"\n");
		commentService.addFlcComment(firstLevelComment);
		//准备增加对应行数的评论数量的值
		if(sayingMapper.getLineCommentNum(firstLevelComment)==null){
			//插入
			CommentNumVO newcom=new CommentNumVO(
					firstLevelComment.getPageId(),
					firstLevelComment.getBookId(),
					firstLevelComment.getLineId(),
					1);
			sayingMapper.insertCommentNum(newcom);
		}else {
			//增加
			sayingMapper.updateCommentNum(firstLevelComment);
		}
		return firstLevelComment;
    }
	
	@RequestMapping(value="/delete/first/{sayingId}/{commentId}")
    public void removeFirstLevelCommment(@PathVariable int sayingId, @PathVariable int commentId) {

		commentService.removeFlcComment(commentId, sayingId);
    }
	
	@RequestMapping(value="/add/second", method=RequestMethod.POST)
    public SecondLevelComment addSecondLevelCommment(SecondLevelComment secondLevelComment) {
		commentService.addSlcComment(secondLevelComment);
		System.out.println(secondLevelComment);
		FirstLevelComment firstLevelComment=new FirstLevelComment(
				secondLevelComment.getPageId(),
				secondLevelComment.getBookId(),
				secondLevelComment.getLineId());
		//增加对应comment的行评论数量
		sayingMapper.updateCommentNum(firstLevelComment);

		return secondLevelComment;
    }
	
	@RequestMapping(value="/delete/second/{sayingId}/{commentId}")
    public void removeSecondLevelCommment(@PathVariable int sayingId, @PathVariable int commentId) {
		commentService.removeSlcComment(commentId, sayingId);
    }
	/**
	 * 用于修改line后面显示的评论数量
	 */

	@GetMapping("getLineCommentNum")
	public void getLineCommentNum(Integer bookId, Long pageId, int lineMaxNum, HttpServletRequest request, HttpServletResponse resp)  throws ServletException, IOException {
		//根据行，进行读取
		System.out.print("成功访问");
		String txt="";

		FirstLevelComment firstLevelComment=new FirstLevelComment(pageId,bookId,1);
		txt = "{ \"lineNums\" : [";
		for(int i=1;i<lineMaxNum;i++){
			firstLevelComment.setLineId(i);

			if(sayingMapper.getLineCommentNum(firstLevelComment)!=null){
				//写入数字
				//txt=txt+"\""+sayingMapper.getLineCommentNum(firstLevelComment)+",\""; //准备向前端发送的一些数据，以键值对形式
				txt=txt+sayingMapper.getLineCommentNum(firstLevelComment)+","; //准备向前端发送的一些数据，以键值对形式

			}else{
				//写入0
				txt=txt+"0,"; //准备向前端发送的一些数据，以键值对形式

			}
		}
		txt=txt+"0]}";
		//txt=txt+"{\"title\" : \""+pagesReturn.get(pagesReturn.size()-1).nextpageName+"\", \"linkurl\" : \""+pagesReturn.get(pagesReturn.size()-1).linkUrl+"\"} ]}"; //准备向前端发送的一些数据，以键值对形式
		//System.out.print("----------------------txt-----------------\n");
		//System.out.print(txt+"\n");



		//BookNextPageBuVO returndata=new BookNextPageBuVO();
		//String s = "{\"title\" : \""+returndata.GetnextpageName()+"\", \"linkurl\" : \""+returndata.GetlinkUrl()+"\"}"; //准备向前端发送的一些数据，以键值对形式

//		txt = "{ \"lineNums\" : ["+
//				"0,"+
//				"1,"+
//				"2 ]}";
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("application/json; charset=utf-8");
		if(txt!=""){
			resp.getWriter().write(txt);                                       //将准备的数据发送出去

		} else {
			resp.getWriter().write("");                                       //将准备的数据发送出去
		}

	}



}