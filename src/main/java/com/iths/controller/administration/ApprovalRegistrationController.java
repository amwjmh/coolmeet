package com.iths.controller.administration;

import com.iths.controller.management.ManagementContrller;
import com.iths.pojo.Employee;
import com.iths.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/10/7 18:27
 * 注册审批
 */
@Controller
@RequestMapping("/admin")
public class ApprovalRegistrationController {

    public static  final  String STATUS_ADOPT = "1";

    @Autowired
    private IEmployeeService employeeService;

    /**
     * 获取未审批用户
     * @param model
     * @return 返回注册审批视图
     */
    @RequestMapping("/approveaccount")
    public String approveaccount(Model model){
        List<Employee> employees = employeeService.queryEmployeeByStatus(ManagementContrller.STATUS_DEFAULT);
        model.addAttribute("emps",employees);
        System.out.println(employees);
        return "approveaccount";
    }

    /**
     * 审批通过
     * @param employee
     * @return
     */
    @RequestMapping("/adopt")
    public String approvalAdopt(Employee employee){
        employee.setStatus(STATUS_ADOPT);
        System.out.println(employee);
        employeeService.updateEmployeeByEmployeeid(employee);
        return "forward:/admin/approveaccount";
    }

    /**
     * 不通过
     * @return
     */
    @RequestMapping("/failed")
    public String approvalFailed(Integer employeeid){
        employeeService.deleteEmployeeByEmployeeid(employeeid);
        return "forward:/admin/approveaccount";
    }


}
