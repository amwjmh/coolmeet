package com.iths.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/9/21 12:14
 * 会议和员工的连接表
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Meetingparticipants {

    private Integer meetingid;

    private Integer employeeid;
}
