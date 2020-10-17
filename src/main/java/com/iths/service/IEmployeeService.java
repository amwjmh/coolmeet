package com.iths.service;

import com.iths.pojo.Employee;
import com.iths.pojo.PageBean;

import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/9/19 15:10
 */
public interface IEmployeeService {


    Employee employeeLogin(String username,String password);

    //查询用户是
    Employee queryEmployee(Employee employee);

    //添加用户
     boolean addEmployee(Employee employee);

     List<Employee> queryEmployeeByStatus(String status);

     void updateEmployeeByEmployeeid(Employee employee);

     void deleteEmployeeByEmployeeid(Integer employeeid);


     //分页查询
    PageBean<Employee> findEmployeeByPage(PageBean<Employee> pageBean,Employee employee);


}
