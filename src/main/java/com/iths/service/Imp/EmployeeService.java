package com.iths.service.Imp;

import com.iths.dao.IEmployeeDao;
import com.iths.pojo.Employee;
import com.iths.pojo.PageBean;
import com.iths.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/9/19 15:11
 */
@Service
public class EmployeeService implements IEmployeeService {

    @Autowired
    private IEmployeeDao employeeDao;
    //用户登入
    @Override
    public Employee employeeLogin(String username,String password) {
        Employee employee = employeeDao.queryEmployeeByUsername(username);
        System.out.println(employee);
        //验证密码是否正确
        if (employee == null || !password.equals(employee.getPassword())){
            return null;
        }
        return employee;
    }

    ////根据查询用户是否已存在
    @Override
    public Employee queryEmployee(Employee employee) {
        Employee queryemployee = employeeDao.queryEmployee(employee);
        return queryemployee;
    }

    //添加用户
    @Override
    public boolean addEmployee(Employee employee){
        //判断用户名是否已经存在
        employeeDao.insertEmployee(employee);
            return true;
    }

    @Override
    public List<Employee> queryEmployeeByStatus(String status) {
        List<Employee> employees = employeeDao.queryEmployeeByStatus(status);
        return employees;
    }

    @Override
    public void updateEmployeeByEmployeeid(Employee employee) {
        employeeDao.updateEmployeeByEmployeeid(employee);
    }

    @Override
    public void deleteEmployeeByEmployeeid(Integer employeeid) {
        employeeDao.deleteEmployeeByEmployeeid(employeeid);
    }

    @Override
    public PageBean<Employee> findEmployeeByPage(Integer currentPage,Integer rows) {
        Integer  cur= (currentPage-1)*rows;

        PageBean<Employee> employeePageBean = new PageBean<>();
        List<Employee> employees = employeeDao.queryVaguePagingEmployee(currentPage, rows);
        employeePageBean.setList(employees);

        return employeePageBean;
    }


}
