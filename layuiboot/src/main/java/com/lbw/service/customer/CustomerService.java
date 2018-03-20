package com.lbw.service.customer;

import com.lbw.pojo.customer.Customer;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;

import java.util.Map;

public interface CustomerService {

    String queryCustomer(Integer page, Integer number, HttpServletRequest request, Customer customer);

    Map<String,Object> orderHouser(String houseId, HttpServletRequest request);
}
