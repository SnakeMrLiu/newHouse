package com.lbw.service.contract;

import com.lbw.pojo.contract.Contract;
import freemarker.template.TemplateException;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;

public interface ContractService {
    Map<String,Object> addContract(Contract contract, HttpServletRequest request);

    void toFreeWord(String id);

    void toFreePdf(String id) throws IOException, TemplateException;

    String queryEmpId(String id);

    String queryAllContract(Integer page, Integer number, HttpServletRequest request);

    String queryStaffContract(Integer page, Integer number, HttpServletRequest request, String id);

    Contract contractInfo(String id);
}
