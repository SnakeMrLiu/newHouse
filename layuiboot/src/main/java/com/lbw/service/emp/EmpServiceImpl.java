package com.lbw.service.emp;

import com.alibaba.fastjson.JSONObject;
import com.lbw.mapper.emp.EmpMapper;
import com.lbw.pojo.sellhouse.Emp;
import com.lbw.utils.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class EmpServiceImpl implements EmpService{

    @Autowired
    private EmpMapper empMapper;

    /**
     * 查询员工信息加分页
     * @param page
     * @param number
     * @return
     */
    @Override
    public String getEmpInfo(Integer page, Integer number) {
        page = (page - 1) * number;
        //查询员工信息总条数
        Integer total = empMapper.queryEmpCount();
        //分页查询员工信息
        List<Emp> list = empMapper.getEmpInfo(page,number);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", total);
        jsonObject.put("data", list);
        return jsonObject.toString();
    }

    /**
     * 单个删除员工信息
     * @param id
     */
    @Override
    public void deleteOneEmpInfo(String id) {
        empMapper.deleteOneEmpInfo(id);
    }

    /**
     * 批量删除员工信息
     * @param ids
     */
    @Override
    public void deleteAllEmp(String[] ids) {
        empMapper.deleteAllEmp(ids);
    }

    /**
     * 新增员工信息
     * @param emp
     */
    @Override
    public void addEmpInfo(Emp emp) {
        //添加员工主键
        emp.setId(UUID.randomUUID().toString().replaceAll("-",""));
        //密码用MD5加密
        emp.setPassword(Md5Util.getMd532(emp.getPassword()));
        //新增员工信息
        empMapper.addEmpInfo(emp);

        //添加员工角色关联表ID
        String emp_Role_id = UUID.randomUUID().toString().replaceAll("-", "");
        //新增员工角色关联表
        empMapper.addEmp_RoleInfo(emp,emp_Role_id);
    }
    /**
     * 查询修改回填信息
     * @param id
     * @return
     */
    @Override
    public Emp queryEditEmpInfoById(String id) {
        return empMapper.queryEditEmpInfoById(id);
    }

    /**
     * 修改员工信息
     * @param emp
     */
    @Override
    public void updateEmpInfo(Emp emp) {
        //MD5加密
        emp.setPassword(Md5Util.getMd532(emp.getPassword()));
        empMapper.updateEmpInfo(emp);
    }
}
