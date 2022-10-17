package com.java2nb.novel.controller;


import com.java2nb.novel.core.bean.UserDetails;
import com.java2nb.novel.core.cache.CacheService;
import com.java2nb.novel.core.enums.ResponseStatus;
import com.java2nb.novel.core.utils.RandomValidateCodeUtil;
import com.java2nb.novel.entity.User;
import com.java2nb.novel.entity.UserBuyRecord;
import com.java2nb.novel.mapper.*;
import com.java2nb.novel.service.BookService;
import com.java2nb.novel.service.UserService;
import com.java2nb.novel.vo.BookNextPageBuVO;
import com.java2nb.novel.vo.BookNextPageBuVO1;
import com.java2nb.novel.vo.FirstLevelComment;
import io.github.xxyopen.model.resp.RestResult;
import io.github.xxyopen.web.exception.BusinessException;
import io.github.xxyopen.web.valid.AddGroup;
import io.github.xxyopen.web.valid.UpdateGroup;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.mybatis.dynamic.sql.render.RenderingStrategies;
import org.mybatis.dynamic.sql.select.render.SelectStatementProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.java2nb.novel.mapper.BookDynamicSqlSupport.id;
import static com.java2nb.novel.mapper.UserDynamicSqlSupport.username;
import static org.mybatis.dynamic.sql.SqlBuilder.count;
import static org.mybatis.dynamic.sql.SqlBuilder.isEqualTo;
import static org.mybatis.dynamic.sql.select.SelectDSL.select;

/**
 * @author 11797
 */
@RestController
@RequestMapping("user")
@RequiredArgsConstructor
@Slf4j
public class UserController extends BaseController {

    @Autowired
    private SayingMapper sayingMapper;

    private final CacheService cacheService;

    private final UserService userService;

    private final BookService bookService;
    private final FrontBookNextPageBuMapper bookNextPageBuMapper;
    private final FirstLevelCommentMapper firstLevelCommentMapper;
    private final SecondLevelCommentMapper secondLevelCommentMapper;
    private final UserMapper userMapper;

    /**
     * 登陆
     */
    @PostMapping("login")
    public RestResult<Map<String, Object>> login(User user) {

        //登陆
        UserDetails userDetails = userService.login(user);

        Map<String, Object> data = new HashMap<>(1);
        data.put("token", jwtTokenUtil.generateToken(userDetails));

        return RestResult.ok(data);


    }

    /**
     * 注册
     */
    @PostMapping("register")
    public RestResult<?> register(@Validated({AddGroup.class}) User user, @RequestParam(value = "velCode", defaultValue = "") String velCode) {


        //判断验证码是否正确
        if (!velCode.equals(cacheService.get(RandomValidateCodeUtil.RANDOM_CODE_KEY))) {
            return RestResult.fail(ResponseStatus.VEL_CODE_ERROR);
        }

        //注册
        UserDetails userDetails = userService.register(user);
        Map<String, Object> data = new HashMap<>(1);
        data.put("token", jwtTokenUtil.generateToken(userDetails));

        return RestResult.ok(data);


    }
    /**
     * 注册or登录
     *
     */
    @PostMapping("loginOrRegist") ///user/
//    public RestResult<?> loginOrRegist(@Validated({AddGroup.class}) User user, @RequestParam(value = "velCode", defaultValue = "") String velCode) {
    public RestResult<?> loginOrRegist(Integer bookId,String loginName,String password) {
        User user=new User();
        user.setUsername(loginName);
        user.setPassword(password);
        //查询用户名是否已注册
        SelectStatementProvider selectStatement = select(count(id))
                .from(UserDynamicSqlSupport.user)
                .where(username, isEqualTo(user.getUsername()))
                .build()
                .render(RenderingStrategies.MYBATIS3);
        long count = userMapper.count(selectStatement);
        if (count > 0) {
            //用户名已注册
            //登陆
            UserDetails userDetails = userService.login(user);

            Map<String, Object> data = new HashMap<>(1);
            data.put("token", jwtTokenUtil.generateToken(userDetails));

            return RestResult.ok(data);
        }else{
//            判断验证码是否正确
//            if (!velCode.equals(cacheService.get(RandomValidateCodeUtil.RANDOM_CODE_KEY))) {
//                return RestResult.fail(ResponseStatus.VEL_CODE_ERROR);
//            }

//            注册
            UserDetails userDetails = userService.register(user);
            Map<String, Object> data = new HashMap<>(1);
            data.put("token", jwtTokenUtil.generateToken(userDetails));

            return RestResult.ok(data);

        }




    }
    /**
     * 增加二级 评论的点赞数量
     */
    @PostMapping("addCommentThumbs2")
    public RestResult<?> addCommentThumbs2(Integer slc_id,HttpServletRequest request) {
        //调用update
        secondLevelCommentMapper.addCommentThumbs(slc_id);
        //返回合适的值
        return RestResult.ok();

    }


