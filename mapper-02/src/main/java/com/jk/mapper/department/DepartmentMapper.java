package com.jk.mapper.department;

import com.jk.entity.user.DeptDO;


import java.util.List;
import java.util.Map;

public interface DepartmentMapper {
    List<DeptDO> list(Map<String,Object> map);

    int remove(Long deptId);

    DeptDO get(Long pId);

    int save(DeptDO sysDept);

    int update(DeptDO sysDept);

}
