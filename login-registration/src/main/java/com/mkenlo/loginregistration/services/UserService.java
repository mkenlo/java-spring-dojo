package com.mkenlo.loginregistration.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.mkenlo.loginregistration.models.User;
import com.mkenlo.loginregistration.repositories.UserRepository;

@Service
public class UserService {

    @Autowired
    UserRepository repository;

    public User createUser(User user, BindingResult result) {

        if (!user.getPassword().equals(user.getConfirm())) {
            result.rejectValue("password", "match", "Confirm Password must Match Password");
        } else if (repository.findByEmail(user.getEmail()).isPresent()) {
            result.rejectValue("email", "exist", "Email already exist");
        }
        if (result.hasErrors())
            return null;
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return repository.save(user);
    }

    public User doLogin(User user, BindingResult result) {

        Optional<User> potentialUser = repository.findByEmail(user.getEmail());
        if (!potentialUser.isPresent()) {
            result.rejectValue("email", "exist", "Email not found");
        }
        if (!BCrypt.checkpw(user.getPassword(), potentialUser.get().getPassword()))
            result.rejectValue("password", "match", "Invalid Password");
        if (result.hasErrors())
            return null;
        return potentialUser.get();
    }

}
