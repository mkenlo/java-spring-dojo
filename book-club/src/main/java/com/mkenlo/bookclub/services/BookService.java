package com.mkenlo.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.mkenlo.bookclub.models.Book;
import com.mkenlo.bookclub.repositories.BookRepository;

@Service
public class BookService {
    // adding the book repository as a dependency
    private final BookRepository bookRepository;

    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    // returns all the books
    public List<Book> getAllBooks() {
        return bookRepository.findAll();
    }

    // create or edit a book
    public Book saveBook(Book b) {
        return bookRepository.save(b);
    }

    // retrieves a book
    public Book getABook(Long id) {
        Optional<Book> optionalBook = bookRepository.findById(id);
        if (optionalBook.isPresent()) {
            return optionalBook.get();
        } else {
            return null;
        }
    }

}
