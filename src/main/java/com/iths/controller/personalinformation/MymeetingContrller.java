package com.iths.controller.personalinformation;

import com.iths.pojo.Constant;
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
 * @date 2020/11/22 21:12
 */
@Controller
public class MymeetingContrller {
    @Autowired
    private IMeetingService meetingService;

    @RequestMapping("/jumpmymeetings")
    public String jumpmymeetings (Model model, HttpSession session){

        Employee emp = (Employee)session.getAttribute("judgment");
        Integer employeeid = emp.getEmployeeid();
        //我的全部会议数据
        List<Meeting> meetings = meetingService.queryFutureMeetings(employeeid,null,Constant.STATUS_ADOPT);

        model.addAttribute("mymeetings",meetings);

        return "mymeetings";
    }
}
