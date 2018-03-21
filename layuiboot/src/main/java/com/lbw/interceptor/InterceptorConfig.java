package com.lbw.interceptor;

import com.lbw.pojo.sellhouse.Emp;
import com.lbw.service.power.PowerService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.HashSet;
import java.util.Set;

public class InterceptorConfig extends HandlerInterceptorAdapter{
    private static final Logger log = LoggerFactory.getLogger(InterceptorConfig.class);

    @Autowired
    private PowerService powerService;

    @Override
    public boolean preHandle (HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object handler) throws Exception {

        log.info("---------------------开始进入请求地址拦截----------------------------");
        HttpSession session = httpServletRequest.getSession();
        Emp  emp = (Emp) session.getAttribute(session.getId());
        String url = httpServletRequest.getRequestURI();
        if(url.indexOf("/login")>-1){
                return true;
        }
        if(emp == null){
            PrintWriter printWriter = httpServletResponse.getWriter();
            printWriter.write("{code:0,message:\"session is invalid,please login again!\"}");
            httpServletResponse.sendRedirect("/login/toLoginPage");
            return false;
        }

        // 将handler强转为HandlerMethod, 前面已经证实这个handler就是HandlerMethod
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        //获取类名上的注解
        Class<?> beanType = ((HandlerMethod) handler).getBeanType();
        // 从方法处理器中获取出要调用的方法
        Method method = handlerMethod.getMethod();
        // 获取出方法上的Access注解
        Access access = beanType.getAnnotation(Access.class);
        if (access == null) {
            // 如果注解为null, 说明不需要拦截, 直接放过
            return true;
        }
        if (access.authorities().length > 0) {
            // 如果权限配置不为空, 则取出配置值
            String[] authorities = access.authorities();
            Set<String> authSet = new HashSet<>();
            for (String authority : authorities) {
                // 将权限加入一个set集合中
                authSet.add(authority);
            }

            // 这里我为了方便是直接参数传入权限, 在实际操作中应该是从参数中获取用户Id
            // 到数据库权限表中查询用户拥有的权限集合, 与set集合中的权限进行对比完成权限校验
            String permit = powerService.getpowerInfo(emp.getId());
                if (StringUtils.isNotBlank(permit)) {
                    if (authSet.contains(permit)) {
                        // 校验通过返回true, 否则拦截请求
                        return true;
                    }
                }
            // 拦截之后应该返回公共结果, 这里没做处理
            httpServletRequest.getRequestDispatcher("../nopower.jsp").forward(httpServletRequest,httpServletResponse);
            return false;
        }
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
