package com.iths.controller.meetingrelated;

import com.iths.pojo.Constant;
import com.iths.pojo.Employee;
import com.iths.pojo.Meeting;
import com.iths.pojo.PageBean;
import com.iths.service.IMeetingService;
import com.sun.org.apache.xpath.internal.operations.Mod;
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
 * @date 2020/10/25 20:58
 * 会议
 */
@Controller
@RequestMapping("/searchmeetings")
public class SearchmeetingsController {

    @Autowired
    private IMeetingService meetingService;

    @RequestMapping("/jumpsearchmeetings")
    public String jumpSearchmeetings(PageBean<Meeting> pageBean, Meeting meeting, Model model){
        if(pageBean.getCurrentPage() <= 0){
            pageBean.setCurrentPage(1);
        }
        System.out.println(pageBean);
        System.out.println("====+++"+meeting);
        //设置查询的条数
        pageBean.setRows(Constant.ROWS);

        PageBean<Meeting> meetingByPage = meetingService.findMeetingByPage(pageBean, meeting);

        model.addAttribute("pagebean_mee",meetingByPage);
        model.addAttribute("feedback_mee",meeting);


        return "searchmeetings";
    }

    @RequestMapping("participatingemployees")
    public String participatingEmployees(Integer meetingid,Model model){
        System.out.println(meetingid);

        List<Employee> employees = meetingService.queryParticipatingEmployees(meetingid);
        model.addAttribute("participat",employees);
        return "meetingdetails";
    }



}
