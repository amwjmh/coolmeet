package com.iths.controller.administration;

import com.iths.pojo.Department;
import com.iths.pojo.Meetingroom;
import com.iths.service.IDepartmentService;
import com.iths.service.IMeetingroomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/10/7 14:46
 *
 * 部门增删改查
 */
@Controller
@RequestMapping("/admin")
public class AdminDepartmentManagementController {

    @Autowired
    private IDepartmentService departmentService;

/*部门*/
    //跳转并查询所有
    @RequestMapping("/jumpdepartment")
    public String jumpDepartment(Model model){
        List<Department> departments = departmentService.queryAllDepartment();
        model.addAttribute("list",departments);
        return "departments";
    }

    //新增部门
    @RequestMapping("/increasedepartment")
    public  String increaseDepartment(Department department){
        departmentService.insertDepartment(department);
        return "forward:/admin/jumpdepartment";
    }

    /**
     * 删除部门
     * @param departmentid 获取id
     * @return 转发部门管理 --刷新
     */
    @RequestMapping("/deletedepartment")
    public String deleteDepartment(Integer departmentid){
        departmentService.deleteDepartment(departmentid);
        return "forward:/admin/jumpdepartment";
    }

    /**
     * 修改部门名称
     * @param department 条件&& 改变后的值
     * @return 转发部门管理 --刷新
     */
    @RequestMapping("/updatedepartment")
    public String updateDepartment(Department department){
        departmentService.updateDepartment(department);
        return "forward:/admin/jumpdepartment";
    }


}
