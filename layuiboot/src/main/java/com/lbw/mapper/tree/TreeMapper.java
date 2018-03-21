package com.lbw.mapper.tree;

import com.lbw.pojo.tree.Tree;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface TreeMapper {
    @Select("SELECT DISTINCT tre.* FROM  t_tree tre\n" +
            "LEFT JOIN t_role_power trp ON tre.id = trp.tree_id\n" +
            "LEFT JOIN t_role tro ON tro.id = trp.role_id\n" +
            "LEFT JOIN t_emp_role ter ON ter.role_id = tro.id\n" +
            "WHERE ter.emp_id = #{id} ")
    List<Tree> getTree(String id);
}
