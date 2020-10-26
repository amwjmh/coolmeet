package com.iths.service.Imp;

import com.iths.dao.IMeetingDao;
import com.iths.dao.IMeetingparticipantsDao;
import com.iths.pojo.Meeting;
import com.iths.pojo.Meetingparticipants;
import com.iths.service.IMeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/10/22 23:31
 */
@Service
public class MeetingService implements IMeetingService {

    @Autowired
    private IMeetingDao meetingDao;

    @Autowired
    private IMeetingparticipantsDao meetingparticipantsDao;


    @Override
    public Integer insertMeeting(Meeting meeting, Integer[] mps) {


        Integer integer = meetingDao.insertMeeting(meeting);

        System.out.println(meeting.getMeetingid());
        System.out.println();

       List<Meetingparticipants>  lists= new ArrayList<>();
        for (Integer mp : mps) {
            Meetingparticipants mparticipants = new Meetingparticipants();
            mparticipants.setMeetingid(meeting.getMeetingid());
            mparticipants.setEmployeeid(mp);
            lists.add(mparticipants);
        }
        System.out.println(lists);
        meetingparticipantsDao.insertMeetingparticipants(lists);
        return integer;
    }
}
