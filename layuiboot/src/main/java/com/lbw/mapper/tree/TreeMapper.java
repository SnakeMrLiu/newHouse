package com.lbw.mapper.tree;

import com.lbw.pojo.tree.Tree;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface TreeMapper {
    @Select("SELECT id,title,icon,href,spread,pid  FROM t_tree")
    List<Tree> getTree();
}
