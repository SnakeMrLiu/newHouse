package com.lbw.mapper.sellhouse;

import com.lbw.pojo.sellhouse.*;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Repository
@Mapper
public interface SellHouseMapper {
    @Insert("INSERT INTO t_sell_house_resource(id,eid,title,price,room,hall,toilet,area,community,province,city,county,buildingTime,roomType,roomDirection,floor,decorate,unitPrice,monthlyPayments,sellingPoint,ownerMentality,communityComplete,serviceIntroduce,releaseTime,roomNum) VALUES(#{id},#{eid},#{title},#{price},#{room},#{hall},#{toilet},#{area},#{community}, #{province},#{city},#{county},#{buildingTime},#{roomType},#{roomDirection},#{floor},#{decorate}, #{unitPrice},#{monthlyPayments},#{sellingPoint},#{ownerMentality},#{communityComplete},#{serviceIntroduce},#{releaseTime},#{roomNum})")
    void addHouseInfo(SellHouseResource sellHouseResource);

    @Select("SELECT id,NAME FROM t_community")
    List<Community> queryCommunity();

    @Select("SELECT * FROM t_area WHERE pid = #{pid}")
    List<Area> queryArea(Integer pid);

    @Select("<script>" +
            "SELECT tshr.id,tshr.eid,tshr.title,tshr.price,tshr.room,tshr.hall,te.name ename,tshr.toilet,tshr.AREA,tc.name garden,tshr.province,tshr.city,tshr.county,tshr.buildingTime,tht.name houseType,tshr.roomDirection,tshr.FLOOR,td.name fitment,tshr.unitPrice,tshr.monthlyPayments,tshr.sellingPoint,tshr.ownerMentality,tshr.communityComplete,tshr.serviceIntroduce,tshr.releaseTime,tshr.roomNum,tshr.rent \n" +
            "FROM t_sell_house_resource tshr\n" +
            "LEFT JOIN t_community tc ON tc.id=tshr.community \n" +
            "LEFT JOIN t_decorate td ON  td.id=tshr.decorate \n" +
            "LEFT JOIN t_emp te ON te.id=tshr.eid \n" +
            "LEFT JOIN t_house_type tht ON tht.id=tshr.roomType where 1=1 \n"+
            "<if test='houseResource.province != null and houseResource.province!= -1'> and tshr.province =#{houseResource.province}</if>"+
            "<if test='houseResource.city != null and houseResource.city!= -1'> and tshr.city =#{houseResource.city}</if>"+
            "<if test='houseResource.county != null and houseResource.county!= -1'> and tshr.county =#{houseResource.county}</if>"+
            "<if test='houseResource.minprice != null and houseResource.minprice != -1'> and tshr.price &gt;= #{houseResource.minprice}</if>"+
            "<if test='houseResource.maxprice != null and houseResource.maxprice != -1'> and tshr.price &lt;= #{houseResource.maxprice}</if>"+
            "<if test='houseResource.room != null and houseResource.room!= -1'> and tshr.room =#{houseResource.room}</if>"+
            "<if test='houseResource.buildingTime != null and houseResource.buildingTime != -1 '> and tshr.buildingTime =#{houseResource.buildingTime}</if>"+
            "<if test='houseResource.roomType != -1 and houseResource.roomType != null '> and tshr.roomType =#{houseResource.roomType}</if>"+
            "<if test='houseResource.decorate != -1 and houseResource.decorate != null '> and tshr.decorate =#{houseResource.decorate}</if>"+
            "<if test='houseResource.minarea != null and houseResource.minarea != -1'> and tshr.area &gt;= #{houseResource.minarea}</if>"+
            "<if test='houseResource.maxarea != null and houseResource.maxarea != -1'> and tshr.area &lt;= #{houseResource.maxarea}</if> "+
            "limit #{page},#{number}"
            +"</script>")
    List<SellHouseResource> queryHouse(@Param(value = "page") Integer page, @Param(value = "number") Integer number,@Param(value = "houseResource")SellHouseResource houseResource);

