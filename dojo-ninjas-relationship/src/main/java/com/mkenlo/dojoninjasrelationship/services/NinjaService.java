package com.mkenlo.dojoninjasrelationship.services;

import java.util.List;

import java.util.Optional;
import org.springframework.stereotype.Service;

import com.mkenlo.dojoninjasrelationship.models.Ninja;
import com.mkenlo.dojoninjasrelationship.repositories.NinjaRepository;

@Service
public class NinjaService {

    NinjaRepository repository;

    public NinjaService(NinjaRepository repository) {
        this.repository = repository;
    }

    public List<Ninja> findAll() {
        return repository.findAll();
    }

    Ninja findById(long id) {
        Optional<Ninja> optional = repository.findById(id);
        if (optional.isPresent())
            return optional.get();
        return null;
    }

}
