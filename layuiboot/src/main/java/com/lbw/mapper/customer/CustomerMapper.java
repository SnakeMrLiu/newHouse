package com.lbw.mapper.customer;

import com.lbw.pojo.customer.Customer;
import com.lbw.pojo.customer.Order;
import com.lbw.pojo.sellhouse.SellHouseResource;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
//客户条件查询
public interface CustomerMapper {

    @Select("<script>" +
            "SELECT COUNT(1) FROM t_customer where 1=1 "
            + "<if test='customerName != null '> and customerName like CONCAT(CONCAT('%',#{customerName}),'%')</if>"
            + "<if test='orderHouse != null '> and orderHouse like CONCAT(CONCAT('%',#{orderHouse}),'%') </if>"
           + "<if test='minTime != null'> and orderTime &gt;= #{minTime}</if>"
           + "<if test='maxTime != null'> and orderTime &lt;= #{maxTime}</if>"
            +"</script>")
    Integer queryCustomercount(Customer customer);
    //客户数据查询
    @Select("<script>" +
            "SELECT tc.id,tc.cid,tc.customerName,tc.customerPhone,tc.customerAge,tc.customerNeed,tc.orderTime,tc.orderNum,tcom.name as name \n" +
            "FROM t_customer tc \n" +
            "LEFT JOIN t_community tcom ON tcom.aid=tc.orderHouse \n" +
            "LEFT JOIN t_emp te ON te.id=tc.cid  where te.id=tc.cid"
            + "<if test='customer.customerName != null  '> and tc.customerName like  CONCAT(CONCAT('%',#{customer.customerName}),'%')</if>"
            + "<if test='customer.orderHouse != null   '> and tc.orderHouse like CONCAT(CONCAT('%',#{customer.orderHouse}),'%')</if>"
            +"<if test='customer.minTime != null'> and tc.orderTime &gt;= #{customer.minTime}</if>"
           +"<if test='customer.maxTime != null'> and tc.orderTime &lt;= #{customer.maxTime}</if> "
            +"limit #{page},#{number}"
            +"</script>")
    List<Customer> queryCustomer(@Param("page") Integer page, @Param("number") Integer number, @Param("customer") Customer customer);


    @Select("SELECT eid FROM t_sell_house_resource WHERE id = #{houseId}")
    SellHouseResource queryEmpByHouseId(String houseId);
    @Insert("INSERT INTO t_order(id,cid,eid,hid,orderTime) VALUES(#{id},#{cid},#{eid},#{hid},#{orderTime})")
    void insertOrderInfo(Order o);
}
