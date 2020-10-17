package com.iths.controller.administration;

import com.iths.pojo.Employee;
import com.iths.pojo.PageBean;
import com.iths.service.IEmployeeService;
import com.iths.service.Imp.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/10/12 10:33
 * 员工查询
 */
@Controller
@RequestMapping("/admin")
public class AdminEmployeeController {


    public static  final  String STATUS_CLOSE= "-1";

    //每页显示条数
    public static final Integer ROWS = 6;

    @Autowired
    private IEmployeeService employeeService;

//模糊分布查询
    @RequestMapping("/jumpsearchemployees")
    public String jumpSearchemployees(PageBean<Employee> pageBean,Employee employee, Model model){
        if (pageBean.getCurrentPage() <= 0){
            pageBean.setCurrentPage(1);
        }
        System.out.println(pageBean);
        System.out.println(employee);
        //页面条数
        pageBean.setRows(ROWS);
        PageBean<Employee> employeeByPage = employeeService.findEmployeeByPage(pageBean,employee);

        System.out.println(employeeByPage);
        model.addAttribute("pagebean",employeeByPage);
        model.addAttribute("feedback",employee);
        return "searchemployees";
    }


    @RequestMapping("/close")
    public String closeAccount(Employee employee){
        employee.setStatus(STATUS_CLOSE);
        employeeService.updateEmployeeByEmployeeid(employee);
        return "redirect:/admin/jumpsearchemployees";
    }

}
