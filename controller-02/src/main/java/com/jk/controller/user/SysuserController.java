package com.jk.controller.user;

import com.jk.util.entity.RoleDO;
import com.jk.util.entity.UserDO;

import com.jk.entity.user.PageUtils;
import com.jk.entity.user.Query;
import com.jk.entity.user.R;
import com.jk.service.user.RoleService;
import com.jk.service.user.SysuserService;
import com.jk.util.file.Constant;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("sysuser")
public class SysuserController {
    @Autowired
    SysuserService sysuserService;
    @Autowired
    RoleService roleService;
    @RequiresPermissions("sys:user:user")
    @GetMapping("tosysuserList")
    String tosysuserList(){
        return "system/user/user";
    }
    @GetMapping("/list")
    @ResponseBody
    PageUtils list(@RequestParam Map<String, Object> params) {
        // 查询列表数据
        Query query = new Query(params);
        List<UserDO> sysUserList = sysuserService.list(query);
        int total = sysuserService.count(query);
        PageUtils pageUtil = new PageUtils(sysUserList, total);
        return pageUtil;
    }
   //跳转 vc
   @RequiresPermissions("sys:user:edit")
    @GetMapping("/toedit/{id}")
    String edit(HttpServletRequest request, @PathVariable("id") Long id) {
        UserDO userDO = sysuserService.get(id);
        request.setAttribute("user", userDO);
        List<RoleDO> roles = roleService.list(id);
        request.setAttribute("roles", roles);
        return "system/user/edit";
    }
    //用户修改
    @RequiresPermissions("sys:user:edit")
    @PostMapping("/update")
    @ResponseBody
    R update(UserDO user) {

        if (sysuserService.update(user) > 0) {
            return R.ok();
        }
        return R.error();
    }

   //"添加用户"
   @RequiresPermissions("sys:user:add")
    @GetMapping("/add")
    String add(Model model) {
        List<RoleDO> roles = roleService.list();
        model.addAttribute("roles", roles);
        return "system/user/add";
    }

   //新增树查询
    @GetMapping("treeView")
    String treeView() {
        return  "system/dept/deptTree";
    }

    //删除
    @RequiresPermissions("sys:user:remove")
    @PostMapping("/remove")
    @ResponseBody
    R remove(Long id) {
        if (sysuserService.remove(id) > 0) {
            return R.ok();
        }
        return R.error();
    }
    @RequiresPermissions("sys:user:add")
    @PostMapping("/save")
    @ResponseBody
    R save(UserDO user) {
        if (sysuserService.save(user) > 0) {
            return R.ok();
        }
        return R.error();
    }


}
