package com.iths.controller.meetingrelated;

import com.iths.pojo.Constant;
import com.iths.pojo.Meeting;
import com.iths.pojo.Meetingroom;
import com.iths.service.IMeetingroomService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/10/18 17:26
 * 查询会议室
 */
@Controller
@RequestMapping("/conferenceromm")
public class ViewConferenceRommController {



    @Autowired
    private IMeetingroomService meetingroomService;

    /*//查询
    @RequestMapping("/jumpviewconferenceromm")
    public String jumpViewConferenceRomm(Model model){
        Meetingroom meetingroom = new Meetingroom();
        meetingroom.setStatus("1");
        List<Meetingroom> meetingrooms = meetingroomService.queryAllMeetingroom(meetingroom);
        model.addAttribute("meetingrooms",meetingrooms);
        return "meetingrooms";
    }*/

    @RequestMapping("/viewconferenceromm")
    public String ViewConferenceRomm(Model model){
        List<Meetingroom> meetingrooms = meetingroomService.queryAllMeetingroom(null);
        model.addAttribute("meetingrooms",meetingrooms);
        return "meetingrooms";
    }

    //根据id查看
    @RequestMapping("/roomdetails")
    public  String roomdetails(Meetingroom meetingroom, Model model){
        List<Meetingroom> meetingrooms = meetingroomService.queryAllMeetingroom(meetingroom);

        model.addAttribute("roomdetails",meetingrooms.get(0));
        return "roomdetails";
    }

    //修改
    @RequestMapping("/updateroom")
    public String updateroom(Meetingroom meetingroom){
        System.out.println("2222"+meetingroom);
        meetingroomService.updateMeetingroomByroomid(meetingroom);
        return "redirect:/conferenceromm/viewconferenceromm";
    }

    //删除会议室
    @RequestMapping("/deletemeetingroom")
    public String deleteMeetingroom(Meetingroom meetingroom){
        meetingroomService.deleteMeetingroomByroomid(meetingroom);
        return "redirect:/conferenceromm/viewconferenceromm";
    }

}
