package com.lbw.service.contract;

import com.alibaba.fastjson.JSONObject;
import com.itextpdf.text.pdf.BaseFont;
import com.lbw.mapper.contract.ContractMapper;
import com.lbw.pojo.contract.Contract;
import com.lbw.pojo.sellhouse.Emp;
import com.lbw.utils.CnNumberUtils;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xhtmlrenderer.pdf.ITextFontResolver;
import org.xhtmlrenderer.pdf.ITextRenderer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.*;

@Service
public class ContractServiceImpl implements ContractService {
    @Autowired
    private ContractMapper contractMapper;

    /**
     * 新增合同信息
     * @param contract
     * @param request
     * @return
     */
    @Override
    public Map<String, Object> addContract(Contract contract, HttpServletRequest request) {
        Map<String,Object> map = new HashMap<String,Object>();
        try {
            //首先修改房屋状态为已租2
            contractMapper.updateHouseStatusByHouseId(contract.getSid());
            HttpSession session = request.getSession();
            Emp emp = (Emp) session.getAttribute(session.getId());
            contract.setId(UUID.randomUUID().toString().replace("-",""));
            contract.setEid(emp.getId());
            contract.setCreatetime(new Date());
            //新增合同信息
            contractMapper.addContract(contract);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }

    /**
     * 生成word文档
     * @param id
     */
    @Override
    public void toFreeWord(String id) {
        Map<String, Object> map = new HashMap<String, Object>();
        Configuration configuration = new Configuration();
        String ftlpath = "E:\\house";
        String htmlName = "account.ftl";
        Contract contract =  contractMapper.queryContracById(id);
        contract.setA(CnNumberUtils.toUppercase(contract.getDedit()));//违约金
        contract.setB(CnNumberUtils.toUppercase(contract.getThefigure()));
        contract.setC(CnNumberUtils.toUppercase(contract.getRentMath()));
        try {
            configuration.setDirectoryForTemplateLoading(new File(ftlpath));
            Template template = configuration.getTemplate(htmlName);
            // 合并模板文件以及数据将其进行输出
            Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("E:\\house\\contract.doc"), "utf-8"));
            //进行处理(往map里面存放数据)
            map.put("contract",contract);
            template.process(map, out);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成odf文档
     * @param id
     */
    @Override
    public void toFreePdf(String id)throws IOException, TemplateException {
         /* 创建数据模型 */
        // 制造数据
        Contract contract =  contractMapper.queryContracById(id);
        contract.setA(CnNumberUtils.toUppercase(contract.getDedit()));//违约金
        contract.setB(CnNumberUtils.toUppercase(contract.getThefigure()));
        contract.setC(CnNumberUtils.toUppercase(contract.getRentMath()));
        Map<Object,Object> map = new HashMap<Object, Object>();
        map.put("contract", contract);
        /* 创建配置 */
        Configuration cfg = new Configuration();
        /* 指定模板存放的路径 */
        cfg.setDirectoryForTemplateLoading(new File("E:\\house\\"));
        cfg.setDefaultEncoding("UTF-8");
        /* 从上面指定的模板目录中加载对应的模板文件 */
        Template temp = cfg.getTemplate("contract.ftl");

        /* 将生成的内容写入hello .html中 */
        String fileName = UUID.randomUUID().toString().replace("-","");
        String file1 = "E:\\house\\"+fileName+".html";
        File file = new File(file1);
        if (!file.exists())
            file.createNewFile();
        Writer out = new BufferedWriter(new OutputStreamWriter(
                new FileOutputStream(file), "UTF-8"));
        temp.process(map, out);
        out.flush();

        String url = new File(file1).toURI().toURL().toString();
        String outputFile = "E:\\house\\contract"+fileName+".pdf";
        OutputStream os = new FileOutputStream(outputFile);
        ITextRenderer renderer = new ITextRenderer();
        renderer.setDocument(url);
        // 解决中文问题
        ITextFontResolver fontResolver = renderer.getFontResolver();
        try {
            fontResolver.addFont("E:\\house\\simsun.ttc", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        } catch (Exception e) {
            e.printStackTrace();
        }
        renderer.layout();
        try {
            renderer.createPDF(os);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("转换成功！");
        os.close();
    }

    //查询当前登录用户的权限id
    @Override
    public String queryEmpId(String id) {
        return contractMapper.queryEmpId(id);
    }



    //管理员查询合同
    @Override
    public String queryAllContract(Integer page, Integer number, HttpServletRequest request) {
        page = (page - 1) * number;
        Integer total = contractMapper.queryContractCount();
        List<Contract> list = contractMapper.queryAllContract(page,number);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", total);
        jsonObject.put("data", list);
        return jsonObject.toString();
    }

    //员工查询合同
    @Override
    public String queryStaffContract(Integer page, Integer number, HttpServletRequest request, String id) {
        page = (page - 1) * number;
        Integer total = contractMapper.queryContractCount();
        List<Contract> list = contractMapper.queryStaffContract(page,number,id);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", total);
        jsonObject.put("data", list);
        return jsonObject.toString();
    }

    @Override
    public Contract contractInfo(String id) {
        return contractMapper.contractInfo(id);
    }

}
