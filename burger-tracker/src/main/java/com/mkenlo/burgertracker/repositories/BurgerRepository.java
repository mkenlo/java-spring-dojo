package com.mkenlo.burgertracker.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.mkenlo.burgertracker.models.Burger;

public interface BurgerRepository extends CrudRepository<Burger, Long> {
    List<Burger> findAll();

    Optional<Burger> findById(Long id);
}
