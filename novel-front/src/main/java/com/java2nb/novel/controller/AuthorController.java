package com.java2nb.novel.controller;

import com.java2nb.novel.core.bean.AuthourAccountDetails;
import com.java2nb.novel.entity.*;
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
import io.searchbox.strings.StringUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.*;
import java.util.regex.Pattern;

/**
 * @author 11797
 */
@RequestMapping("author")
@RestController
@Slf4j
@RequiredArgsConstructor
public class AuthorController extends BaseController{

    private final AuthorService authorService;

    private final BookService bookService;

    @Autowired
    private         AuthorMapper2 authorMapper;;

    @Autowired
    private FrontBookNextPageBuMapper nextPageBuMapper;
    @Autowired
    private FrontBookMapper frontBookMapper;
    /**
     * 校验笔名是否存在
     * */
    @GetMapping("checkPenName")
    public RestResult<Boolean> checkPenName(String penName){

        return RestResult.ok(authorService.checkPenName(penName));
    }
    /**
     * 写入书友圈的文本
     *
     */
    @PostMapping("setShuyouquanHtml")
    public RestResult<Void> setShuyouquanHtml(Long bookId,String ShuyouquanContent,HttpServletRequest request){

        //Author author = checkAuthor(request);
        AuthorShuyouVO params=new AuthorShuyouVO();
        params.setBookId(bookId);
        params.setShuyouquanContent(ShuyouquanContent);
        //update 书友圈数据库的富文本
        frontBookMapper.updateShuyouquanHtml(params);
        return RestResult.ok();
    }


    /**
     * 作家发布小说分页列表查询
     * */
    @GetMapping("listBookByPage")
    public RestResult<PageBean<Book>> listBookByPage(@RequestParam(value = "curr", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "10") int pageSize , HttpServletRequest request){

        return RestResult.ok(bookService.listBookPageByUserId(getUserDetails(request).getId(),page,pageSize));
    }

    /**
     * 发布小说
     * */
    @PostMapping("addBook")
    public RestResult<Void> addBook(@RequestParam("bookDesc") String bookDesc,Book book,HttpServletRequest request){

        Author author = checkAuthor(request);

        //bookDesc不能使用book对象来接收，否则会自动去掉前面的空格
        book.setBookDesc(bookDesc
                .replaceAll("\\n","<br>")
                .replaceAll("\\s","&nbsp;"));
        //发布小说
        bookService.addBook(book,author.getId(),author.getPenName());
        //frontBookMapper.updateisAlonePossess(book);
        //增加初始的作者圈内容
        return RestResult.ok();
    }



    /**
     * 更新小说状态,上架或下架
     * */
    @PostMapping("updateBookStatus")
    public RestResult<Void> updateBookStatus(Long bookId,Byte status,HttpServletRequest request){
        Author author = checkAuthor(request);

        //更新小说状态,上架或下架
        bookService.updateBookStatus(bookId,status,author.getId());

        return RestResult.ok();
    }



    /**
     * 删除章节
     */
    @DeleteMapping("deleteIndex/{indexId}")
    public RestResult<Void> deleteIndex(@PathVariable("indexId") Long indexId,  HttpServletRequest request) {

        Author author = checkAuthor(request);

        //删除章节
        bookService.deleteIndex(indexId, author.getId());

        return RestResult.ok();
    }

    /**
     * 更新章节名
     */
    @PostMapping("updateIndexName")
    public RestResult<Void> updateIndexName(Long indexId,  String indexName, HttpServletRequest request) {

        Author author = checkAuthor(request);

        //更新章节名
        bookService.updateIndexName(indexId, indexName, author.getId());

        return RestResult.ok();
    }

    /**
     * 实现更多下一章的添加
     * 也就是添加更多的后续章节 链接button
     */
    @PostMapping("addMoreNextPage")
    public RestResult<Void> addMoreNextPage(String pageTitle,String pageLink,Long bookId,Long pageId, HttpServletRequest request) {
        bookService.addnextPage1(pageId,bookId,pageLink,pageTitle,"null",0,0);
        return RestResult.ok();

    }
    /**
     * 更新下一章链接上的点赞数
     */
    @PostMapping("addNextPageThums")
    public RestResult<Void> addNextPageThums(Long pagelinkId, HttpServletRequest request) {
        nextPageBuMapper.updateCommentNum(pagelinkId);
        return RestResult.ok();
    }