    /**
     * 增加一级 评论的点赞数量
     */
    @PostMapping("addCommentThumbs")
    public RestResult<?> addCommentThumbs(Integer flc_id,HttpServletRequest request) {
        //调用update
        firstLevelCommentMapper.addCommentThumbs(flc_id);
        //返回合适的值
        return RestResult.ok();

    }
    /**
     * 增加书友圈一级 评论的点赞数量
     */
    @PostMapping("shuyouaddCommentThumbs")
    public RestResult<?> shuyouaddCommentThumbs(Integer flc_id,HttpServletRequest request) {
        //调用update
        firstLevelCommentMapper.addshuyouCommentThumbs(flc_id);
        //返回合适的值
        return RestResult.ok();

    }
    /**
     * 增加书友圈二级 评论的点赞数量
     */
    @PostMapping("shuyouaddCommentThumbs2")
    public RestResult<?> shuyouaddCommentThumbs2(Integer slc_id,HttpServletRequest request) {
        //调用update
        secondLevelCommentMapper.shuyouaddCommentThumbs(slc_id);
        //返回合适的值
        return RestResult.ok();

    }
    /**
     * 刷新token
     */
    @PostMapping("refreshToken")
    public RestResult<?> refreshToken(HttpServletRequest request) {
        String token = getToken(request);
        if (jwtTokenUtil.canRefresh(token)) {
            token = jwtTokenUtil.refreshToken(token);
            Map<String, Object> data = new HashMap<>(2);
            data.put("token", token);
            UserDetails userDetail = jwtTokenUtil.getUserDetailsFromToken(token);
            data.put("username", userDetail.getUsername());
            data.put("nickName", userDetail.getNickName());
            return RestResult.ok(data);

        } else {
            return RestResult.fail(ResponseStatus.NO_LOGIN);
        }

    }

    /**
     * 获取全部的后续章节,下一章
     */

