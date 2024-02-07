package com.mkenlo.dojoninjasrelationship.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.mkenlo.dojoninjasrelationship.models.Dojo;
import com.mkenlo.dojoninjasrelationship.repositories.DojoRepository;

@Service
public class DojoService {

    DojoRepository repository;

    public DojoService(DojoRepository repository) {
        this.repository = repository;
    }

    public List<Dojo> findAll() {
        return repository.findAll();
    }

    public Dojo findById(long id) {
        Optional<Dojo> optional = repository.findById(id);
        if (optional.isPresent())
            return optional.get();
        return null;
    }

    public Dojo save(Dojo dojo) {
        return repository.save(dojo);
    }

}
