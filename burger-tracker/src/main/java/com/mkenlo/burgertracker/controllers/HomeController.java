package com.mkenlo.burgertracker.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.mkenlo.burgertracker.models.Burger;
import com.mkenlo.burgertracker.services.BurgerService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class HomeController {

    BurgerService burgerService;

    public HomeController(BurgerService burgerService) {
        this.burgerService = burgerService;
    }

    @GetMapping("/")
    public String index(Model model) {
        List<Burger> burgers = burgerService.getAllBurgerReviews();
        model.addAttribute("burgers", burgers);
        return "index.jsp";
    }

    @PostMapping("/add")
    public String addReview(@ModelAttribute("burger") Burger burger, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            System.out.println(bindingResult.getAllErrors());
            return "index.jsp";
        } else {
            burgerService.addBurgerReview(burger);
        }

        return "redirect:/";
    }

}
