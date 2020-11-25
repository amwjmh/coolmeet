package com.iths.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/9/16 23:03
 * 员工类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Employee {
    //员工id
    private Integer employeeid;
    //员工姓名
    private String employeename;
    //员工账号
    private String username;
    //电话
    private String phone;
    //邮箱
    private String email;
    //状态
    private String status;
    //对应部门id
    private Integer departmentid;
    //密码
    private String password;
    //权限状态
    private String role;
}
