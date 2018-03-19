package com.lbw.service.customer;

import com.lbw.mapper.customer.CustomerMapper;
import com.lbw.pojo.customer.Customer;
import com.lbw.pojo.customer.Order;
import com.lbw.pojo.sellhouse.SellHouseResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerMapper customerMapper;

    /**
     * 预约
     * @param houseId
     * @return
     */
    @Override
    public Map<String, Object> orderHouser(String houseId, HttpServletRequest request) {
        Map<String,Object> map = new HashMap<String,Object>();
        //根据房源id查询出房源信息
        SellHouseResource house = customerMapper.queryHouseInfoByHouseId(houseId);
        HttpSession session = request.getSession();
        Customer c = (Customer)session.getAttribute(session.getId());
        Order o = new Order();
        o.setId(UUID.randomUUID().toString().replace("-",""));
        o.setHid(houseId);
        o.setEid(house.getEid());
        o.setOrderTime(new Date());
        o.setCid(c.getId());
        //新增预约信息
        try {
            customerMapper.insertOrderInfo(o);
            map.put("success",true);
        } catch (Exception e) {
            map.put("success",false);
            e.printStackTrace();
        }
        return map;
    }
}
