package com.iths.service;

import com.iths.pojo.Department;

import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/9/29 20:51
 */
public interface IDepartmentService {

    List<Department> queryAllDepartment();

    void insertDepartment(Department department);

    void deleteDepartment(Integer departmentid);

    void updateDepartment(Department department);

    List<Department> queryAll();
}
