package com.mkenlo.savetravels.services;

import java.util.List;
import java.util.Optional;

import com.mkenlo.savetravels.models.Expense;
import com.mkenlo.savetravels.repositories.ExpenseRepository;

public class ExpenseService {

    ExpenseRepository repo;

    public ExpenseService(ExpenseRepository repo) {
        this.repo = repo;
    }

    List<Expense> getAllExpenses() {
        return repo.findAll();
    }

    Expense getById(long id) {
        Optional<Expense> optional = repo.findById(id);
        if (optional.isPresent())
            return optional.get();

        return null;
    }

    Expense save(Expense expense) {
        return repo.save(expense);
    }

    void deleteById(long id) {
        repo.deleteById(id);
    }

}