        /**
         * 发布章节内容
         */
    @PostMapping("addBookContent")
    public RestResult<Void> addBookContent(Long bookId, String indexName, String content,Byte isVip, HttpServletRequest request) {
        Author author = checkAuthor(request);

//        content = content.replaceAll("\\n\\n", "<br>");
        content = content.replaceAll("\\n\\n", "<br>")
                .replaceAll("\\n", "<br>")
                .replaceAll("\\s", "&nbsp;");
        //发布章节内容
        bookService.addBookContent(bookId, indexName, content,isVip, author.getId());

        return RestResult.ok();
    }


    /**
     * 查询章节内容
     */
    @GetMapping("queryIndexContent/{indexId}")
    public RestResult<String> queryIndexContent(@PathVariable("indexId") Long indexId,  HttpServletRequest request) {

        Author author = checkAuthor(request);

        String content = bookService.queryIndexContent(indexId, author.getId());

        content = content.replaceAll("<br>", "\n")
                .replaceAll("&nbsp;", " ");

        return RestResult.ok(content);
    }

    /**
     * 更新章节内容
     */
    @PostMapping("updateBookContent")
    public RestResult<Void> updateBookContent(Long indexId, String indexName, String content, HttpServletRequest request) {
        Author author = checkAuthor(request);

        content = content.replaceAll("\\n\\n", "<br>")
                .replaceAll("\\n", "<br>")
                .replaceAll("\\s", "&nbsp;");
        //更新章节内容
        bookService.updateBookContent(indexId, indexName, content, author.getId());

        return RestResult.ok();
    }

    /**
     * 修改小说封面
     */
    @PostMapping("updateBookPic")
    public RestResult<Void> updateBookPic(@RequestParam("bookId") Long bookId,@RequestParam("bookPic") String bookPic,HttpServletRequest request) {
        Author author = checkAuthor(request);
        bookService.updateBookPic(bookId,bookPic, author.getId());
        return RestResult.ok();
    }


    /**
     * 作家日收入统计数据分页列表查询
     * */
    @GetMapping("listIncomeDailyByPage")
    public RestResult<PageBean<AuthorIncomeDetail>> listIncomeDailyByPage(@RequestParam(value = "curr", defaultValue = "1") int page,
                                                                          @RequestParam(value = "limit", defaultValue = "10") int pageSize ,
                                                                          @RequestParam(value = "bookId", defaultValue = "0") Long bookId,
                                                                          @RequestParam(value = "startTime",defaultValue = "2020-05-01") Date startTime,
                                                                          @RequestParam(value = "endTime",defaultValue = "2030-01-01") Date endTime,
                                                                          HttpServletRequest request){

        return RestResult.ok(authorService.listIncomeDailyByPage(page,pageSize,getUserDetails(request).getId(),bookId,startTime,endTime));
    }
    /**
     * 获取作者的账户信息
     */
    @GetMapping("getAuthorInfo")
    public RestResult<?> getAuthorInfo(HttpServletRequest request) {
        Author author2 = checkAuthor(request); //获取作者id
        authorMapper.getAuthorAccountInfo(author2.getId());
        //返回值
        return RestResult.ok(authorMapper.getAuthorAccountInfo(author2.getId()));


    }

        /**
         * 更新作者的账户信息
         */
    @PostMapping("updateAuthorInfo")
    public RestResult<?> updateAuthorInfo(@Validated({UpdateGroup.class}) AuthourAccountDetails author, HttpServletRequest request){
        Author author2 = checkAuthor(request); //获取作者id

        AuthourAccountDetails authourAccountDetails=new AuthourAccountDetails();
        authourAccountDetails.setId(author2.getId());
        authourAccountDetails.setBankName(author.getBankName());
        authourAccountDetails.setAlipayId(author.getAlipayId());
        authourAccountDetails.setBankCardNumber(author.getBankCardNumber());
        authourAccountDetails.setUserName(author.getUserName());
        authourAccountDetails.setSubbranchName(author.getSubbranchName());

        if (authourAccountDetails == null) {
            return RestResult.fail(ResponseStatus.NO_LOGIN);
        }
        authorMapper.updatAccountDetail(authourAccountDetails);

        return RestResult.ok();
    }
    /**
     * 获取书友圈的内容html
     * */
    @GetMapping("getShuyouquanHtml")
    public RestResult<?> getShuyouquanHtml(Long bookId){
        return RestResult.ok(frontBookMapper.getShuyouquanHtml(bookId));
    }

