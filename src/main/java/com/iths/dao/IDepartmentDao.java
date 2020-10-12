package com.iths.dao;

import com.iths.pojo.Department;

import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/9/23 19:58
 */
//部门Dao
public interface IDepartmentDao {



    //查询所有部门
    List<Department> queryAllDepartment();

    //新增部门
    void insertDepartment(Department department);

    //根据id删除部门
    void deleteDepartmentByDepartmentid(Integer departmentid);

    //根据id修改
    void updateDepartmentByDepartmentid(Department department);

}
