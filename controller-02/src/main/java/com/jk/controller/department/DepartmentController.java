package com.jk.controller.department;


import com.jk.entity.user.DeptDO;
import com.jk.entity.user.R;
import com.jk.service.department.DepartmentService;
import com.jk.util.common.ConstantTest;
import com.jk.util.common.Tree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("demp")
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;
    @RequestMapping("toDempListPage")
    public String toDempListPage() {
            return "system/dept/dept";
    }
    @ResponseBody
    @GetMapping("list")
    public List<DeptDO> list() {
        Map<String, Object> query = new HashMap<>(16);
        List<DeptDO> sysDeptList = departmentService.list(query);
        return sysDeptList;
    }







    @PostMapping("remove")
    @ResponseBody
    public R remove(Long deptId) {

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("parentId", deptId);
   /* if(departmentService.count(map)>0) {
        return R.error(1, "包含下级部门,不允许修改");
    }
    if(departmentService.checkDeptHasUser(deptId)) {
        if (departmentService.remove(deptId) > 0) {
            return R.ok();
        }
    }else {
        return R.error(1, "部门包含用户,不允许修改");
    }*/
        int n=departmentService.remove(deptId);
        if(n>0){
            return R.ok();
        }else {
            return R.error();
        }
    }

    @GetMapping("add/{pId}")
    String add(@PathVariable("pId") Long pId, HttpServletRequest request) {
        request.setAttribute("pId", pId);
        if (pId == 0) {
            request.setAttribute("pName", "总部门");
        } else {
            request.setAttribute("pName", departmentService.get(pId).getName());
        }
        return  "system/dept/add";
    }
    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("save")
    public R save(DeptDO sysDept) {

        if (departmentService.save(sysDept) > 0) {
            return R.ok();
        }
        return R.error();
    }

    @GetMapping("edit/{deptId}")
    String edit(@PathVariable("deptId") Long deptId, HttpServletRequest request) {
        System.out.println(deptId);

        DeptDO sysDept = departmentService.get(deptId);
        request.setAttribute("sysDept", sysDept);
        if(ConstantTest.DEPT_ROOT_ID.equals(sysDept.getParentId())) {
            request.setAttribute("parentDeptName", "无");
        }else {
            DeptDO parDept = departmentService.get(sysDept.getParentId());
            request.setAttribute("parentDeptName",parDept.getName());
        }
        return  "system/dept/edit";
    }


      /*修改*/

    @ResponseBody
    @RequestMapping("update")
    public R update(DeptDO sysDept) {
        if (departmentService.update(sysDept) > 0) {
            return R.ok();
        }
        return R.error();
    }

    @GetMapping("/tree")
    @ResponseBody
    public Tree<DeptDO> tree() {
        Tree<DeptDO> tree = new Tree<DeptDO>();
        tree = departmentService.getTree();
        return tree;
    }
    //新增树查询
    @GetMapping("treeView")
    String treeView() {
        return  "system/dept/deptTree";
    }
}
