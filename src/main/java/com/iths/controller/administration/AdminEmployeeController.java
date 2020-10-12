package com.iths.controller.administration;

import com.iths.pojo.Employee;
import com.iths.pojo.PageBean;
import com.iths.service.IEmployeeService;
import com.iths.service.Imp.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/10/12 10:33
 */
@Controller
@RequestMapping("/admin")
public class AdminEmployeeController {
    @Autowired
    private IEmployeeService employeeService;

    @RequestMapping("/jumpsearchemployees")
    public String jumpSearchemployees(){
        return "searchemployyess";
    }

    public String getAllEmployees(PageBean<Employee> pageBean){
        return null;
    }
}
