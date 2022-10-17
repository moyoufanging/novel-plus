package com.java2nb.novel.mapper;

import com.java2nb.novel.entity.Book;
import com.java2nb.novel.vo.BookNextPageBuVO;
import com.java2nb.novel.vo.BookNextPageBuVO1;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;
import org.mybatis.dynamic.sql.util.SqlProviderAdapter;

import javax.annotation.Generated;
import java.util.List;
public interface FrontBookNextPageBuMapper extends BookMapper{
    int addNextPagevo(BookNextPageBuVO params);
    List<BookNextPageBuVO1> getMoreNextPage(BookNextPageBuVO params);

    int updateCommentNum(Long id); //id 直接就是下一章计数的id

}
