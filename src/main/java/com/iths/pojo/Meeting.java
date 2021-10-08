package com.iths.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/9/21 11:50
 * 会议
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Meeting {
    // 会议ID
    private Integer meetingid;
//    会议名称
    private String meetingname;
    // 所在房间id
    private Integer roomid;
    //预计参加人数
    private  Integer numberofparticipants;
    //发起人
    private Integer reservationistid;
    //开始时间
    private String starttime;
    //*结束时间
    private String endtime;
    //* 预约时间
    private String reservationtime;

    //*取消时间
    private String canceledtime;
    //* 描述
    private String  description;
    //* 状态
    private String status;

    //
    private Employee employee;

    private Meetingroom meetingroom;

    private List<Employee> employees;


}
