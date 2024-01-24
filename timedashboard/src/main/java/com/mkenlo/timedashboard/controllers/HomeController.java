package com.mkenlo.timedashboard.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String index() {
        return "index.jsp";
    }

    @RequestMapping("/date")
    public String date(Model model) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("EEEEEEE, MMM D, Y ");
        model.addAttribute("todayDate", dateFormat.format(new Date()));
        return "date.jsp";
    }

    @RequestMapping("/time")
    public String time(Model model) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("h:m a");
        model.addAttribute("todayTime", dateFormat.format(new Date()));
        return "time.jsp";
    }

}
