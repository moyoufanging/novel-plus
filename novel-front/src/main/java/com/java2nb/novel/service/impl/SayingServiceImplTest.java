package com.java2nb.novel.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.java2nb.novel.mapper.SayingMapper;

@Service
class SayingServiceImplTest  {
    @Autowired
    private SayingMapper sayingMapper;

    @org.junit.jupiter.api.Test
    void queryOneSaying() {
        //sayingMapper.selectOneById(1);
    }
}