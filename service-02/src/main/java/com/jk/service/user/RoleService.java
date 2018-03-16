package com.jk.service.user;

import com.jk.util.entity.RoleDO;

import java.util.List;

public interface RoleService {
    List<RoleDO> list(Long userId);
    List<RoleDO> list();

    int save(RoleDO role);

    int remove(Long id);

    RoleDO get(Long id);

    int update(RoleDO role);

    int batchremove(Long[] ids);

    int getExcelCount(RoleDO roleDO);

    List<RoleDO> getExcelList(RoleDO roleDO);

}
