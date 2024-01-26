package com.mkenlo.omikuji.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/omikuji")
public class HomeController {
    @GetMapping("")
    public String index() {
        return "index.jsp";
    }

    @GetMapping("/show")
    public String show() {
        return "show.jsp";
    }
}
