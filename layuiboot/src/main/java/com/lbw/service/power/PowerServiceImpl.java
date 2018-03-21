package com.lbw.service.power;

import com.lbw.mapper.power.PowerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class PowerServiceImpl implements PowerService{

    @Autowired
    private PowerMapper powerMapper;


    @Override
    public String getpowerInfo(String id) {

        String s = powerMapper.getpowerInfo(id);

        return s;
    }

}
