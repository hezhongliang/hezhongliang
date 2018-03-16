package com.jk.mapper.user;

import com.jk.util.entity.RoleMenuDO;

import java.util.List;

public interface RoleMenuMapper {
    void removeByRoleId(Long roleId);

    void batchSave(List<RoleMenuDO> rms);

    List<Long> listMenuIdByRoleId(Long id);
}
