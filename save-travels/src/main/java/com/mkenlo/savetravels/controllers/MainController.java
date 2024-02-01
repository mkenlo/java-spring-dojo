package com.mkenlo.savetravels.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkenlo.savetravels.models.Expense;

@Controller
@RequestMapping("/expenses")
public class MainController {

    @GetMapping("")
    public String index() {
        return "index.jsp";
    }

    @GetMapping("/detail/{id}")
    public String detailExpense(@PathVariable long id, Model model) {
        Expense expense = new Expense(1000, "Tallahasse Flamingo", "Florida", 12300.55,
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua");
        model.addAttribute("expense", expense);
        return "expense-detail.jsp";
    }

    @GetMapping("/edit/{id}")
    public String showEditExpense(@PathVariable long id, Model model) {
        Expense expense = new Expense(1000, "Tallahasse Flamingo", "Florida", 12300.55,
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua");
        model.addAttribute("expense", expense);
        return "edit-expense.jsp";
    }
}
