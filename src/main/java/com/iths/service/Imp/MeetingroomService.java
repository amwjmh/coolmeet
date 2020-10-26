package com.iths.service.Imp;

import com.iths.dao.IMeetingroomDao;
import com.iths.pojo.Meeting;
import com.iths.pojo.Meetingroom;
import com.iths.service.IMeetingroomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/10/2 21:16
 */
@Service
public class MeetingroomService implements IMeetingroomService {

    @Autowired
    private IMeetingroomDao meetingroomDao;

    //增加会议室
    @Override
    public void insertMeetingroom(Meetingroom meetingroom) {
        meetingroomDao.insertMeetingroom(meetingroom);
        System.out.println("//增加会议室");
    }

    @Override
    public List<Meetingroom> queryAllMeetingroom(Meetingroom meetingroom) {
        List<Meetingroom> meetingrooms = meetingroomDao.queryAllMeetingroom(meetingroom);
        return meetingrooms;
    }

    @Override
    public void updateMeetingroomByroomid(Meetingroom meetingroom) {
        meetingroomDao.updateMeetingroomByroomid(meetingroom);
    }

    @Override
    public void deleteMeetingroomByroomid(Meetingroom meetingroom) {
        meetingroomDao.deleteMeetingroomByroomid(meetingroom);
    }

}
