package com.carolina_explorer.service;

import com.carolina_explorer.entity.User;
import com.carolina_explorer.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public User findByEmail(String email) {
        return userRepository.findByEmail(email).orElse(null);
    }
}