package com.lbw.mapper.contract;

import com.lbw.pojo.contract.Contract;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface ContractMapper {
    @Update("UPDATE t_sell_house_resource SET STATUS = 2 WHERE id = #{sid}")
    void updateHouseStatusByHouseId(String sid);
    @Insert("INSERT INTO t_contract(id,eid,sid,numberserial,lessor,tenantry,starttime,endtime,payment,installment,timelimit,createtime,thefigure,dedit)\n" +
            "VALUES(#{id},#{eid},#{sid},#{numberserial},#{lessor},#{tenantry},#{starttime},#{endtime},#{payment},#{installment},#{timelimit},#{createtime},#{thefigure},#{dedit})")
    void addContract(Contract contract);
    @Select("SELECT c.`createtime`,c.`dedit`,c.`eid`,c.`endtime`,c.`lessor`,c.`numberserial`,c.`payment`,c.`starttime`\n" +
            ",c.`tenantry`,c.`thefigure`,c.`timelimit`,i.`name` timeOut,s.rent rentMath,(MONTH(c.endtime) - MONTH(c.`starttime`)) yueNum  FROM t_contract c \n" +
            " LEFT JOIN t_installment i ON c.`installment` = i.`instype` \n" +
            " LEFT JOIN t_sell_house_resource s ON s.id=c.sid\n" +
            " WHERE c.id = #{id}")
    Contract queryContracById(String id);
    //查询当前用户权限ID
    @Select ("SELECT `t_emp_role`.`role_id` FROM `t_emp_role`\n" +
            "LEFT JOIN t_emp ON t_emp.`id`=t_emp_role.`emp_id` WHERE t_emp.id=#{id}")
    String queryEmpId(String id);
    //查询数据条数
    @Select
            (
                    "SELECT COUNT(1) FROM t_contract where 1=1"
            )
    Integer queryContractCount();

    //管理员用户查询合同数据
    @Select ("SELECT t_emp.id,t_emp.name,t_contract.numberserial,t_contract.lessor,t_contract.tenantry,t_contract.createtime,t_contract.thefigure FROM t_contract\n" +
            " LEFT JOIN t_emp ON t_emp.id=t_contract.eid LIMIT #{page},#{number}")
    List<Contract> queryAllContract(@Param("page") Integer page, @Param("number")Integer number);

    //员工查询合同数据
    @Select ("SELECT t_emp.id,t_emp.name,t_contract.numberserial,t_contract.lessor,t_contract.tenantry,t_contract.createtime,t_contract.thefigure FROM t_contract\n" +
            " LEFT JOIN t_emp ON #{id}=t_contract.eid LIMIT #{page},#{number}")
    List<Contract> queryStaffContract(@Param("page") Integer page, @Param("number")Integer number, @Param("id")String id);






    @Select("SELECT c.`createtime`,c.`dedit`,c.`eid`,c.`endtime`,c.`lessor`,c.`numberserial`,c.`payment`,c.`starttime`\n" +
            ",c.`tenantry`,c.`thefigure`,c.`timelimit`,i.`name` timeOut,s.rent rentMath,(MONTH(c.endtime) - MONTH(c.`starttime`)) yueNum  FROM t_contract c \n" +
            " LEFT JOIN t_installment i ON c.`installment` = i.`instype` \n" +
            " LEFT JOIN t_sell_house_resource s ON s.id=c.sid\n" +
            " WHERE c.id = #{id}")
    Contract contractInfo(String id);
}
