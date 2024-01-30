package com.mkenlo.burgertracker.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mkenlo.burgertracker.models.Burger;
import com.mkenlo.burgertracker.repositories.BurgerRepository;

@Service
public class BurgerService {

    BurgerRepository burgerRepository;

    public BurgerService(BurgerRepository burgerRepository) {
        this.burgerRepository = burgerRepository;
    }

    public List<Burger> getAllBurgerReviews() {
        return burgerRepository.findAll();
    }

    public Burger addBurgerReview(Burger burger) {
        return burgerRepository.save(burger);
    }

}
