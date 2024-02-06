package com.mkenlo.dojoninjasrelationship.repositories;

import org.springframework.data.repository.CrudRepository;

import com.mkenlo.dojoninjasrelationship.models.Ninja;
import java.util.List;
import java.util.Optional;

public interface NinjaRepository extends CrudRepository<Ninja, Long> {

    List<Ninja> findAll();

    Optional<Ninja> findById(Long id);

}
