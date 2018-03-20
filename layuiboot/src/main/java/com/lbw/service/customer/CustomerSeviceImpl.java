package com.lbw.service.customer;

import com.alibaba.fastjson.JSONObject;
import com.lbw.mapper.customer.CustomerMapper;
import com.lbw.pojo.customer.Customer;
import com.lbw.pojo.customer.Order;
import com.lbw.pojo.sellhouse.SellHouseResource;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.*;

@Service
public class CustomerSeviceImpl implements CustomerService{
    @Autowired
    private CustomerMapper customerMapper;
    //客户查询
    @Override
    public String queryCustomer(Integer page, Integer number, HttpServletRequest request,Customer customer) {
        page = (page - 1) * number;


        Integer total = customerMapper.queryCustomercount(customer);
        List<Customer> list = customerMapper.queryCustomer(page,number,customer);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", total);
        jsonObject.put("data", list);
        return jsonObject.toString();
    }

    /**
     * 预约
     * @param houseId
     * @param request
     * @return
     */
    @Override
    public Map<String, Object> orderHouser(String houseId, HttpServletRequest request) {
        Map<String,Object> map = new HashMap<String,Object>();
        //根据房屋id查询发布人id
        SellHouseResource sellHouseResource = customerMapper.queryEmpByHouseId(houseId);
        //从Session获取用户id
        //HttpSession session = request.getSession();
        //Customer customer = (Customer) session.getAttribute(session.getId());
        Order o = new Order();
        o.setId(UUID.randomUUID().toString().replace("-",""));
        //o.setCid(customer.getId());
        o.setCid(UUID.randomUUID().toString().replace("-",""));
        o.setEid(sellHouseResource.getEid());
        o.setOrderTime(new Date());
        o.setHid(houseId);
        //添加预约信息
        try {
            customerMapper.insertOrderInfo(o);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }
}

