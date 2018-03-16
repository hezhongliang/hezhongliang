package com.jk.mapper.user;

import com.jk.util.entity.UserRoleDO;


import java.util.List;

public interface UserRoleMapper {
    List<Long> listRoleId(Long userId);

    void removeByUserId(Long userId);

    void batchSave(List<UserRoleDO> list);
}
