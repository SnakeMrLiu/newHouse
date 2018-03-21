package com.lbw.service.announcement;

import com.alibaba.fastjson.JSONObject;
import com.lbw.mapper.announcement.AnnouncementMapper;
import com.lbw.pojo.announcement.Announcement;
import com.lbw.pojo.power.EmpRole;
import com.lbw.pojo.power.Role;
import com.lbw.pojo.sellhouse.Emp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Service
public class AnnouncementServiceImpl implements AnnouncementService {
    @Autowired
    private AnnouncementMapper announcementMapper;

    /**
     * 查询公告列表
     * @param page
     * @param number
     * @return
     */
    @Override
    public String queryAnnouncement(Integer page, Integer number) {
        page = (page - 1) * number;
        List<Announcement> list = announcementMapper.queryAnnouncement(page,number);
        Long count = announcementMapper.queryAnnouncementCount();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", count);
        jsonObject.put("data", list);
        return jsonObject.toString();
    }

    /**
     * 发布公告
     * @param announcement
     * @param request
     * @return
     */
    @Override
    public Map<String, Object> release(Announcement announcement,HttpServletRequest request) {
        Map<String,Object> map = new HashMap<String,Object>();
        HttpSession session = request.getSession();
         Emp emp = (Emp) session.getAttribute(session.getId());
        announcement.setId(UUID.randomUUID().toString().replace("-",""));
        announcement.setEid(emp.getId());
        announcement.setTime(new Date());
        //根据员工id去查询员工角色
        String roleId =  announcementMapper.queryRoleByEmpId(emp.getId());
        //判断员工角色是管理员还是普通员工
        if(roleId.equals("2")){
            //管理员
            announcement.setStatus(2);
        }else{
            //普通员工
            announcement.setStatus(1);
        }
        /**
         * 发布公告
         */
        try {
            announcementMapper.insertRelease(announcement);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }

    /**
     * 审核
     * @param id
     * @param status
     * @return
     */
    @Override
    public Map<String, Object> auditAnnouncement(String id, Integer status) {
        Map<String,Object> map = new HashMap<String,Object>();
        try {
            announcementMapper.auditAnnouncement(id,status);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }
    /**
     * 查询未审核的公告
     * @param page
     * @param number
     * @return
     */
    @Override
    public String queryNoAuditInfo(Integer page, Integer number) {
        page = (page - 1) * number;
        List<Announcement> list = announcementMapper.queryNoAuditInfo(page,number);
        Long count = announcementMapper.queryNoAuditInfoCount();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", count);
        jsonObject.put("data", list);
        return jsonObject.toString();
    }

    /**
     * 查询我的发布
     * @param page
     * @param number
     * @return
     */
    @Override
    public String queryMyAuditInfo(Integer page, Integer number,HttpServletRequest request) {
        HttpSession session = request.getSession();
        Emp emp = (Emp) session.getAttribute(session.getId());
        page = (page - 1) * number;
        List<Announcement> list = announcementMapper.queryMyAuditInfo(page,number,emp.getId());
        Long count = announcementMapper.queryMyAuditInfoCount(emp.getId());
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", count);
        jsonObject.put("data", list);
        return jsonObject.toString();
    }
}
