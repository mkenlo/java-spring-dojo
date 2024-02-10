package com.mkenlo.bookclub.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.mkenlo.bookclub.models.LoginUser;
import com.mkenlo.bookclub.models.User;
import com.mkenlo.bookclub.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class LoginController {
    @Autowired
    UserService userService;

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }

    @PostMapping("/login")
    public String doLogin(@Valid @ModelAttribute("newLogin") LoginUser user, BindingResult result, Model model,
            HttpSession session) {

        User loggedUser = userService.doLogin(user, result);
        if (result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }

        model.addAttribute("user", loggedUser);
        session.setAttribute("userId", loggedUser.getId());
        return "redirect:/books";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User user, BindingResult result, HttpSession session,
            Model model) {

        User newUser = userService.createUser(user, result);
        if (result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        session.setAttribute("userId", newUser.getId());
        return "redirect:/books";
    }

    @GetMapping("/logout")
    public String doLogout(HttpSession session) {
        session.removeAttribute("userId");
        return "redirect:/";
    }

}
