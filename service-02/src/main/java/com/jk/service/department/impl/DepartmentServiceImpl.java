package com.jk.service.department.impl;

import com.jk.entity.user.DeptDO;
import com.jk.mapper.department.DepartmentMapper;
import com.jk.service.department.DepartmentService;
import com.jk.util.common.BuildTree;
import com.jk.util.common.Tree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;


    @Override
    public List<DeptDO> list(Map<String, Object> map) {
        return departmentMapper.list(map);
    }





    @Override
    public int remove(Long deptId) {
        return departmentMapper.remove(deptId);
    }

    @Override
    public DeptDO get(Long pId) {
        return departmentMapper.get(pId);
    }

    @Override
    public int save(DeptDO sysDept) {
        return departmentMapper.save(sysDept);
    }

    @Override
    public int update(DeptDO sysDept) {
        return departmentMapper.update(sysDept);
    }

    @Override
    public Tree<DeptDO> getTree() {
        List<Tree<DeptDO>> trees = new ArrayList<Tree<DeptDO>>();
        List<DeptDO> sysDepts = departmentMapper.list(new HashMap<String,Object>(16));
        for (DeptDO sysDept : sysDepts) {
            Tree<DeptDO> tree = new Tree<DeptDO>();
            tree.setId(sysDept.getDeptId().toString());
            tree.setParentId(sysDept.getParentId().toString());
            tree.setText(sysDept.getName());
            Map<String, Object> state = new HashMap<>(16);
            state.put("opened", true);
            tree.setState(state);
            trees.add(tree);
        }
        // 默认顶级菜单为０，根据数据库实际情况调整
        Tree<DeptDO> t = BuildTree.build(trees);
        return t;
    }
}