    @Select("<script>" +
            "SELECT COUNT(1) FROM t_sell_house_resource where 1=1 "
            + "<if test='province != null and province != -1'> and province =#{province}</if>"
            + "<if test='city != null and city != -1'> and city =#{city}</if>"
            + "<if test='county != null and county != -1'> and county =#{county}</if>"
            + "<if test='minprice != null and minprice != -1'> and price &gt;= #{minprice}</if>"
            + "<if test='maxprice != null and maxprice != -1'> and price &lt;= #{maxprice}</if>"
            + "<if test='room != null and room != -1 '> and room =#{room}</if>"
            + "<if test='buildingTime != null and buildingTime != -1 '> and buildingTime =#{buildingTime}</if>"
            + "<if test='roomType != -1 and  roomType!=null '> and roomType =#{roomType}</if>"
            + "<if test='decorate != -1 and  decorate!=null '> and decorate =#{decorate}</if>"
            + "<if test='minarea != null and minarea != -1'> and area &gt;= #{minarea}</if>"
            + "<if test='maxarea != null and maxarea != -1'> and area &lt;= #{maxarea}</if>"
            +"</script>")
    Integer queryHouseCount(SellHouseResource houseResource);

    @Delete("delete from t_sell_house_resource where id = #{id}")
    void deleteHouseOne(String id);

    @Select("SELECT tshr.id,tshr.eid,tshr.title,tshr.price,tshr.room,tshr.hall,te.name ename,tshr.toilet,tshr.AREA,tc.name garden,tshr.province,tshr.city,tshr.county,tshr.buildingTime,tht.name houseType,tshr.roomDirection,tshr.FLOOR,td.name fitment,tshr.unitPrice,tshr.monthlyPayments,tshr.sellingPoint,tshr.ownerMentality,tshr.communityComplete,tshr.serviceIntroduce,tshr.releaseTime,tshr.roomNum,te.name empname,te.weixin empweixin,te.photo empphoto,te.loginnumber empphone\n" +
            " FROM t_sell_house_resource tshr\n" +
            " LEFT JOIN t_community tc ON tc.id=tshr.community\n" +
            " LEFT JOIN t_decorate td ON  td.id=tshr.decorate\n" +
            " LEFT JOIN t_emp te ON te.id=tshr.eid\n" +
            " LEFT JOIN t_house_type tht ON tht.id=tshr.roomType\n" +
            " WHERE tshr.id=#{id}")
    SellHouseResource queryOneHouse(String id);

    @Insert( "<script>"
            + "INSERT INTO t_sell_house_pic(id,sid,url,imgtype) VALUES"
            + "<foreach item='img' index='index' collection='list' separator=','>"
            + "(#{img.id},#{img.sid},#{img.url},#{img.imgtype})"
            + "</foreach>"
            +"</script>")
    void addPhoto(@Param("list") List<SellHousePic> list);
    @Select("SELECT NAME FROM t_area WHERE id = #{id}")
    Area querySheng(Integer id);

