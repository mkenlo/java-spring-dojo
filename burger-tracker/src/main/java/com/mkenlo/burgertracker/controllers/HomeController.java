package com.mkenlo.burgertracker.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.mkenlo.burgertracker.models.Burger;
import com.mkenlo.burgertracker.services.BurgerService;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

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
    public String addReview(@Valid @ModelAttribute("burger") Burger burger, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            List<Burger> burgers = burgerService.getAllBurgerReviews();
            model.addAttribute("burgers", burgers);
            return "index.jsp";
        } else {
            burgerService.saveBurgerReview(burger);
        }

        return "redirect:/";
    }

    @GetMapping("/edit/{id}")
    public String showEditPage(@PathVariable long id, Model model) {
        Burger burger = burgerService.findById(id);
        model.addAttribute("burger", burger);
        return "edit.jsp";
    }

    @PutMapping("/edit/{id}")
    public String editPage(@PathVariable long id, @Valid @ModelAttribute("burger") Burger burger,
            BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("burger", burger);
            return "edit.jsp";
        }
        burgerService.saveBurgerReview(burger);

        return "redirect:/";
    }

}
