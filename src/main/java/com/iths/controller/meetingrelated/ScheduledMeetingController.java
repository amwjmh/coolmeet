package com.iths.controller.meetingrelated;

import com.iths.pojo.Department;
import com.iths.pojo.Employee;
import com.iths.pojo.Meeting;
import com.iths.pojo.Meetingroom;
import com.iths.service.IDepartmentService;
import com.iths.service.IMeetingService;
import com.iths.service.IMeetingroomService;

import com.iths.utils.DateConversionUtils;
import com.sun.net.httpserver.HttpsServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/*
 * @author 黄小帅
 * @version 1.0
 * @date 2020/10/19 9:52
 * 新增会议
 */
@Controller
@RequestMapping("/scheduledmeeting")
public class ScheduledMeetingController {
    @Autowired
    private IMeetingroomService meetingroomService;
    @Autowired
    private IDepartmentService departmentService;
    @Autowired
    private IMeetingService meetingService;
    @Autowired
    private DateConversionUtils dateConversionUtils;

    /**
     * 查询所有部门和员工
     * @param model
     * @return
     */
    @RequestMapping("/jumpbookmeeting")
    public  String jumpBookmeeting(Model model){
        Meetingroom meetingroom = new Meetingroom();
        meetingroom.setStatus("1");
        List<Meetingroom> meetingrooms = meetingroomService.queryAllMeetingroom(meetingroom);
        List<Department> departments = departmentService.queryAll();
        model.addAttribute("choicemee",meetingrooms);
        model.addAttribute("choicedep",departments);
        return "bookmeeting";
    }


    @RequestMapping("/addmeeting")
    public String addMeeting(Meeting meeting, String st, String et , Integer[] mps, HttpSession session) throws ParseException {

        Employee judgment = (Employee) session.getAttribute("judgment");
        meeting.setReservationistid(judgment.getEmployeeid());
        meeting.setStarttime(dateConversionUtils.conversionDate(st));
        meeting.setEndtime(dateConversionUtils.conversionDate(et));
        meeting.setReservationtime(dateConversionUtils.converString(new Date()));
        /*for (Integer mp : mps) {
            System.out.println(mp);
        }*/
        Integer integer = meetingService.insertMeeting(meeting, mps);

        return "redirect:/scheduledmeeting/jumpbookmeeting";
    }
}
