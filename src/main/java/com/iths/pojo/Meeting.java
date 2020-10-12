package com.iths.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

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
//    * 会议名称
    private String meetingname;
    //* 所在房间id
    private Integer roomid;
    //*预约人数
    private  Integer numberofparticipants;
    //*开始时间
    private Date starttime;
    //*结束时间
    private  Date endtime;
    //* 预约时间
    private Date reservationtime;
    //* canceledtume   取消时间
    private  Date canceledtume;
    //* 描述
    private String  description;
    //* 职位
    private String status;
}
