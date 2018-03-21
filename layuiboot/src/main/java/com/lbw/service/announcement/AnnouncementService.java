package com.lbw.service.announcement;

import com.lbw.pojo.announcement.Announcement;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public interface AnnouncementService {
    String queryAnnouncement(Integer page, Integer number);

    Map<String,Object> release(Announcement announcement,HttpServletRequest request);

    Map<String,Object> auditAnnouncement(String id, Integer status);

    String queryNoAuditInfo(Integer page, Integer number);

    String queryMyAuditInfo(Integer page, Integer number,HttpServletRequest request);
}
