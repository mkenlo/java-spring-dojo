package com.mkenlo.burgertracker.repositories;

import org.springframework.data.repository.CrudRepository;

import com.mkenlo.burgertracker.models.Burger;

public interface BurgerRepository extends CrudRepository<Burger, Long> {

}
