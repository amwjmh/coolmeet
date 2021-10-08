package com.iths.controller.personalinformation;

import com.iths.pojo.Constant;
import com.iths.pojo.Employee;
import com.iths.pojo.Meeting;
import com.iths.service.IMeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/9/19 23:54
 * 最新通知
 */
@Controller
@RequestMapping("/notifications")
public class NotificationsController {

    @Autowired
    private IMeetingService meetingService;

    /*@RequestMapping("/meetingdata")
    public @ResponseBody List<Meeting> meetingData(Integer employeeid){
        List<Meeting> meetings = meetingService.queryFutureMeetings(employeeid, Constant.FUTURE_TIME);
        return meetings;
    }*/

    @RequestMapping("/notice")
    public String notice( Model model, HttpSession session){
        Employee emp = (Employee)session.getAttribute("judgment");
        Integer employeeid = emp.getEmployeeid();
        //未来7天的会议数据
        List<Meeting> meetings =
                meetingService.queryFutureMeetings(employeeid, Constant.FUTURE_TIME,Constant.STATUS_ADOPT);
        model.addAttribute("meetingdata",meetings);

        //取消的会议
        List<Meeting> meetings1 = meetingService.queryFutureMeetings(employeeid, Constant.FUTURE_TIME, Constant.STATUS_CLOSE);
        model.addAttribute("meetingdata1",meetings1);

        return "notifications";
    }
}
