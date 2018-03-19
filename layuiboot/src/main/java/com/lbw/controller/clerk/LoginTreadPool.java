package com.lbw.controller.clerk;

import com.lbw.pojo.login.LogBean;
import com.lbw.service.clerk.UserLoginService;

public class LoginTreadPool implements Runnable {

    private UserLoginService userLoginService;

    private LogBean logBean;

    public LoginTreadPool(UserLoginService userLoginService, LogBean logBean) {
        this.userLoginService = userLoginService;
        this.logBean = logBean;
    }
    @Override
    public void run() {
        userLoginService.loginUser(logBean);
    }
}
