package com.jk.controller.user;

import com.jk.entity.user.R;
import com.jk.service.user.MenuService;
import com.jk.util.common.Tree;
import com.jk.util.entity.MenuDO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("menu")
public class MenuController {
    @Autowired
    MenuService menuService;
    @GetMapping("/tree")
    @ResponseBody
    Tree<MenuDO> tree() {
        Tree<MenuDO> tree = new Tree<MenuDO>();
        tree = menuService.getTree1();
        return tree;
    }
    @GetMapping("/tree1/{roleId}")
    @ResponseBody
    Tree<MenuDO> tree(@PathVariable("roleId") Long roleId) {
        Tree<MenuDO> tree = new Tree<MenuDO>();
        tree = menuService.getTree(roleId);
        return tree;
    }

    @RequiresPermissions("sys:menu:menu")
    @GetMapping("tomenuList")
    String menu() {
        return "/system/menu/menu";
    }
    @RequiresPermissions("sys:menu:menu")
    @RequestMapping("/list")
    @ResponseBody
    List<MenuDO> list() {
        List<MenuDO> menus = menuService.list();
        return menus;
    }
    @RequiresPermissions("sys:menu:add")
    @GetMapping("add/{pId}")
    String add(Model model, @PathVariable("pId") Long pId) {
        model.addAttribute("pId", pId);
        if (pId == 0) {
            model.addAttribute("pName", "根目录");
        } else {
            model.addAttribute("pName", menuService.get(pId).getName());
        }
        return "/system/menu/add";
    }
    @RequiresPermissions("sys:menu:remove")
    @PostMapping("/remove")
    @ResponseBody
    R remove(Long id) {
        if (menuService.remove(id) > 0) {
            return R.ok();
        } else {
            return R.error(1, "删除失败");
        }
    }

    @GetMapping("toFont")
    String toFont(){
        return "/system/menu/FontIcoList";
    }
    @RequiresPermissions("sys:menu:add")
    @PostMapping("/save")
    @ResponseBody
    R save(MenuDO menu) {
        if (menuService.save(menu) > 0) {
            return R.ok();
        } else {
            return R.error(1, "保存失败");
        }
    }
    @RequiresPermissions("sys:menu:edit")
    @GetMapping("/edit/{id}")
    String edit(Model model, @PathVariable("id") Long id) {
        MenuDO mdo = menuService.getTreeById(id);
        Long pId = mdo.getParentId();
        model.addAttribute("pId", pId);
        if (pId == 0) {
            model.addAttribute("pName", "根目录");
        } else {
            model.addAttribute("pName", menuService.get(pId).getName());
        }
        model.addAttribute("menu", mdo);
        return "/system/menu/edit";
    }
    @RequiresPermissions("sys:menu:edit")
    @PostMapping("/update")
    @ResponseBody
    R update(MenuDO menu) {
        if (menuService.update(menu) > 0) {
            return R.ok();
        } else {
            return R.error(1, "保存失败");
        }
    }


}
