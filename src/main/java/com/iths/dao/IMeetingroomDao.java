package com.iths.dao;

import com.iths.pojo.Meeting;
import com.iths.pojo.Meetingroom;

import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/9/23 20:02
 */
//会议室
public interface IMeetingroomDao {

    //增加会议室
    void insertMeetingroom(Meetingroom meetingroom);

    //查询会议室
    List<Meetingroom> queryAllMeetingroom(Meetingroom meetingroom);

    //修改
    void updateMeetingroomByroomid(Meetingroom meetingroom);

    //删除
    void deleteMeetingroomByroomid(Meetingroom meetingroom);

}
