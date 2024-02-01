package com.mkenlo.burgertracker.services;

import java.util.List;
import java.util.Optional;

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

    public Burger saveBurgerReview(Burger burger) {
        return burgerRepository.save(burger);
    }

    public Burger findById(Long id){
        Optional<Burger> optional = burgerRepository.findById(id);
        if(optional.isPresent()) return optional.get();
        return null;
    }

    

}
