package com.iths.controller.management;

import com.iths.pojo.Department;
import com.iths.pojo.Employee;
import com.iths.service.IDepartmentService;
import com.iths.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/9/24 11:34
 *
 * 用户注册
 */
@Controller
@RequestMapping("/management")

public class ManagementContrller {

    //未审批默认为0
    public static final String STATUS_DEFAULT = "0";

    @Autowired
    private IDepartmentService departmentService;

    @Autowired
    private IEmployeeService employeeService;
    //跳转员工注册并加载部门
    @RequestMapping("/employeeRegistration")
    public String employeeRegistration(Model model){
        //注册页 部门信息
        List<Department> departments = departmentService.queryAllDepartment();

        model.addAttribute("departments",departments);
        return "register";
    }

    //用户注册
    @RequestMapping("/addaddEmployee")
    public String addEmployee(Employee employee, Model model){
        employee.setStatus(STATUS_DEFAULT);
        System.out.println("添加用户"+employee);
        boolean b = employeeService.addEmployee(employee);
        return "redirect:/management/employeeRegistration";
    }
    //判断用户是否已存在

    @RequestMapping("/determineUsernameExists")
    public void determineUsernameExists(Employee employee, HttpServletResponse response){
        System.out.println(employee);
        Employee queryemployee = employeeService.queryEmployee(employee);

        System.out.println(employee);
        if (queryemployee != null){
            try {
                response.getWriter().write("exist");
                System.out.println("---------------------------");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
