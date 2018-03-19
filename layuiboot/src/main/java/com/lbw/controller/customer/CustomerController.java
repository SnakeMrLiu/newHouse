package com.lbw.controller.customer;


import com.lbw.service.customer.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RequestMapping(value = "customer")
@Controller
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    /**
     * 预约
     * @param houseId
     * @return
     */
    @RequestMapping(value = "orderHouser")
    @ResponseBody
    public Map<String,Object> orderHouser(String houseId, HttpServletRequest request){
        return customerService.orderHouser(houseId,request);
    }
}
