package com.jk.controller.user;

import com.jk.entity.user.R;
import com.jk.service.user.RoleService;
import com.jk.util.entity.RoleDO;
import com.jk.util.poi.ExcelUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("role")
public class RoleController {
    @Autowired
    RoleService roleService;
    @RequiresPermissions("sys:role:role")
    @GetMapping("toroleList")
    String toroleList() {

        return "system/role/list";
    }
    @RequiresPermissions("sys:role:role")
    @GetMapping("list")
    @ResponseBody()
    List<RoleDO> list() {
        List<RoleDO> roles = roleService.list();
        return roles;
    }

    @RequiresPermissions("sys:role:add")
    @GetMapping("/toadd")
    String add() {
        return "system/role/add";
    }
    @RequiresPermissions("sys:role:add")
    @PostMapping("/save")
    @ResponseBody()
    R save(RoleDO role) {

        if (roleService.save(role) > 0) {
            return R.ok();
        } else {
            return R.error(1, "保存失败");
        }
    }
    @RequiresPermissions("sys:role:remove")
    @PostMapping("/remove")
    @ResponseBody()
    R save(Long id) {

        if (roleService.remove(id) > 0) {
            return R.ok();
        } else {
            return R.error(1, "删除失败");
        }
    }
    @RequiresPermissions("sys:role:edit")
    @GetMapping("/edit/{id}")
    String edit(@PathVariable("id") Long id, HttpServletRequest request) {
        RoleDO roleDO = roleService.get(id);
        request.setAttribute("role", roleDO);
        return "system/role/edit";
    }
    @RequiresPermissions("sys:role:edit")
    @PostMapping("/update")
    @ResponseBody()
    R update(RoleDO role) {

        if (roleService.update(role) > 0) {
            return R.ok();
        } else {
            return R.error(1, "保存失败");
        }
    }
    @RequiresPermissions("sys:role:batchRemove")
    @PostMapping("/batchRemove")
    @ResponseBody
    R batchRemove(@RequestParam("ids[]") Long[] ids) {

        int r = roleService.batchremove(ids);
        if (r > 0) {
            return R.ok();
        }
        return R.error();
    }

    @RequestMapping(value="exportexcel")
    @ResponseBody
    public void exportExcel(HttpServletRequest request, HttpServletResponse response, RoleDO roleDO) throws IOException {
        //内存中保留 10000 条数据，以免内存溢出，其余写入 硬盘
        // 第一步，创建一个webbook，对应一个Excel文件
        SXSSFWorkbook wb = new SXSSFWorkbook(10000);
        //获取总条数
        int count = roleService.getExcelCount(roleDO);
        //总页数
        int page = (int) Math.ceil(count / 100000)+1;
        //循环获取到的页数
        for (int i = 1; i <= page; i++) {
            System.out.println(i);

          /*  studentBean.setPage(i);
            studentBean.setRows(100000);
            studentBean.calculate();*/
            //在这里代表设置了每页放1W数据 放入这个集合中
            List<RoleDO> userList = roleService.getExcelList(roleDO);
            //wb代表内存中的数据
            // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
            Sheet sheet = wb.createSheet("sheet"+i);
            //设置导出的头部
            Row row = sheet.createRow(0);
            Cell cell = row.createCell(0);
            cell.setCellValue("ID");
            cell = row.createCell(1);
            cell.setCellValue("名称");
            cell = row.createCell(2);
            cell.setCellValue("用户名");
          /*  cell = row.createCell(3);
            cell.setCellValue("昵称");
            cell = row.createCell(4);
            cell.setCellValue("性别");
            cell = row.createCell(5);
            cell.setCellValue("年龄");
            cell = row.createCell(6);
            cell.setCellValue("注册时间");
            cell = row.createCell(7);
            cell.setCellValue("状态");*/
            //循环每一行 给每一行赋值 row代表行
            for (int j = 0; j < userList.size(); j++) {
                row = sheet.createRow(j+1);
                row.createCell(0).setCellValue(userList.get(j).getRoleId());
                row.createCell(1).setCellValue(userList.get(j).getRoleName());
                row.createCell(2).setCellValue(userList.get(j).getRoleSign());
            /*    row.createCell(3).setCellValue(userList.get(j).getUname());
                row.createCell(4).setCellValue(userList.get(j).getSex() == 0 ? "女":"男");
                row.createCell(5).setCellValue(userList.get(j).getAge());
                row.createCell(6).setCellValue(userList.get(j).getTime());
                row.createCell(7).setCellValue(userList.get(j).getStatus()==0?"正常":"冻结");*/
            }
        }
        System.out.println(request.getRealPath("/"));
        String pathh= request.getRealPath("/")+ UUID.randomUUID().toString().replaceAll("-", "")+".xlsx";
        OutputStream out = new FileOutputStream(new File(pathh));
        wb.write(out);
        System.out.println("完成");
        out.flush();
        out.close();
        wb.dispose();
        ExcelUtil.downloadFile(request, response,pathh,"信息表.xlsx");
        new File(pathh).delete();
    }



}
