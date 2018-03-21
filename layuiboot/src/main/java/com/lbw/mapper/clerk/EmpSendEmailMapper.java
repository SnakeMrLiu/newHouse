package com.lbw.mapper.clerk;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

@Mapper
@Component
public interface EmpSendEmailMapper {

    /**
     * 获取收取邮件人
     * @param eid
     * @return
     */
    @Select("SELECT email FROM t_emp WHERE id= #{eid}")
    String getNameMail(String eid);
}
