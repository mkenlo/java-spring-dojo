package com.mkenlo.bookclub.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
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
import org.springframework.web.bind.annotation.RequestParam;

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
    public String showBookDetail(@PathVariable("bookId") Long id, Model model, HttpSession session,
            RedirectAttributes redirect) {
        if (session.getAttribute("userId") == null) {
            redirect.addFlashAttribute("loginRequired", "Sorry, you need to login before.");
            return "redirect:/";
        }
        Book book = bookService.getABook(id);
        model.addAttribute("book", book);
        return "book-detail.jsp";
    }

    @PostMapping("/new")
    public String addABook(@Valid @ModelAttribute("newBook") Book book, BindingResult result) {
        if (result.hasErrors()) {
            return "book-add.jsp";
        }
        bookService.saveBook(book);
        return "redirect:/books";
    }

    @GetMapping("/new")
    public String showNewbookForm(HttpSession session, RedirectAttributes redirect) {
        if (session.getAttribute("userId") == null) {
            redirect.addFlashAttribute("loginRequired", "Sorry, you need to login before.");
            return "redirect:/";
        }
        return "book-add.jsp";
    }

    @GetMapping("/{bookId}/edit")
    public String showBookToEdit(@PathVariable("bookId") long id, HttpSession session, RedirectAttributes redirect,
            Model model) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            redirect.addFlashAttribute("loginRequired", "Sorry, you need to login before.");
            return "redirect:/";
        }
        Book bookToEdit = bookService.getABook(id);
        if (!bookToEdit.getReviewer().getId().equals(userId)) {
            redirect.addFlashAttribute("notAuthorized", "Sorry, you are not authorized.");
            return "redirect:/books";
        }
        model.addAttribute("book", bookToEdit);
        return "book-edit.jsp";
    }

    @PutMapping("/{bookId}/edit")
    public String updateABook(@PathVariable("bookId") long id, @Valid @ModelAttribute Book book, BindingResult result,
            Model model) {
        if (result.hasErrors()) {
            System.out.println(result);
            model.addAttribute("book", bookService.getABook(id));
            return "book-edit.jsp";
        }
        bookService.saveBook(book);
        return "redirect:/books";
    }

    @DeleteMapping("/{bookId}/delete")
    public String deleteBook(@PathVariable("bookId") long id, HttpSession session, RedirectAttributes redirect) {
        if (session.getAttribute("userId") == null) {
            redirect.addFlashAttribute("loginRequired", "Sorry, you need to login before.");
            return "redirect:/";
        }
        bookService.deleteBook(id);
        redirect.addFlashAttribute("alert", "Deletion was successfull");
        return "redirect:/books";
    }

}
