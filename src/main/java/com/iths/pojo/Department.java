package com.iths.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/9/21 11:48
 * 部门表
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Department {
    //部门id
    private Integer departmentid;
   //部门名称
    private  String departmentname;


    private List<Employee> employees;

}
