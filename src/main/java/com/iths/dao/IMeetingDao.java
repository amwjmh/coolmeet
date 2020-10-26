package com.iths.dao;

import com.iths.pojo.Meeting;

import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/9/23 20:01
 */
public interface IMeetingDao {
    //存入Meeting
    public Integer insertMeeting(Meeting meeting);

    public List<Meeting> ueryVaguePagingMeeting();

}
