package com.lbw.controller.contract;

import com.lbw.pojo.contract.Contract;
import com.lbw.pojo.sellhouse.Emp;
import com.lbw.service.contract.ContractService;
import com.lbw.utils.CnNumberUtils;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping(value = "contract")
public class ContractController {

    @Autowired
    private ContractService contractService;

    /**
     * 新增合同
     */
    @RequestMapping("addContract")
    @ResponseBody
    public Map<String,Object> addContract(Contract contract, HttpServletRequest request){
        return contractService.addContract(contract,request);
    }

    /**
     * 生成word文档
     */
    @RequestMapping("toFreeWord")
    @ResponseBody
    public void toFreeWord(String id){
        contractService.toFreeWord(id);
    }

    /**
     * 生成pdf文档
     */
    @RequestMapping("toFreePdf")
    @ResponseBody
    public void toFreePdf(String id) throws IOException, TemplateException {
        contractService.toFreePdf(id);
    }

    @RequestMapping(value = "toNewContractPage")
    public String toNewContractPage(Model model){
        String numberserial = String.valueOf(System.currentTimeMillis());
        model.addAttribute("num",numberserial);
        return "contract/newContract";
    }

    /**
     * 跳转查询合同页面
     * @return
     */
    @RequestMapping(value = "toContract")
    public String toQueryPactList(){
        return "contract/contract";
    }

    ////查询合同列表+分页
    @RequestMapping("queryPactInfo")
    @ResponseBody
    public String queryPactInfo(Integer page, Integer number, HttpServletRequest request) {
        String str;
        HttpSession session = request.getSession();
        Emp emp = (Emp) session.getAttribute(session.getId());
        //通过登录用户id查询权限id
        String id = contractService.queryEmpId(emp.getId());
        if (id.equals("2")) {
            //管理员查询
            str =contractService.queryAllContract(page,number,request);
        } else {
            //员工查询
            str =contractService.queryStaffContract(page,number,request,emp.getId());
        }
        return str;
    }

    //合同详情回显

    @RequestMapping(value = "toContractInfo")

    public String contractInfo(String id, Model model) {
        Contract contract = contractService.contractInfo(id);
        //map.put("house", sellHouseResource);
        contract.setA(CnNumberUtils.toUppercase(contract.getDedit()));//违约金
        contract.setB(CnNumberUtils.toUppercase(contract.getThefigure()));
        contract.setC(CnNumberUtils.toUppercase(contract.getRentMath()));
        model.addAttribute("contract",contract);
        return "contract/contractInfo";
    }

}
