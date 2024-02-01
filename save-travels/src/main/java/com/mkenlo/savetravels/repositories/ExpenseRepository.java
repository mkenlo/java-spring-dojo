package com.mkenlo.savetravels.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mkenlo.savetravels.models.Expense;
import java.util.List;
import java.util.Optional;

@Repository
public interface ExpenseRepository extends CrudRepository<Expense, Long> {

    List<Expense> findAll();

    Optional<Expense> findById(long id);

}
