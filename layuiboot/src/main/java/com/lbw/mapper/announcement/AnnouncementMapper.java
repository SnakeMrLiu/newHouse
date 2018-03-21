package com.lbw.mapper.announcement;

import com.lbw.pojo.announcement.Announcement;
import com.lbw.pojo.power.EmpRole;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface AnnouncementMapper {
    @Select("SELECT a.id,a.title,a.content,a.eid,e.name ename,a.status,a.time FROM t_announcement a LEFT JOIN t_emp e ON a.eid = e.id  WHERE status = 2 ORDER BY time DESC LIMIT #{page},#{number}")
    List<Announcement> queryAnnouncement(@Param("page") Integer page,@Param("number") Integer number);
    @Select("SELECT COUNT(1) FROM t_announcement a LEFT JOIN t_emp e ON a.eid = e.id  WHERE status = 2")
    Long queryAnnouncementCount();
    @Select("SELECT ter.role_id FROM t_emp_role ter LEFT JOIN t_emp te ON te.id = ter.emp_id WHERE ter.emp_id = #{eid}")
    String queryRoleByEmpId(String eid);
    @Insert("INSERT INTO t_announcement(id,title,content,eid,status,time) VALUES(#{id},#{title},#{content},#{eid},#{status},#{time})")
    void insertRelease(Announcement announcement);
    @Update("UPDATE t_announcement SET status = #{status} WHERE id= #{id}")
    void auditAnnouncement(@Param("id") String id, @Param("status")Integer status);
    @Select("SELECT a.id,a.title,a.content,a.eid,e.name ename,a.status,a.time FROM t_announcement a LEFT JOIN t_emp e ON a.eid = e.id  WHERE status = 1 ORDER BY time DESC LIMIT #{page},#{number}")
    List<Announcement> queryNoAuditInfo(@Param("page") Integer page,@Param("number") Integer number);
    @Select("SELECT COUNT(1) FROM t_announcement a LEFT JOIN t_emp e ON a.eid = e.id  WHERE status = 1")
    Long queryNoAuditInfoCount();
    @Select("SELECT id,title,content,eid,status,time FROM t_announcement WHERE eid = #{eid} ORDER BY time DESC LIMIT #{page},#{number}")
    List<Announcement> queryMyAuditInfo(@Param("page") Integer page,@Param("number") Integer number,@Param("eid")String eid);
    @Select("SELECT COUNT(1) FROM t_announcement WHERE eid = #{eid}")
    Long queryMyAuditInfoCount(@Param("eid")String eid);
}
