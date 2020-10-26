package com.iths.service;

import com.iths.pojo.Meetingroom;

import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/10/2 21:11
 */
public interface IMeetingroomService {

    //新增会议室
    void insertMeetingroom(Meetingroom meetingroom);

    List<Meetingroom> queryAllMeetingroom(Meetingroom meetingroom);

    void updateMeetingroomByroomid(Meetingroom meetingroom);

    void  deleteMeetingroomByroomid(Meetingroom meetingroom);
}
