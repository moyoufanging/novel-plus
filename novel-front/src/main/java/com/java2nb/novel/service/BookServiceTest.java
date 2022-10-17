package com.java2nb.novel.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.java2nb.novel.core.cache.CacheKey;
import com.java2nb.novel.core.cache.CacheService;
import com.java2nb.novel.core.config.BookPriceProperties;
import com.java2nb.novel.core.enums.ResponseStatus;
import com.java2nb.novel.vo.*;
import io.github.xxyopen.web.util.BeanUtil;
import com.java2nb.novel.core.utils.Constants;
import com.java2nb.novel.core.utils.StringUtil;
import com.java2nb.novel.entity.Book;
import com.java2nb.novel.entity.*;
import com.java2nb.novel.mapper.*;
import com.java2nb.novel.service.AuthorService;
import com.java2nb.novel.service.BookService;
import com.java2nb.novel.service.FileService;
import com.java2nb.novel.service.SearchService;
import io.github.xxyopen.model.page.PageBean;
import io.github.xxyopen.model.page.builder.pagehelper.PageBuilder;
import io.github.xxyopen.util.IdWorker;
import io.github.xxyopen.web.exception.BusinessException;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.mybatis.dynamic.sql.SortSpecification;
import org.mybatis.dynamic.sql.render.RenderingStrategies;
import org.mybatis.dynamic.sql.select.render.SelectStatementProvider;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.orderbyhelper.OrderByHelper;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static com.java2nb.novel.mapper.BookCategoryDynamicSqlSupport.bookCategory;
import static com.java2nb.novel.mapper.BookCommentDynamicSqlSupport.bookComment;
import static com.java2nb.novel.mapper.BookContentDynamicSqlSupport.bookContent;
import static com.java2nb.novel.mapper.BookContentDynamicSqlSupport.content;
import static com.java2nb.novel.mapper.BookDynamicSqlSupport.*;
import static com.java2nb.novel.mapper.BookIndexDynamicSqlSupport.bookIndex;
import static org.mybatis.dynamic.sql.SqlBuilder.*;
import static org.mybatis.dynamic.sql.select.SelectDSL.select;
import com.java2nb.novel.mapper.FrontBookNextPageBuMapper;
import com.java2nb.novel.vo.BookNextPageBuVO;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class BookServiceTest {
    FrontBookNextPageBuMapper bookNextPageBuMapper;

    @Test
    void addnextPage1() {
        long novel_id=12;
        long book_id=11;
        String link_url="https://blog.csdn.net/kern_/article/details/115673129";
        String nextpage_name="test";
        String nextpage_desc="test";
        Integer thumbsup_count=1;
        Integer reply_count=15;
        BookNextPageBuVO params=new BookNextPageBuVO(novel_id,book_id,link_url,nextpage_name,nextpage_desc,thumbsup_count,reply_count);
        bookNextPageBuMapper.addNextPagevo(params);
    }
    public void addnextPage1(long novel_id,long book_id,String link_url,String nextpage_name,String nextpage_desc,Integer thumbsup_count,Integer reply_count){

    }
}