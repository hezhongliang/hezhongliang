package com.jk.service.user;

import com.jk.util.entity.MenuDO;

import com.jk.util.common.Tree;

import java.util.List;
import java.util.Set;

public interface MenuService {
    Tree<MenuDO> getTree1();
    Tree<MenuDO> getTree(Long id);

    List<MenuDO> list();

    MenuDO get(Long id);

    int save(MenuDO menu);


    int remove(Long id);

    MenuDO getTreeById(Long id);

    int update(MenuDO menu);

    Set<String> listPerms(Long userId);
}
