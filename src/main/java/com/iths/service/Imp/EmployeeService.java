package com.iths.service.Imp;

import com.iths.controller.administration.AdminEmployeeController;
import com.iths.dao.IEmployeeDao;
import com.iths.pojo.Constant;
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
        //判断用户名是否已经存在

        Employee queryemployee = employeeDao.queryEmployee(employee);
        System.out.println(queryemployee);
        return queryemployee;
    }

    //添加用户
    @Override
    public boolean addEmployee(Employee employee){

        employeeDao.insertEmployee(employee);
            return true;
    }

    @Override
    public List<Employee> queryEmployeeByStatus(String status) {
        List<Employee> employees = employeeDao.queryEmployeeByStatus(status);
        return employees;
    }

    //根据ID修改值
    @Override
    public void updateEmployeeByEmployeeid(Employee employee) {
        employeeDao.updateEmployeeByEmployeeid(employee);
    }

    @Override
    public void deleteEmployeeByEmployeeid(Integer employeeid) {
        employeeDao.deleteEmployeeByEmployeeid(employeeid);
    }

    /**
     * 模糊分页查询
     * @param pageBean
     * @return
     */
    @Override
    public PageBean<Employee> findEmployeeByPage(PageBean<Employee> pageBean,Employee employee) {
        //创建返回pagebean
        PageBean<Employee> employeePageBean = new PageBean<>();


        //计算偏移量
        pageBean.setOffset((pageBean.getCurrentPage()-1)* Constant.ROWS);
        System.out.println(pageBean);
        //页面数据
        List<Employee> employees = employeeDao.queryVaguePagingEmployee(pageBean,employee);
        System.out.println("service----employees"+employees);

        //总条数
        Integer totalEmployee = employeeDao.queryTotalEmployee(employee);

        //总页码
        Integer totalPag = totalEmployee% Constant.ROWS == 0 ? totalEmployee/Constant.ROWS : totalEmployee/Constant.ROWS+1;

        employeePageBean.setList(employees);
        employeePageBean.setTotalCount(totalEmployee);
        employeePageBean.setTotalPage(totalPag);
        employeePageBean.setCurrentPage(pageBean.getCurrentPage());

        return employeePageBean;
    }


}
