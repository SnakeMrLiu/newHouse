package com.lbw.controller.emp;

import com.lbw.pojo.sellhouse.Emp;
import com.lbw.service.emp.EmpService;
import com.lbw.utils.OssClienUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "emp")
public class EmpController {

    @Autowired
    private EmpService empService;

    /**
     * 跳转到员工新增页面
     * @return
     */
    @RequestMapping(value = "toAddEmp")
    public String toAddEmp(){
        return "emp/addEmp";
    }

    /**
     * 跳转到员工列表页面
     * @return
     */
    @RequestMapping(value = "toEmpInfoList")
    public String toEmpInfoList(){
        return "emp/empInfoList";
    }

    /**
     * 查询员工信息加分页
     * @return
     */
    @RequestMapping(value = "getEmpInfo")
    @ResponseBody
    public String getEmpInfo(Integer page, Integer number){
        return  empService.getEmpInfo(page,number);
    }

    /**
     * 单个删除员工信息
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteOneEmpInfo")
    @ResponseBody
    public Map<String,Object> deleteOneEmpInfo(String id){
        Map<String,Object> map = new HashMap<>();
        try {
            empService.deleteOneEmpInfo(id);
            map.put("success",true);
        }catch (Exception e){
            map.put("success",false);
            e.printStackTrace();
        }
        return map;
    }

    /**
     * 批量删除员工信息
     * @param ids
     * @return
     */
    @RequestMapping(value = "deleteAllEmp")
    @ResponseBody
    public Map<String,Object> deleteAllEmp(@RequestParam(value = "ids[]") String[] ids){
        Map<String,Object> map = new HashMap<>();
        try {
            empService.deleteAllEmp(ids);
            map.put("success",true);
        }catch (Exception e){
            map.put("success",false);
            e.printStackTrace();
        }
        return map;
    }

    /**
     * 新增员工信息
     * @param emp
     * @return
     */
    @RequestMapping(value = "addEmpInfo")
    @ResponseBody
    public Map<String,Object> addEmpInfo(Emp emp){
        Map<String,Object> map = new HashMap<>();
        try {
            if(emp.getId() == null){
                empService.addEmpInfo(emp);
            }else{
                empService.updateEmpInfo(emp);
            }
            map.put("success",true);
        }catch (Exception e){
            map.put("success",false);
            e.printStackTrace();
        }
        return map;
    }

    /**
     * 查询修改回填信息
     * @param id
     * @return
     */
    @RequestMapping(value = "queryEditEmpInfoById")
    public ModelAndView queryEditEmpInfoById(String id){
        ModelAndView mad = new ModelAndView("emp/editEmpInfo");
        Emp emp = empService.queryEditEmpInfoById(id);
        mad.addObject(emp);
        return mad;
    }

    /**
     * 上传图片
     * @return
     */
    @RequestMapping(value = "uploadPhoto",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> uploadPhoto(MultipartFile file){
        Map<String,Object> map = new HashMap<String, Object>();
        try {
            if (file == null || file.getSize() <= 0) {
                throw new Exception("图片不能为空");
            }
            String  nameHz= file.getOriginalFilename(); //上传的文件名 + 后缀    如  asd.png
            String type = "";
            if(nameHz.contains(".png") || nameHz.contains(".jpg")){
                type="img";
            }
            if(nameHz.contains(".mp4") || nameHz.contains(".ogv")){
                type="video";
            }else {
                type="file";
            }
            OssClienUtils ossClient = new OssClienUtils();
            String keyName = ossClient.uploadImg2Oss(file,type);
            String imgUrl = ossClient.getImgUrl(keyName);
            System.out.println(imgUrl);
            map.put("success", true);
            map.put("path", imgUrl);
        }catch (Exception e){
            e.printStackTrace();
            map.put("success", false);
        }
        return map;
    }

}
