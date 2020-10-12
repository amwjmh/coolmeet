package com.iths.dao;

import com.iths.pojo.Employee;
import com.iths.pojo.PageBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/9/19 15:03
 */

public interface IEmployeeDao {


    Employee queryEmployeeByUsername(String username);
    //根据查询
    Employee queryEmployee(Employee employee);

    /**
     * 新增
     * @param employee
     */
     void insertEmployee(Employee employee);


    /**
     * 根据status查询
     * @param status
     * @return
     */
    List<Employee> queryEmployeeByStatus(String status);

    /**
     * 根据id修改status---审批通过
     * @param employee
     */
    void updateEmployeeByEmployeeid(Employee employee);

    /**
     * 根据id删除 ---审批不通过
     * @param employeeid
     */
    void deleteEmployeeByEmployeeid(Integer employeeid);

    /**
     * 分页查询
     * @param currentPage
     * @param rows
     * @return
     */
    List<Employee> queryVaguePagingEmployee(@Param("currentPage") Integer currentPage,@Param("rows") Integer rows);

}