    /**
     * 查询房屋类型
     * @return
     */
    @Select("select id,name from t_house_type ")
    List<HouseType> queryHouseType();
    /**
     * 查询装修程度
     * @return
     */
    @Select("select id,name from t_decorate")
    List<Decorate> queryDecorate();
    /**
     *修改之回显
     */
    @Select("SELECT tshr.id,tshr.eid,tshr.title,tshr.price,tshr.room,tshr.hall,te.name ename,tshr.toilet,tshr.AREA,tshr.community,tshr.province,tshr.city,tshr.county,tshr.buildingTime,tshr.roomType,tshr.roomDirection,tshr.FLOOR,tshr.decorate,tshr.unitPrice,tshr.monthlyPayments,tshr.sellingPoint,tshr.ownerMentality,tshr.communityComplete,tshr.serviceIntroduce,tshr.releaseTime,tshr.roomNum \n" +
            "FROM t_sell_house_resource tshr\n" +
            "LEFT JOIN t_community tc ON tc.id=tshr.id \n" +
            "LEFT JOIN t_decorate td ON  td.id=tshr.id \n" +
            "LEFT JOIN t_emp te ON te.id=tshr.eid \n" +
            "LEFT JOIN t_house_type tht ON tht.id=tshr.id \n" +
            "where tshr.id=#{id}")
    SellHouseResource getHouseByid(String id);
    /**
     * 修改
     */
    @Update("UPDATE t_sell_house_resource SET \n" +
            "eid=#{eid} ,\n" +
            "title=#{title},\n" +
            "price=#{price},\n" +
            "room=#{room},\n" +
            "hall=#{hall},\n" +
            "toilet=#{toilet},\n" +
            "AREA=#{area},\n" +
            "community=#{community},\n" +
            "province=#{province},\n" +
            "city=#{city},\n" +
            "county=#{county},\n" +
            "buildingTime=#{buildingTime},\n" +
            "roomType=#{roomType},\n" +
            "roomDirection=#{roomDirection},\n" +
            "FLOOR=#{floor},\n" +
            "decorate=#{decorate},\n" +
            "unitPrice=#{unitPrice},\n" +
            "monthlyPayments=#{monthlyPayments},\n" +
            "sellingPoint=#{sellingPoint},\n" +
            "ownerMentality=#{ownerMentality},\n" +
            "communityComplete=#{communityComplete},\n" +
            "serviceIntroduce=#{serviceIntroduce},\n" +
            "roomNum=#{roomNum}\n" +
            "WHERE id=#{id}")
    void updateHouseInfo(SellHouseResource sellhouseresource);

    //查询回显图片
    @Select(value = "SELECT * FROM t_sell_house_pic WHERE sid = #{sid}")
    List<SellHousePic> queryImg(String sid);

    @Delete("delete from t_sell_house_pic where sid =#{id} and imgtype = #{imgtype}")
    void delPhpoto(@Param("id") String id, @Param("imgtype")String imgtype);

    @Select("SELECT p.url FROM t_sell_house_pic p LEFT JOIN t_sell_house_resource h ON p.sid = h.id WHERE h.id = #{sid} AND p.imgtype = #{type}")
    List<String> slideshow(@Param("type")Integer type,@Param("sid")String sid);
    @Select("SELECT COUNT(1) FROM t_sell_house_pic WHERE imgtype = 1 AND sid = #{houseId}")
    Integer queryOneTypeCount(String houseId);
    @Select("SELECT COUNT(1) FROM t_sell_house_pic WHERE imgtype = 2 AND sid = #{houseId}")
    Integer queryTwoTypeCount(String houseId);
    @Select("SELECT COUNT(1) FROM t_sell_house_pic WHERE imgtype = 3 AND sid = #{houseId}")
    Integer queryThreeTypeCount(String houseId);

