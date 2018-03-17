package com.lbw.mapper.emp;

import com.lbw.pojo.sellhouse.Emp;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmpMapper {
    //查询员工信息总条数
    @Select(value = "SELECT COUNT(1) FROM t_emp")
    Integer queryEmpCount();

    //分页查询员工信息
    @Select(value = "SELECT * FROM t_emp  LIMIT #{page},#{number}")
    List<Emp> getEmpInfo(@Param(value = "page") Integer page, @Param(value = "number") Integer number);

    //单个删除员工信息
    @Delete(value = "DELETE FROM t_emp WHERE  id = #{id}")
    void deleteOneEmpInfo(String id);

    //批量删除员工信息
    @Delete({
            "<script>"
                    + "DELETE FROM t_emp WHERE id IN  "
                    + "<foreach item='ids' index='index' collection='ids' open='(' separator=',' close=')'>"
                    +       "#{ids}"
                    + "</foreach>"
                    +"</script>"
    })
    void deleteAllEmp(@Param(value = "ids") String[] ids);

    //新增员工信息
    @Insert(value = "\t\tINSERT INTO t_emp(id,name,weixin,photo,phonenumer,loginnumber,password)\n" +
            "        VALUES (#{id},#{name},#{weixin},#{photo},#{phonenumer},#{loginnumber},#{password})")
    void addEmpInfo(Emp emp);

    //查询修改回填信息
    @Select(value = "SELECT * FROM t_emp WHERE  id = #{id}")
    Emp queryEditEmpInfoById(String id);

    //修改员工信息
    @Update(value = "\tUPDATE t_emp SET\n" +
            "\t\tname = #{name},weixin = #{weixin},photo = #{photo},phonenumer = #{phonenumer},loginnumber = #{loginnumber},password = #{password}\n" +
            "\t\tWHERE id = #{id}")
    void updateEmpInfo(Emp emp);
}
