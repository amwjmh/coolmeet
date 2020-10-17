package com.iths.controller.administration;

import com.iths.pojo.Meetingroom;
import com.iths.service.IMeetingroomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/10/15 14:38
 * 添加会议室
 */
@Controller
@RequestMapping("/admin")
public class AdminIncreaseMeetingsController {

    @Autowired
    private IMeetingroomService meetingroomService;
    /*会议*/
    //跳转
    @RequestMapping("/jumpaddroom")
    public String jumpAddroom(){

        return "addmeetingroom";
    }


    //添加
    @RequestMapping("/increaseConferenceRoom")
    public  String increaseConferenceRoom(Meetingroom meetingroom){
        System.out.println(meetingroom);
        meetingroomService.insertMeetingroom(meetingroom);
        System.out.println("ddd");
        return "redirect:/admin/jumpaddroom";
    }
}
