package com.mkenlo.omikuji.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkenlo.omikuji.model.FortuneWords;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/omikuji")
public class HomeController {
    @GetMapping("")
    public String index() {
        return "index.jsp";
    }

    @PostMapping("/submit")
    public String submit(@ModelAttribute("words") FortuneWords words, HttpSession session) {
        session.setAttribute("words", words);
        return "redirect:/omikuji/show";
    }

    @GetMapping("/show")
    public String show(Model model, HttpSession session) {
        model.addAttribute("words", session.getAttribute("words"));
        return "show.jsp";
    }

}
