package com.mkenlo.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.mkenlo.savetravels.models.Expense;
import com.mkenlo.savetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {

    ExpenseRepository repo;

    public ExpenseService(ExpenseRepository repo) {
        this.repo = repo;
    }

    public List<Expense> getAllExpenses() {
        return repo.findAll();
    }

    public Expense getById(long id) {
        Optional<Expense> optional = repo.findById(id);
        if (optional.isPresent())
            return optional.get();

        return null;
    }

    public Expense save(Expense expense) {
        return repo.save(expense);
    }

    public void deleteById(long id) {
        repo.deleteById(id);
    }

}
