package com.mkenlo.counter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

    @GetMapping("/")
    public String index(HttpSession session) {
        if (session.getAttribute("count") == null)
            session.setAttribute("count", 0);
        else {
            int visited = (int) session.getAttribute("count");
            session.setAttribute("count", visited + 1);
        }
        return "index.jsp";
    }

    @GetMapping("/counter")
    public String counter(HttpSession session) {
        if (session.getAttribute("count") == null)
            session.setAttribute("count", 0);
        return "counter.jsp";
    }

}
