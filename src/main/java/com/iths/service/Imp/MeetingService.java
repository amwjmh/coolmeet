package com.iths.service.Imp;

import com.iths.dao.IMeetingDao;
import com.iths.dao.IMeetingparticipantsDao;
import com.iths.pojo.*;
import com.iths.service.IMeetingService;
import com.iths.utils.DateConversionUtils;
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

    @Autowired
    private DateConversionUtils dateConversionUtils;


    @Override
    public Integer insertMeeting(Meeting meeting, Integer[] mps) {

        meeting.setStatus(Constant.STATUS_ADOPT);
        Integer integer = meetingDao.insertMeeting(meeting);

        System.out.println(meeting.getMeetingid());

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

    @Override
    public PageBean<Meeting> findMeetingByPage(PageBean<Meeting> pageBean,Meeting meeting){
        PageBean<Meeting> meetingPageBean = new PageBean<>();
        System.out.println(meeting);
        //计算偏移量
        pageBean.setOffset((pageBean.getCurrentPage()-1)*Constant.ROWS);
        //查询会议
        List<Meeting> meetings = meetingDao.queryVaguePagingMeeting(pageBean, meeting);

        //查询总记录数
        Integer totalMeeting = meetingDao.queryTotalMeeting(meeting);

        meetingPageBean.setList(meetings);

        meetingPageBean.setTotalCount(totalMeeting);

        //计算总页数
        Integer totalPage = totalMeeting%Constant.ROWS == 0 ? totalMeeting/Constant.ROWS : totalMeeting/Constant.ROWS+1;

        meetingPageBean.setTotalPage(totalPage);
        meetingPageBean.setCurrentPage(pageBean.getCurrentPage());
//        System.out.println("哈哈"+meetingPageBean);

        return meetingPageBean;
    }

    @Override
    public List<Employee> queryParticipatingEmployees(Integer id) {
        return meetingDao.queryParticipatingEmployees(id);
    }

    @Override
    public List<Meeting> queryFutureMeetings(Integer id, Integer day,String status) {
        List<Meeting> meetings = meetingDao.queryFutureMeetings(id, day,status);
        return meetings;
    }

    @Override
    public Meeting queryMeetingByid(Integer id) {
        Meeting meeting = meetingDao.queryMeetingByid(id);
        return meeting;
    }

    @Override
    public void updateMeetingByid(Meeting meeting) {
        meeting.setStatus(Constant.STATUS_CLOSE);
        meetingDao.updateMeetingByid(meeting);
    }

    @Override
    public List<Meeting> queryMeetingByEmpid(Integer id) {
        List<Meeting> meetings = meetingDao.queryMeetingByEmpid(id);
        return meetings;
    }
}
