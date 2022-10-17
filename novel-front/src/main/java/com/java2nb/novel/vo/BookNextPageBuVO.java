package com.java2nb.novel.vo;


//用来存储下一章按键的结构,在mapper调用,点击后进入下一章
public class BookNextPageBuVO {

    private long mainId;//主键 id
    private long novel_id;  //本章pageID 链接的尾巴
    private long book_id;  //本章小说ID 对应index的id
    private String link_url;  //下一章链接url
    private String nextpage_name;  //下一章的章节名
    private String nextpage_desc;  //下一章的简单描述
    private Integer thumbsup_count;  //下一章的点赞数量
    private Integer reply_count;   //下一章的评论数量

    public BookNextPageBuVO(long novel_id,long book_id,String link_url,String nextpage_name,String nextpage_desc,Integer thumbsup_count,Integer reply_count) {
        this.novel_id=novel_id;
        this.book_id=book_id;
        this.link_url=link_url;
        this.nextpage_name=nextpage_name;
        this.nextpage_desc=nextpage_desc;
        this.thumbsup_count=thumbsup_count;
        this.reply_count=reply_count;
    }
    public BookNextPageBuVO(long novel_id,long book_id) {
        this.novel_id=novel_id;
        this.book_id=book_id;

    }
    public BookNextPageBuVO(BookNextPageBuVO1 bookNextPageBuVO) {
        this.link_url=bookNextPageBuVO.GetlinkUrl();
        this.nextpage_name=bookNextPageBuVO.GetnextpageName();

    }
    public long Getnovel_id(){
        return this.novel_id;
    }
    public long Getbook_id(){
        return this.book_id;
    }
    public String GetlinkUrl(){
        return this.link_url;
    }
    public String GetnextpageName(){
        return this.nextpage_name;
    }
}
