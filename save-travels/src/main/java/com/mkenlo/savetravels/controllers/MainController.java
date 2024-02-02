package com.mkenlo.savetravels.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mkenlo.savetravels.models.Expense;
import com.mkenlo.savetravels.services.ExpenseService;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PutMapping;

@Controller
@RequestMapping("/expenses")
public class MainController {

    ExpenseService expenseSvc;

    public MainController(ExpenseService expenseSvc) {
        this.expenseSvc = expenseSvc;
    }

    @GetMapping("")
    public String index(Model model) {
        model.addAttribute("expenses", expenseSvc.getAllExpenses());
        return "index.jsp";
    }

    @GetMapping("/detail/{id}")
    public String detailExpense(@PathVariable long id, Model model) {
        Expense expense = expenseSvc.getById(id);
        model.addAttribute("expense", expense);
        return "expense-detail.jsp";
    }

    @GetMapping("/edit/{id}")
    public String showEditExpense(@PathVariable long id, Model model) {

        Expense expense = expenseSvc.getById(id);
        model.addAttribute("expense", expense);
        return "edit-expense.jsp";
    }

    @PutMapping("/edit/{id}")
    public String editExpense(@PathVariable long id, @Valid @ModelAttribute Expense expense,
            BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("expense", expenseSvc.getById(id));
            return "edit-expense.jsp";
        }
        expenseSvc.save(expense);
        return "redirect:/expenses";
    }

    @PostMapping("/add")
    public String addExpense(@Valid @ModelAttribute Expense expense, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("expenses", expenseSvc.getAllExpenses());
            return "index.jsp";
        }
        expenseSvc.save(expense);
        return "redirect:/expenses";
    }

    @DeleteMapping("/delete/{id}")
    public String delExpense(@PathVariable long id, RedirectAttributes redirect) {
        expenseSvc.deleteById(id);
        redirect.addFlashAttribute("alert", "Deletion was successfull");
        return "redirect:/expenses";
    }
}
