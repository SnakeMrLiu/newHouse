package com.lbw.controller.customer;
import com.lbw.pojo.customer.Customer;
import com.lbw.service.customer.CustomerService;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping(value = "customer")
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    /**
     * 跳转用户预约页面
     * @return
     */
    @RequestMapping(value = "toCustomerList")
    public String toSellHouseList(){
        return "customer/customer";
    }



    //客户查询
    @RequestMapping("queryCustomer")
    @ResponseBody
    public String queryHouse(Integer page, Integer number, HttpServletRequest request, Customer customer){
        return  customerService.queryCustomer(page,number,request,customer);

}
    //预约房子
    @RequestMapping(value = "orderHouser")
    @ResponseBody
    public Map<String,Object> orderHouser(String houseId,HttpServletRequest request){
        return customerService.orderHouser(houseId,request);
    }
}