    @GetMapping("getMoreNextPage")
    public void getMoreNextPage(Long bookId, Long pageId, HttpServletRequest request, HttpServletResponse resp)  throws ServletException, IOException {
        BookNextPageBuVO params=new BookNextPageBuVO(pageId,bookId);
        String txt="";
        List<BookNextPageBuVO1> pagesReturn =bookNextPageBuMapper.getMoreNextPage(params);
        if (pagesReturn.size()>0){
            txt = "{ \"pages\" : [";
            for (int i = 0; i < pagesReturn.size()-1; i++) {
                txt=txt+"{\"title\" : \""+pagesReturn.get(i).nextpageName+"\", \"linkurl\" : \""+pagesReturn.get(i).linkUrl+"\",\"id\":\""+pagesReturn.get(i).id+"\",\"thumbsupCount\":\""+pagesReturn.get(i).thumbsupCount+"\"},"; //准备向前端发送的一些数据，以键值对形式
            }
            txt=txt+"{\"title\" : \""+pagesReturn.get(pagesReturn.size()-1).nextpageName+"\", \"linkurl\" : \""+pagesReturn.get(pagesReturn.size()-1).linkUrl+"\",\"id\":\""+pagesReturn.get(pagesReturn.size()-1).id+"\",\"thumbsupCount\":\""+pagesReturn.get(pagesReturn.size()-1).thumbsupCount+"\"} ]}"; //准备向前端发送的一些数据，以键值对形式
            System.out.print(txt);
        }


        //BookNextPageBuVO returndata=new BookNextPageBuVO();
        //String s = "{\"title\" : \""+returndata.GetnextpageName()+"\", \"linkurl\" : \""+returndata.GetlinkUrl()+"\"}"; //准备向前端发送的一些数据，以键值对形式

//        String txt = "{ \"pages\" : ["+
//                "{ \"title\":\"菜鸟教程\" , \"linkurl\":\"www.runoob.com\" },"+
//                "{ \"title\":\"google\" , \"linkurl\":\"www.google.com\" },"+
//                "{ \"title\":\"微博\" , \"linkurl\":\"www.weibo.com\" }      ]}";
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");
        if(txt!=""){
            resp.getWriter().write(txt);                                       //将准备的数据发送出去

        } else {
            resp.getWriter().write("");                                       //将准备的数据发送出去
        }

    }

    /**
     * 查询小说是否已加入书架
     */
    @GetMapping("queryIsInShelf")
    public RestResult<?> queryIsInShelf(Long bookId, HttpServletRequest request) {
        UserDetails userDetails = getUserDetails(request);
        if (userDetails == null) {
            return RestResult.fail(ResponseStatus.NO_LOGIN);
        }
        return RestResult.ok(userService.queryIsInShelf(userDetails.getId(), bookId));
    }

    /**
     * 加入书架
     * */
    @PostMapping("addToBookShelf")
    public RestResult<Void> addToBookShelf(Long bookId,Long preContentId, HttpServletRequest request) {
        UserDetails userDetails = getUserDetails(request);
        if (userDetails == null) {
            return RestResult.fail(ResponseStatus.NO_LOGIN);
        }
        userService.addToBookShelf(userDetails.getId(),bookId,preContentId);
        return RestResult.ok();
    }

    /**
     * 移出书架
     * */
    @DeleteMapping("removeFromBookShelf/{bookId}")
    public RestResult<?> removeFromBookShelf(@PathVariable("bookId") Long bookId, HttpServletRequest request) {
        UserDetails userDetails = getUserDetails(request);
        if (userDetails == null) {
            return RestResult.fail(ResponseStatus.NO_LOGIN);
        }
        userService.removeFromBookShelf(userDetails.getId(),bookId);
        return RestResult.ok();
    }

    /**
     * 分页查询书架
     * */
    @GetMapping("listBookShelfByPage")
    public RestResult<?> listBookShelfByPage(@RequestParam(value = "curr", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "10") int pageSize,HttpServletRequest request) {
        UserDetails userDetails = getUserDetails(request);
        if (userDetails == null) {
            return RestResult.fail(ResponseStatus.NO_LOGIN);
        }
        return RestResult.ok(userService.listBookShelfByPage(userDetails.getId(),page,pageSize));
    }

    /**
     * 分页查询阅读记录
     * */
    @GetMapping("listReadHistoryByPage")
    public RestResult<?> listReadHistoryByPage(@RequestParam(value = "curr", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "10") int pageSize,HttpServletRequest request) {
        UserDetails userDetails = getUserDetails(request);
        if (userDetails == null) {
            return RestResult.fail(ResponseStatus.NO_LOGIN);
        }
        return RestResult.ok(userService.listReadHistoryByPage(userDetails.getId(),page,pageSize));
    }

    /**
     * 添加阅读记录
     * */
    @PostMapping("addReadHistory")
    public RestResult<?> addReadHistory(Long bookId,Long preContentId, HttpServletRequest request) {
        UserDetails userDetails = getUserDetails(request);
        if (userDetails == null) {
            return RestResult.fail(ResponseStatus.NO_LOGIN);
        }
        userService.addReadHistory(userDetails.getId(),bookId,preContentId);
        return RestResult.ok();
    }

