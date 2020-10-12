package com.iths.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/9/19 23:54
 */
@Controller
@RequestMapping("/notifications")
public class NotificationsController {

    @RequestMapping("/notice")
    public String notice(){

        return "notifications";
    }
}
