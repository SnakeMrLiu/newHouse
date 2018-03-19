package com.lbw.mapper.customer;

import com.lbw.pojo.customer.Order;
import com.lbw.pojo.sellhouse.SellHouseResource;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

@Mapper
@Component
public interface CustomerMapper {
    /**
     * 根据房源id查询出房源信息
     * @param houseId
     * @return
     */
    @Select("SELECT eid FROM t_sell_house_resource WHERE id = #{houseId}")
    SellHouseResource queryHouseInfoByHouseId(String houseId);

    /**
     * 预约信息
     * @param o
     */
    @Insert("INSERT INTO t_order(id,cid,eid,hid,orderTime) VALUES(#{id},#{cid},#{eid},#{hid},#{orderTime})")
    void insertOrderInfo(Order o);
}
