package com.jk.mapper.user;

import com.jk.util.entity.RoleDO;


import java.util.HashMap;
import java.util.List;

public interface RoleMapper {

    List<RoleDO> list(HashMap<Object, Object> objectObjectHashMap);

    int save(RoleDO role);

    int remove(Long id);

    RoleDO get(Long id);

    int update(RoleDO role);

    int batchRemove(Long[] ids);

    int getExcelCount(RoleDO roleDO);

    List<RoleDO> getExcelList(RoleDO roleDO);
}
