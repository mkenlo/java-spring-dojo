package com.mkenlo.loginregistration.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @GetMapping("/")
    public String index() {
        return "index.jsp";
    }

    @PostMapping("/login")
    public String doLogin() {
        return "dashboard.jsp";
    }

    @PostMapping("/register")
    public String register(RedirectAttributes redirect) {

        redirect.addFlashAttribute("registerSuccess", "Your account has been created, you can now login.");
        return "redirect:/";
    }

    @GetMapping("/logout")
    public String doLogout() {
        return "redirect:/";
    }

}
