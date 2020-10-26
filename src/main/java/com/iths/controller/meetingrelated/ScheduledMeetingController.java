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

    @RequestMapping("/jumpbookmeeting")
    public  String jumpBookmeeting(Model model){
        List<Meetingroom> meetingrooms = meetingroomService.queryAllMeetingroom(null);
        List<Department> departments = departmentService.queryAll();
        model.addAttribute("choicemee",meetingrooms);
        model.addAttribute("choicedep",departments);
        return "bookmeeting";
    }


    @RequestMapping("/addmeeting")
    public String addMeeting(Meeting meeting, String st, String et , Integer[] mps, HttpSession session) throws ParseException {

        System.out.println("/d"+st+"====="+et);
        Employee judgment = (Employee) session.getAttribute("judgment");
        meeting.setReservationistid(judgment.getEmployeeid());
        meeting.setStarttime(dateConversionUtils.conversion(st));
        meeting.setEndtime(dateConversionUtils.conversion(et));
        meeting.setReservationtime(new Date());
        System.out.println(meeting);

        Integer integer = meetingService.insertMeeting(meeting, mps);

        return "redirect:/scheduledmeeting/jumpbookmeeting";
    }
}
