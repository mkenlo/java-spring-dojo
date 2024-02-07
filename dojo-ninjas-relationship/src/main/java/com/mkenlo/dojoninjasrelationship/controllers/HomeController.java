package com.mkenlo.dojoninjasrelationship.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mkenlo.dojoninjasrelationship.models.Dojo;
import com.mkenlo.dojoninjasrelationship.models.Ninja;
import com.mkenlo.dojoninjasrelationship.services.DojoService;
import com.mkenlo.dojoninjasrelationship.services.NinjaService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import jakarta.validation.Valid;

@Controller
public class HomeController {

    DojoService dojoService;
    NinjaService ninjaService;

    public HomeController(DojoService dojoService, NinjaService ninjaService) {
        this.dojoService = dojoService;
        this.ninjaService = ninjaService;
    }

    @GetMapping("/")
    public String index() {
        return "index.jsp";
    }

    @GetMapping("/dojos")
    public String getAllDojos(Model model) {
        model.addAttribute("dojos", dojoService.findAll());
        return "dojo-all.jsp";
    }

    @GetMapping("/dojos/{dojoId}")
    public String getDojoDetail(@PathVariable("dojoId") long id, Model model) {
        model.addAttribute("dojo", dojoService.findById(id));
        return "dojo-detail.jsp";
    }

    @GetMapping("/dojos/new")
    public String showCreateDojo() {
        return "dojo-add.jsp";
    }

    @PostMapping("/dojos/new")
    public String createDojo(@Valid @ModelAttribute Dojo dojo, BindingResult result) {
        if (result.hasErrors())
            return "dojo-add.jsp";
        dojoService.save(dojo);

        return "redirect:/dojos";
    }

    @GetMapping("/ninjas/new")
    public String showAddNinja(Model model) {
        model.addAttribute("dojos", dojoService.findAll());
        return "ninja-add.jsp";
    }

    @PostMapping("/ninjas/new")
    public String addNinja(Model model, @Valid @ModelAttribute Ninja ninja, BindingResult result,
            RedirectAttributes redirect) {
        System.out.print("saving a new ninja");
        if (result.hasErrors()) {
            System.out.print(result);
            model.addAttribute("dojos", dojoService.findAll());
            return "ninja-add.jsp";
        }
        ninjaService.save(ninja);
        redirect.addFlashAttribute("info", "A new Ninja has just been added!");
        return "redirect:/dojos/" + ninja.getDojo().getId();
    }

}
