package com.iths.dao;
import com.iths.pojo.Meetingparticipants;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/10/22 23:37
 */
public interface IMeetingparticipantsDao {

    public void insertMeetingparticipants(@Param("lists") List<Meetingparticipants> lists);

}