    //我的发布
    @Select("<script>" +
            "SELECT COUNT(1) FROM t_sell_house_resource tshr LEFT JOIN t_emp te ON te.id=tshr.eid WHERE tshr.eid=#{id}"+
            "<if test='houseResource.province != null and houseResource.province!= -1'> and tshr.province =#{houseResource.province}</if>"+
            "<if test='houseResource.city != null and houseResource.city!= -1'> and tshr.city =#{houseResource.city}</if>"+
            "<if test='houseResource.county != null and houseResource.county!= -1'> and tshr.county =#{houseResource.county}</if>"+
            "<if test='houseResource.minprice != null and houseResource.minprice != -1'> and tshr.price &gt;= #{houseResource.minprice}</if>"+
            "<if test='houseResource.maxprice != null and houseResource.maxprice != -1'> and tshr.price &lt;= #{houseResource.maxprice}</if>"+
            "<if test='houseResource.room != null and houseResource.room!= -1'> and tshr.room =#{houseResource.room}</if>"+
            "<if test='houseResource.buildingTime != null and houseResource.buildingTime != -1 '> and tshr.buildingTime =#{houseResource.buildingTime}</if>"+
            "<if test='houseResource.roomType != -1 and houseResource.roomType != null '> and tshr.roomType =#{houseResource.roomType}</if>"+
            "<if test='houseResource.decorate != -1 and houseResource.decorate != null '> and tshr.decorate =#{houseResource.decorate}</if>"+
            "<if test='houseResource.minarea != null and houseResource.minarea != -1'> and tshr.area &gt;= #{houseResource.minarea}</if>"+
            "<if test='houseResource.maxarea != null and houseResource.maxarea != -1'> and tshr.area &lt;= #{houseResource.maxarea}</if> "+
            "</script>")
    Integer queryMyHouseCount(@Param(value = "houseResource")SellHouseResource houseResource,@Param(value = "id")String id);
    @Select("<script>" +
            "SELECT tshr.id,tshr.eid,tshr.title,tshr.price,tshr.room,tshr.hall,te.name ename,tshr.toilet,tshr.AREA,tc.name garden,tshr.province,tshr.city,tshr.county,tshr.buildingTime,tht.name houseType,tshr.roomDirection,tshr.FLOOR,td.name fitment,tshr.unitPrice,tshr.monthlyPayments,tshr.sellingPoint,tshr.ownerMentality,tshr.communityComplete,tshr.serviceIntroduce,tshr.releaseTime,tshr.roomNum \n" +
            "FROM t_sell_house_resource tshr\n" +
            "LEFT JOIN t_community tc ON tc.id=tshr.community \n" +
            "LEFT JOIN t_decorate td ON  td.id=tshr.decorate \n" +
            "LEFT JOIN t_emp te ON te.id=tshr.eid \n" +
            "LEFT JOIN t_house_type tht ON tht.id=tshr.roomType where tshr.eid=#{id} \n"+
            "<if test='houseResource.province != null and houseResource.province!= -1'> and tshr.province =#{houseResource.province}</if>"+
            "<if test='houseResource.city != null and houseResource.city!= -1'> and tshr.city =#{houseResource.city}</if>"+
            "<if test='houseResource.county != null and houseResource.county!= -1'> and tshr.county =#{houseResource.county}</if>"+
            "<if test='houseResource.minprice != null and houseResource.minprice != -1'> and tshr.price &gt;= #{houseResource.minprice}</if>"+
            "<if test='houseResource.maxprice != null and houseResource.maxprice != -1'> and tshr.price &lt;= #{houseResource.maxprice}</if>"+
            "<if test='houseResource.room != null and houseResource.room!= -1'> and tshr.room =#{houseResource.room}</if>"+
            "<if test='houseResource.buildingTime != null and houseResource.buildingTime != -1 '> and tshr.buildingTime =#{houseResource.buildingTime}</if>"+
            "<if test='houseResource.roomType != -1 and houseResource.roomType != null '> and tshr.roomType =#{houseResource.roomType}</if>"+
            "<if test='houseResource.decorate != -1 and houseResource.decorate != null '> and tshr.decorate =#{houseResource.decorate}</if>"+
            "<if test='houseResource.minarea != null and houseResource.minarea != -1'> and tshr.area &gt;= #{houseResource.minarea}</if>"+
            "<if test='houseResource.maxarea != null and houseResource.maxarea != -1'> and tshr.area &lt;= #{houseResource.maxarea}</if> "+
            "limit #{page},#{number}"
            +"</script>")
    List<SellHouseResource> queryMyHouse(@Param(value = "page") Integer page, @Param(value = "number") Integer number,@Param(value = "houseResource")SellHouseResource houseResource,@Param(value = "id")String id);
    @Select("SELECT * FROM t_sell_house_resource WHERE STATUS = 1 LIMIT #{page},#{number}")
    List<SellHouseResource> queryUnrentableHouse(@Param(value = "page") Integer page, @Param(value = "number") Integer number);

    @Select("SELECT COUNT(1) FROM t_sell_house_resource WHERE STATUS = 1")
    Integer queryUnrentableHouseCount();

}
