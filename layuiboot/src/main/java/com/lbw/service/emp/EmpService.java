package com.lbw.service.emp;

import com.lbw.pojo.sellhouse.Emp;

public interface EmpService {
    String getEmpInfo(Integer page, Integer number);

    void deleteOneEmpInfo(String id);

    void deleteAllEmp(String[] ids);

    void addEmpInfo(Emp emp);

    Emp queryEditEmpInfoById(String id);

    void updateEmpInfo(Emp emp);
}
