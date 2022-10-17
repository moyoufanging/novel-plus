package com.java2nb.novel.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.java2nb.novel.core.serialize.CommentUserNameSerialize;
import com.java2nb.novel.entity.BookComment;
import lombok.Data;

import java.util.Date;

/**
 * @author 11797
 */
@Data
public class AuthorShuyouVO {

    private String ShuyouquanContent;

    private Long bookId;

}

