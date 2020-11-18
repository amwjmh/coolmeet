package com.iths.dao;

import com.iths.pojo.Employee;
import com.iths.pojo.Meeting;
import com.iths.pojo.PageBean;
import org.apache.ibatis.annotations.Param;

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


    /**
     * 模糊分布查询
     * @return
     */
    public List<Meeting> queryVaguePagingMeeting(@Param("pag")PageBean<Meeting> meetingPageBean,@Param("mee") Meeting meeting);

    /**
     * 根椐条件查询总记录条数
     * @param meeting
     * @return
     */
    public  Integer queryTotalMeeting(Meeting meeting);

    /**
     * 查询参加会议员工
     * @return
     */
    public List<Employee> queryParticipatingEmployees(Integer id);

    /**
     * 查询用户未来需要参加的会议
      * @param id
     * @param day 天数
     * @return
     */
    List<Meeting> queryFutureMeetings(@Param("id") Integer id,@Param("day") Integer day,@Param("status") String status);

    /**
     * 根据id查询
     * @param id
     * @return
     */
    Meeting queryMeetingByid(Integer id);


    /**
     * 根据id修改取消原因
     * @param meeting
     */
    void updateMeetingByid(Meeting meeting);



    List<Meeting> queryMeetingByEmpid(Integer id);


}
