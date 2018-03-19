package com.lbw.mapper;

import com.lbw.pojo.LogBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LogMapperImpl implements LogMapper {

    @Autowired
    private MongoTemplate mongoTemplate;

    @Override
    public void logRecord(LogBean logBean) {
        mongoTemplate.insert(logBean);
    }

    @Override
    public List<LogBean> queryLog(Integer page, Integer rows) {
        return mongoTemplate.find(new Query().skip(page).limit(rows),LogBean.class);
    }
}
