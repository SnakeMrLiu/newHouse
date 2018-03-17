package com.lbw.mapper.sellhouse;

import com.lbw.pojo.house.SellHouseResource;

public class TutorDynaSqlProvider {
    public String findTutorByIdSql(SellHouseResource houseResource)
    {
        StringBuffer sql = new StringBuffer("SELECT COUNT(1) FROM t_sell_house_resource where 1=1");

        if(houseResource!=null){
            if(houseResource.getProvince()!=null){
                sql.append("and province = "+ houseResource.getProvince());
            }
        }
        return sql.toString();
    }

}
