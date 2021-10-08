package com.iths.service;

import com.iths.pojo.Employee;
import com.iths.pojo.Meeting;
import com.iths.pojo.PageBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/10/22 23:30
 */
public interface IMeetingService {
    public Integer insertMeeting(Meeting meeting,Integer[] mps);


    public PageBean<Meeting> findMeetingByPage(PageBean<Meeting> pageBean, Meeting meeting);

    public Meeting queryParticipatingEmployees(Integer id);

    List<Meeting> queryFutureMeetings(Integer id,Integer day,String status);

    Meeting queryMeetingByid(Integer id);

    void updateMeetingByid(Meeting meeting);

    List<Meeting> queryMeetingByEmpid(Integer id);


}
