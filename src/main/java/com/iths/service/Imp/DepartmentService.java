package com.iths.service.Imp;

import com.iths.dao.IDepartmentDao;
import com.iths.pojo.Department;
import com.iths.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/9/29 20:54
 */
@Service
public class DepartmentService implements IDepartmentService {
    @Autowired
    private IDepartmentDao departmentDao;

    @Override
    public List<Department> queryAllDepartment() {
        List<Department> departments = departmentDao.queryAllDepartment();
        return departments;
    }

    @Override
    public void insertDepartment(Department department) {
        departmentDao.insertDepartment(department);
    }

    @Override
    public void deleteDepartment(Integer departmentid) {
        departmentDao.deleteDepartmentByDepartmentid(departmentid);
    }

    @Override
    public void updateDepartment(Department department) {
        departmentDao.updateDepartmentByDepartmentid(department);
    }

    @Override
    public List<Department> queryAll() {
        return departmentDao.queryAll();
    }


}
