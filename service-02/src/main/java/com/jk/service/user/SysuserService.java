package com.jk.service.user;

import com.jk.util.entity.UserDO;


import java.util.List;
import java.util.Map;

public interface SysuserService {
    List<UserDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    UserDO get(Long id);

    int update(UserDO user);

    int remove(Long userId);

    int save(UserDO user);
}
