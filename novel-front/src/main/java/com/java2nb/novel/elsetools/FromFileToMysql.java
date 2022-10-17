package com.java2nb.novel.elsetools;
import java.util.List;
import java.util.Map;
import com.java2nb.novel.core.bean.AuthourAccountDetails;
import com.java2nb.novel.entity.*;
import com.java2nb.novel.mapper.AuthorMapper;
import com.java2nb.novel.mapper.AuthorMapper2;
import com.java2nb.novel.mapper.FrontBookMapper;
import com.java2nb.novel.mapper.FrontBookNextPageBuMapper;
import com.java2nb.novel.vo.AuthorShuyouVO;
import io.github.xxyopen.model.page.PageBean;

import com.java2nb.novel.core.bean.UserDetails;
import com.java2nb.novel.core.enums.ResponseStatus;
import io.github.xxyopen.model.resp.RestResult;
import io.github.xxyopen.web.exception.BusinessException;
import com.java2nb.novel.service.AuthorService;
import com.java2nb.novel.service.BookService;
import io.github.xxyopen.web.valid.UpdateGroup;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import com.java2nb.novel.entity.Author;
import com.java2nb.novel.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

public class FromFileToMysql
{
    static BookService bookService;

    public static void main(String[] args) throws IOException
    {


        int line_num = 0;
        Byte by0=0;
        String returnlines="";
        String firstlines="";
        //BufferedReader是可以按行读取文件
        FileInputStream inputStream = new FileInputStream("/home/woa/programme/novelWeb/pythonTool/xuanji2/001.txt.org");
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));

        String str = null;
        while((str = bufferedReader.readLine()) != null)
        {
            line_num+=1;
            if (line_num != 1){
                returnlines+=str;

            }else{
                firstlines=str;
            }


        }
        System.out.println(firstlines);
        System.out.println("----------------------------------");
        System.out.println(returnlines);
        //向数据库添加内容
        /**
         * INSERT INTO `novel`.`book_index` (`id`, `book_id`, `index_num`, `index_name`, `word_count`, `is_vip`, `book_price`, `storage_type`, `create_time`, `update_time`) VALUES
         * ('1563422377730269184', '18', '0', '中国社会各阶级的分析', '5857', '0', '29', 'db', '2022-08-27 15:05:16', '2022-08-27 15:06:44');
         */

//        content = content.replaceAll("\\n\\n", "<br>");

        bookService.addBookContent(18L,"ceshi","ceshi2",by0,8L);
        //close
        inputStream.close();
        bufferedReader.close();

    }


}
