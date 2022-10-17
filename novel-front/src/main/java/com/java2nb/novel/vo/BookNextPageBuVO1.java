package com.java2nb.novel.vo;


//用来存储下一章按键的结构,在mapper调用,点击后进入下一章
public class BookNextPageBuVO1 {


    public String linkUrl;  //下一章链接url
    public String nextpageName;  //下一章的章节名

    public Long id;
    public Long thumbsupCount;
    public String GetlinkUrl(){
        return this.linkUrl;
    }
    public String GetnextpageName(){
        return this.nextpageName;
    }


}
