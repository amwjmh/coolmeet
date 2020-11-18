package com.iths.controller.personalinformation;

import com.iths.pojo.Employee;
import com.iths.pojo.Meeting;
import com.iths.service.IMeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/11/18 23:28
 */
@Controller
@RequestMapping("/mybookings")
public class MybookingsContrller {

    @Autowired
    private IMeetingService meetingService;


    @RequestMapping("/myreservation")
    public String myReservation( Model model, HttpSession session){
        Employee emp = (Employee)session.getAttribute("judgment");
        Integer employeeid = emp.getEmployeeid();
        List<Meeting> meetings = meetingService.queryMeetingByEmpid(employeeid);
        model.addAttribute("mymeeting",meetings);
        System.out.println(meetings);
        return "mybookings";
    }

    @RequestMapping("jumpcancelmeeting")
    public String jumpcancelmeeting(Integer meetingid,Model model){
        Meeting meeting = meetingService.queryMeetingByid(meetingid);
        model.addAttribute("single",meeting);
        return "cancelmeeting";
    }

    @RequestMapping("/determine")
    public String determine(Meeting meeting){
        meetingService.updateMeetingByid(meeting);
        return "redirect:/mybookings/myreservation";
    }

}
