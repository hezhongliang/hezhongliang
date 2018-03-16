package com.jk.mapper.user;



import com.jk.util.entity.UserDO;

import java.util.List;
import java.util.Map;

public interface SysuserMapper {
    List<UserDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);
}
