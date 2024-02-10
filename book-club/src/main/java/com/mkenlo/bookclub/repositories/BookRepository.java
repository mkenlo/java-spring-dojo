package com.mkenlo.bookclub.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mkenlo.bookclub.models.Book;

@Repository
public interface BookRepository extends CrudRepository<Book, Long>{
    Optional<Book> findById(long id);

    List<Book> findAll();
}
