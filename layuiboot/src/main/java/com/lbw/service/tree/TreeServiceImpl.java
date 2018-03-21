package com.lbw.service.tree;

import com.lbw.mapper.tree.TreeMapper;
import com.lbw.pojo.tree.Tree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TreeServiceImpl implements TreeService {

    @Autowired
    private TreeMapper treeMapper;

    @Override
    public List<Tree> getTree(String id) {
        return treeMapper.getTree(id);
    }
}
