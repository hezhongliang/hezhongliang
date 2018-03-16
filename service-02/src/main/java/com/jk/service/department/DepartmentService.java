package com.jk.service.department;

import com.jk.entity.user.DeptDO;
import com.jk.util.common.Tree;

import java.util.List;
import java.util.Map;

public interface DepartmentService  {

    List<DeptDO> list(Map<String, Object> map);

    int remove(Long deptId);

    DeptDO get(Long pId);

    int save(DeptDO sysDept);

    int update(DeptDO sysDept);

    Tree<DeptDO> getTree();
}
