package com.mkenlo.bookclub.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mkenlo.bookclub.models.Book;
import com.mkenlo.bookclub.services.BookService;
import com.mkenlo.bookclub.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

@Controller
@RequestMapping("/books")
public class BookController {

    @Autowired
    private BookService bookService;

    @Autowired
    private UserService userService;

    @GetMapping("")
    public String index(HttpSession session, Model model, RedirectAttributes redirect) {
        if (session.getAttribute("userId") == null) {
            redirect.addFlashAttribute("loginRequired", "Sorry, you need to login before.");
            return "redirect:/";
        }

        long userId = (Long) session.getAttribute("userId");

        model.addAttribute("user", userService.findById(userId));
        List<Book> books = bookService.getAllBooks();
        model.addAttribute("books", books);
        return "dashboard.jsp";
    }

    @GetMapping("/{bookId}")
    public String showBookDetail(@PathVariable("bookId") Long id, Model model, HttpSession session) {
        Book book = bookService.getABook(id);
        model.addAttribute("book", book);
        return "book-detail.jsp";
    }

    @PostMapping("/new")
    public String addABook(@Valid @ModelAttribute Book book, BindingResult result) {
        return "redirect:/books";
    }

    @GetMapping("/new")
    public String showNewbookForm() {
        return "book-add.jsp";
    }

    @GetMapping("/{bookId}/edit")
    public String showBookToEdit(@PathVariable("bookId") long id) {
        return "book-edit.jsp";
    }

    @PutMapping("/{bookId}/edit")
    public String updateABook(@PathVariable("bookId") long id) {
        return "redirect:/books";
    }

}
