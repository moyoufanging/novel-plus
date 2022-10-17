package com.java2nb.novel.controller;

import com.java2nb.novel.core.bean.AuthourAccountDetails;
import com.java2nb.novel.core.utils.ThreadLocalUtil;
import com.java2nb.novel.entity.*;
import com.java2nb.novel.mapper.AuthorMapper;
import com.java2nb.novel.mapper.AuthorMapper2;
import com.java2nb.novel.mapper.FrontBookNextPageBuMapper;
import com.java2nb.novel.service.UserService;
import io.github.xxyopen.model.page.PageBean;

import com.java2nb.novel.core.bean.UserDetails;
import com.java2nb.novel.core.enums.ResponseStatus;
import io.github.xxyopen.model.resp.RestResult;
import io.github.xxyopen.web.exception.BusinessException;
import com.java2nb.novel.service.AuthorService;
import com.java2nb.novel.service.BookService;
import io.github.xxyopen.web.valid.UpdateGroup;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 11797
 * 实现mobile一套网页的访问问题
 */
@Slf4j
@RequiredArgsConstructor
@Controller
public class MobileController extends BaseController{
    private final UserService userService;

    /**
     * mobile的login部分
     * */
    @RequestMapping("user/login.html")
    public String login()
    {
        return ThreadLocalUtil.getTemplateDir()+"user/login";
    }
    //访问mobile下的文件 /mobile/user/userinfo.html

}
