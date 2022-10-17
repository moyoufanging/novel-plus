package com.java2nb.novel.mapper;

import com.java2nb.novel.core.bean.AuthourAccountDetails;
import com.java2nb.novel.core.bean.AuthourAccountDetails2;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AuthorMapper2 {
    public int updatAccountDetail(AuthourAccountDetails authourAccountDetails);
    public AuthourAccountDetails getAuthorAccountInfo(Long id);
}
