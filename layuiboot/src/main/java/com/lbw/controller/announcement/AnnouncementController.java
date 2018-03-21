package com.lbw.controller.announcement;

import com.lbw.interceptor.Access;
import com.lbw.pojo.announcement.Announcement;
import com.lbw.service.announcement.AnnouncementService;
import com.netflix.discovery.converters.Auto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping(value = "announcement")
public class AnnouncementController {
    @Autowired
    private AnnouncementService announcementService;
    /**
     * 去发布公告页面
     * @return
     */
    @RequestMapping(value = "toAnnouncementList")
    public  String toAnnouncementList(){
        return "announcement/announcementList";
    }


    /**
     * 查询发布列表
     */
    @RequestMapping(value = "queryAnnouncement")
    @ResponseBody
    public String queryAnnouncement(Integer page, Integer number){
        return announcementService.queryAnnouncement(page,number);
    }

    /**
     * 发布
     */
    @RequestMapping(value = "release")
    @ResponseBody
    public Map<String,Object> release(Announcement announcement, HttpServletRequest request){
        return announcementService.release(announcement,request);
    }

    /**
     * 去审核公告页面
     */

    @RequestMapping(value = "toAuditAnnouncementPage")
    @Access(authorities = {"管理员"})
    public String toAuditAnnouncementPage(){
        return "announcement/auditAnnouncementPage";
    }

    /**
     * 查询未审核的公告
     * @param page
     * @param number
     * @return
     */
    @RequestMapping(value = "queryNoAuditInfo")
    @ResponseBody
    public String queryNoAuditInfo(Integer page, Integer number){
        return announcementService.queryNoAuditInfo(page,number);
    }

    /**
     * 审核
     */
    @RequestMapping(value = "auditAnnouncement")
    @ResponseBody
    @Access(authorities = {"管理员"})
        public Map<String,Object> auditAnnouncement(String id,Integer status){
            return announcementService.auditAnnouncement(id,status);
    }

    /**queryMyAuditInfo
     * 去我的公告页面
     */
    @RequestMapping(value = "toMyauditPage")
    public String toMyauditPage(){
        return "announcement/myauditPage";
    }

    /**
     * 查询我的发布信息
     */
    @RequestMapping(value = "queryMyAuditInfo")
    @ResponseBody
    public String queryMyAuditInfo(Integer page, Integer number,HttpServletRequest request){
        return announcementService.queryMyAuditInfo(page,number,request);
    }

}
