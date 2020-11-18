package com.iths.controller.administration;

import com.iths.pojo.Constant;
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



    @Autowired
    private IEmployeeService employeeService;

//模糊分布查询
    @RequestMapping("/jumpsearchemployees")
    public String jumpSearchemployees(PageBean<Employee> pageBean,Employee employee, Model model){
        if (pageBean.getCurrentPage() <= 0){
            pageBean.setCurrentPage(1);
        }

        if(employee.getStatus() == null || employee.getStatus() == ""){
            employee.setStatus("1");
        }
        System.out.println(pageBean);
        System.out.println(employee);
        //页面条数
        pageBean.setRows(Constant.ROWS);
        PageBean<Employee> employeeByPage = employeeService.findEmployeeByPage(pageBean,employee);

        System.out.println(employeeByPage);
        model.addAttribute("pagebean_emp",employeeByPage);

        model.addAttribute("feedback_emp",employee);
        return "searchemployees";
    }


    //关闭账号
    @RequestMapping("/close")
    public String closeAccount(Employee employee){
        employee.setStatus(Constant.STATUS_CLOSE);
        employeeService.updateEmployeeByEmployeeid(employee);
        return "redirect:/admin/jumpsearchemployees";
    }

}