    /**
     * 作家月收入统计数据分页列表查询
     * */
    @GetMapping("listIncomeMonthByPage")
    public RestResult<PageBean<AuthorIncome>> listIncomeMonthByPage(@RequestParam(value = "curr", defaultValue = "1") int page,
                                                                    @RequestParam(value = "limit", defaultValue = "10") int pageSize ,
                                                                    @RequestParam(value = "bookId", defaultValue = "0") Long bookId,
                                                                    HttpServletRequest request){

        return RestResult.ok(authorService.listIncomeMonthByPage(page,pageSize,getUserDetails(request).getId(),bookId));
    }

    private Author checkAuthor(HttpServletRequest request) {

        UserDetails userDetails = getUserDetails(request);
        if (userDetails == null) {
            throw new BusinessException(ResponseStatus.NO_LOGIN);
        }

        //查询作家信息
        Author author = authorService.queryAuthor(userDetails.getId());

        //判断作者状态是否正常
        if (author.getStatus() == 1) {
            //封禁状态，不能发布小说
            throw new BusinessException(ResponseStatus.AUTHOR_STATUS_FORBIDDEN);
        }


        return author;


    }
    /**
     * 用来test的函数
     * */
    @GetMapping("testFunction")
    public RestResult<?> testFunction(Long bookId) throws IOException {

        /**
         * 实现xuanji2下文件的上传
         * 第一行作为标题
         * 其他作为内容
         */
        File file;
        for (int i=2;i<=70;i++){
            file=new File("/home/woa/programme/novelWeb/book/maoxuan6/"+i+".txt");

            handlefolderFile(file,23L,9L);

        }

/**
 *   单个文件内容的上传,是被里面的章节
 *         File file=new File("/home/woa/programme/novelWeb/book/搜神记.org");
 *         //
 *         //handleFileRegxp(file,".*第[一|二|三|四|五|六|七|八|九|十|百|千|万]+回.*",3,30L,16L);//第[\u4e00-\u9fa5]+回
 *         handleFileRegxp(file,".*卷[一|二|三|四|五|六|七|八|九|十|百|千|万]+",3,31L,17L);//第[\u4e00-\u9fa5]+回
 *
 */
        return RestResult.ok();
    }
    /**
     * @param filePath filePath="/home/woa/programme/novelWeb/pythonTool/xuanji2/红楼梦3.txt"
     * @throws IOException
     * 通过正则表达式处理单个文件,并上传到mysql,
     * choose:1:测试章节是否合适 2：上传一章 3：上传所有章节
     */
    public  int handleFileRegxp(File filePath,String pattern,Integer choose,Long bookId,Long authorId) throws IOException {
        int line_num = 0;
        Byte by0=0;
        String returnlines="";
        String firstlines="";
        //BufferedReader是可以按行读取文件
        FileInputStream inputStream = new FileInputStream(filePath);
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));

        String str = null;
        String temp="";
        boolean isMatch;
        while((str = bufferedReader.readLine()) != null) {

//            String pattern = "第.*章.*";

            isMatch = Pattern.matches(pattern, str);
            if (isMatch) {
                if (returnlines != "") {
                    if(choose!=1){
                        bookService.addBookContent(bookId, firstlines, returnlines, by0, authorId);
                        if(choose==2){
                            return 0;
                        }
                    }

                }
                firstlines = str;
                returnlines = "";
                if(choose==1){
                    System.out.print("------------------------------------------\n");
                    System.out.print(firstlines + "\n");
                }


            } else {
                if (!str.equals("") && str.length() != 0 && !str.equals("\\t") && !str.equals("\t")) {
                    returnlines += "&emsp;&emsp;" + str + "<br>";

                }
            }


        }
        inputStream.close();
        bufferedReader.close();
        return 0;

    }

    /**
     * 通过文字的个数,进行判断
     * @param filePath
     * @param pattern
     * @param choose
     * @param bookId
     * @param authorId
     * @return
     * @throws IOException
     */
    public  int handleFileNum(File filePath,String pattern,Integer choose,Long bookId,Long authorId) throws IOException {
        int line_num = 0;
        Byte by0=0;
        String returnlines="";
        String firstlines="";
        //BufferedReader是可以按行读取文件
        FileInputStream inputStream = new FileInputStream(filePath);
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));

        String str = null;
        String temp="";
        boolean isMatch;
        while((str = bufferedReader.readLine()) != null) {

//            String pattern = "第.*章.*";

            isMatch = Pattern.matches(pattern, str);
            if (str.length()>0&&str.length()<12&&!str.equals("")) {
                if (returnlines != "") {
                    if(choose!=1){
                        bookService.addBookContent(bookId, firstlines, returnlines, by0, authorId);
                        if(choose==2){
                            return 0;
                        }
                    }

                }
                firstlines = str;
                returnlines = "";
                if(choose==1){
                    System.out.print("------------------------------------------\n");
                    System.out.print(firstlines + "\n");
                }


            } else {
                if (!str.equals("") && str.length() != 0 && !str.equals("\\t") && !str.equals("\t")) {
                    returnlines += "&emsp;&emsp;" + str + "<br>";

                }
            }


        }
        inputStream.close();
        bufferedReader.close();
        return 0;

    }


    //使用递归遍历文件夹及子文件夹中文件
    public void filesDirs(File file,Long bookId,Long authorId) throws IOException{
        //File对象是文件或文件夹的路径，第一层判断路径是否为空
        if(file!=null){
            //第二层路径不为空，判断是文件夹还是文件
            if(file.isDirectory()){
                //进入这里说明为文件夹，此时需要获得当前文件夹下所有文件，包括目录
                File[] files=file.listFiles();//注意:这里只能用listFiles()，不能使用list()
                List fileList = Arrays.asList(files);
                Collections.sort(fileList, new Comparator<File>() {
                    @Override
                    public int compare(File o1, File o2) {
                        if (o1.isDirectory() && o2.isFile())
                            return -1;
                        if (o1.isFile() && o2.isDirectory())
                            return 1;
                        return o1.getName().compareTo(o2.getName());
                    }
                });
                //files下的所有内容，可能是文件夹，也可能是文件，那么需要一个个去判断是文件还是文件夹，这个判断过程就是这里封装的方法
                //因此可以调用自己来判断，实现递归
                for (File flies2:files) {
                    filesDirs(flies2,bookId,authorId);
                }
            }else{
                //System.out.println(file);
                handlefolderFile(file,bookId,authorId);
            }
        }else{
            System.out.println("文件不存在");
        }


    }


    //读取文件内容,并上传到mysql

    /**
     * @param filePath filePath="/home/woa/programme/novelWeb/pythonTool/xuanji2/007.txt.org"
     * @throws IOException
     * 处理单个文件,上传mysql
     * 第一行作为标题
     * 其他行作为内容
     */
    public  void handlefolderFile(File filePath,Long bookId,Long authorId) throws IOException {
        int line_num = 0;
        Byte by0=0;
        String returnlines="";
        String firstlines="";
        //BufferedReader是可以按行读取文件
        FileInputStream inputStream = new FileInputStream(filePath);
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));

        String str = null;

        while((str = bufferedReader.readLine()) != null )
        {
            if(str!=null){
                if(!str.equals("")&&!str.equals(null)&&!StringUtils.isBlank(str)){
                    line_num+=1;
                    if (line_num != 1){
                        str.replaceAll("\\t", "");
                        if(!str.equals("")&&str.length()!=0&&!str.equals("\\t")&&!str.equals("\t")){
                            returnlines+=str+"<br>";
                        }

                    }else{
                        firstlines=str;
                    }

                }
            }




        }
//
//        System.out.println(firstlines);
//        System.out.println("----------------------------------");
//        System.out.println(returnlines);
        //向数据库添加内容
        /**
         * INSERT INTO `novel`.`book_index` (`id`, `book_id`, `index_num`, `index_name`, `word_count`, `is_vip`, `book_price`, `storage_type`, `create_time`, `update_time`) VALUES
         * ('1563422377730269184', '18', '0', '中国社会各阶级的分析', '5857', '0', '29', 'db', '2022-08-27 15:05:16', '2022-08-27 15:06:44');
         */

//        content = content.replaceAll("\\n\\n", "<br>");

        bookService.addBookContent(bookId,firstlines,returnlines,by0,authorId);
        //close
        inputStream.close();
        bufferedReader.close();
    }


}
