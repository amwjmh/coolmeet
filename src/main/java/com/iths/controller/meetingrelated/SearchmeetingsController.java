package com.iths.controller.meetingrelated;

import com.iths.pojo.Meeting;
import com.iths.pojo.PageBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/10/25 20:58
 */
@Controller
@RequestMapping("/searchmeetings")
public class SearchmeetingsController {

    @RequestMapping("/jumpsearchmeetings")
    public String jumpSearchmeetings(PageBean<Meeting> meetingPageBean, Meeting meeting, HttpSession session){

        return "searchmeetings";
    }

}
