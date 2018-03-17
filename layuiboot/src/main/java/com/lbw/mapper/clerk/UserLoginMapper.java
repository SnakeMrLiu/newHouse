package com.lbw.mapper.clerk;

import com.lbw.pojo.sellhouse.Emp;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

@Mapper
@Component
public interface UserLoginMapper {

    @Select("select loginnumber from t_emp where loginnumber = #{loginnumber}")
    Emp getUserNumber(String loginnumber);
}
