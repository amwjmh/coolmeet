package com.iths.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/9/21 12:04
 * 会议室
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Meetingroom {
    //会议室ID
    private Integer roomid;
    //房间号
    private Integer roomnum;
    //会议室名称
    private String roomname;
    //容纳人数
    private  Integer capacity;
    //职位
    private  String status;
    //描述
    private String description;




}
