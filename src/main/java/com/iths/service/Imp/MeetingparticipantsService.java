package com.iths.service.Imp;

import com.iths.dao.IMeetingparticipantsDao;
import com.iths.pojo.Meetingparticipants;
import com.iths.service.IMeetingparticipantsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/10/22 23:52
 */
@Service
public class MeetingparticipantsService implements IMeetingparticipantsService {

    @Autowired
    private IMeetingparticipantsDao meetingparticipantsDao;

    @Override
    public void insertMeetingparticipants(List meetingparticipants) {
        meetingparticipantsDao.insertMeetingparticipants(meetingparticipants);

    }
}
