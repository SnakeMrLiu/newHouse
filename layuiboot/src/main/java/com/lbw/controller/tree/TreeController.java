package com.lbw.controller.tree;

import com.lbw.pojo.tree.Tree;
import com.lbw.service.tree.TreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "tree")
public class TreeController {

    @Autowired
    private TreeService treeService;
    //首页加载树
    @RequestMapping(value = "getTree")
    @ResponseBody
    public List<Map<String, Object>> getTree(){
        List<Tree> list = treeService.getTree();
        List<Map<String, Object>> list2 = getMap(list,0);
        return list2;
    }
    //树的迭代
    public List<Map<String, Object>> getMap(List<Tree> list, Integer id){
        List<Map<String, Object>> newList = new ArrayList<Map<String, Object>>();
        for (int i = 0; i < list.size(); i++) {
            Map<String , Object> map = null;
            Tree t = list.get(i);
            if (t.getPid() == id) {
                map = new HashMap<String , Object>();
                map.put("id", t.getId());
                map.put("title", t.getTitle());
                map.put("href", t.getHref());
                map.put("icon", t.getIcon());
                map.put("spread", t.getSpread());
                map.put("pid",t.getPid());
                map.put("children", getMap(list,t.getId()));
            }
            if (map != null) {
                //获取children的数据
                List<Map<String,Object>> l = (List<Map<String, Object>>) map.get("children");
                if (l.size() == 0) {
                    map.remove("children");
                }
                newList.add(map);
            }
        }
        return newList;
    }
    //跳转到首页
    @RequestMapping(value = "toIndex",method = RequestMethod.GET)
    public String toIndex(){
        return "index";
    }

}
