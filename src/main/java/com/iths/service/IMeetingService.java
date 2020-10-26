package com.iths.service;

import com.iths.pojo.Meeting;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/10/22 23:30
 */
public interface IMeetingService {
    public Integer insertMeeting(Meeting meeting,Integer[] mps);
}
