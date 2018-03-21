package com.lbw.mapper.power;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;


@Repository
@Mapper
public interface PowerMapper {
    @Select(value = "\n" +
            "SELECT tr.`name` FROM t_role tr \n" +
            "LEFT JOIN t_emp_role ter ON ter.`role_id` = tr.`id`\n" +
            "WHERE ter.`emp_id` = #{id} ")
    String getpowerInfo(String id);
}
