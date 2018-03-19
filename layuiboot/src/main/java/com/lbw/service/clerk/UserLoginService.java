package com.lbw.service.clerk;


import com.lbw.pojo.login.LogBean;
import com.lbw.pojo.sellhouse.Emp;

import java.io.IOException;

public interface UserLoginService {

    Emp getUserNumber(String loginnumber, String verification);

    void loginUser(LogBean logBean);

    Integer getInterfaceSmS(String loginnumber) throws IOException;
}
