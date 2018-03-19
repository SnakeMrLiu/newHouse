package com.lbw.service.customer;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public interface CustomerService {
    Map<String,Object> orderHouser(String houseId, HttpServletRequest request);
}
