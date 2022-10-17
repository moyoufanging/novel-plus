package com.java2nb.novel.mapper;

import com.java2nb.novel.entity.Book;
import com.java2nb.novel.vo.AuthorShuyouVO;
import com.java2nb.novel.vo.BookSpVO;
import com.java2nb.novel.vo.BookVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Administrator
 */
public interface FrontBookMapper extends BookMapper {

    void updateisAlonePossess(Book book);
    List<BookVO> searchByPage(BookSpVO params);

    void addVisitCount(@Param("bookId") Long bookId, @Param("visitCount") Integer visitCount);

    List<Book> listRecBookByCatId(@Param("catId") Integer catId);

    void addCommentCount(@Param("bookId") Long bookId);

    Long getBookAuthorId(Long bookId);
    Long getUserAuthorId(Long user_id);
    List<Book> queryNetworkPicBooks(@Param("localPicPrefix") String localPicPrefix, @Param("limit") Integer limit);

    /**
     * 按评分随机查询小说集合
     * @param limit 查询条数
     * @return 小说集合
     * */
    List<Book> selectIdsByScoreAndRandom(@Param("limit") int limit);
    void updateShuyouquanHtml(AuthorShuyouVO params);
    String getShuyouquanHtml(Long bookId);
    void  setShuyouquanHtml();
    //在书籍的信息页面获取作者的image头像
    String getAuhorImage(Long bookId);
}
