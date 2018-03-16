package com.jk.mapper.user;


import com.jk.util.entity.MenuDO;

import java.util.List;
import java.util.Map;

public interface MenuMapper {

    List<MenuDO> list(Map<String,Object> map);

    MenuDO get(Long id);

    int save(MenuDO menu);

    int remove(Long id);

    MenuDO getTreeById(Long id);

    int update(MenuDO menu);

    List<String> listUserPerms(Long userId);
}