    /**
     * 添加反馈
     * */
    @PostMapping("addFeedBack")
    public RestResult<?> addFeedBack(String content, HttpServletRequest request) {
        UserDetails userDetails = getUserDetails(request);
        if (userDetails == null) {
            return RestResult.fail(ResponseStatus.NO_LOGIN);
        }
        userService.addFeedBack(userDetails.getId(),content);
        return RestResult.ok();
    }

    /**
     * 分页查询我的反馈列表
     * */
    @GetMapping("listUserFeedBackByPage")
    public RestResult<?> listUserFeedBackByPage(@RequestParam(value = "curr", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "5") int pageSize, HttpServletRequest request){
        UserDetails userDetails = getUserDetails(request);
        if (userDetails == null) {
            return RestResult.fail(ResponseStatus.NO_LOGIN);
        }
        return RestResult.ok(userService.listUserFeedBackByPage(userDetails.getId(),page,pageSize));
    }

    /**
     * 查询个人信息
     * */
    @GetMapping("userInfo")
    public RestResult<?> userInfo(HttpServletRequest request) {
        UserDetails userDetails = getUserDetails(request);
        if (userDetails == null) {
            return RestResult.fail(ResponseStatus.NO_LOGIN);
        }
        return RestResult.ok(userService.userInfo(userDetails.getId()));
    }

    /**
     * 更新个人信息
     * */
    @PostMapping("updateUserInfo")
    public RestResult<?> updateUserInfo(@Validated({UpdateGroup.class}) User user, HttpServletRequest request) {
        UserDetails userDetails = getUserDetails(request);
        if (userDetails == null) {
            return RestResult.fail(ResponseStatus.NO_LOGIN);
        }
        userService.updateUserInfo(userDetails.getId(),user);
        if(user.getNickName() != null){
            userDetails.setNickName(user.getNickName());
            Map<String, Object> data = new HashMap<>(1);
            data.put("token", jwtTokenUtil.generateToken(userDetails));
            return RestResult.ok(data);
        }
        return RestResult.ok();
    }



    /**
     * 更新密码
     * */
    @PostMapping("updatePassword")
    public RestResult<?> updatePassword(String oldPassword,String newPassword1,String newPassword2,HttpServletRequest request) {
        UserDetails userDetails = getUserDetails(request);
        if (userDetails == null) {
            return RestResult.fail(ResponseStatus.NO_LOGIN);
        }
        if(!(StringUtils.isNotBlank(newPassword1) && newPassword1.equals(newPassword2))){
            RestResult.fail(ResponseStatus.TWO_PASSWORD_DIFF);
        }
        userService.updatePassword(userDetails.getId(),oldPassword,newPassword1);
        return RestResult.ok();
    }

    /**
     * 分页查询用户书评
     * */
    @GetMapping("listCommentByPage")
    public RestResult<?> listCommentByPage(@RequestParam(value = "curr", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "5") int pageSize,HttpServletRequest request) {
        UserDetails userDetails = getUserDetails(request);
        if (userDetails == null) {
            return RestResult.fail(ResponseStatus.NO_LOGIN);
        }
        return RestResult.ok(bookService.listCommentByPage(userDetails.getId(),null,page,pageSize));
    }


    /**
     * 购买小说章节
     * */
    @PostMapping("buyBookIndex")
    public RestResult<?> buyBookIndex(UserBuyRecord buyRecord, HttpServletRequest request) {
        UserDetails userDetails = getUserDetails(request);
        if (userDetails == null) {
            return RestResult.fail(ResponseStatus.NO_LOGIN);
        }
        buyRecord.setBuyAmount(bookService.queryBookIndex(buyRecord.getBookIndexId()).getBookPrice());
        userService.buyBookIndex(userDetails.getId(),buyRecord);
        return RestResult.ok();
    }







}
