package com.carolina_explorer.controller;

import com.carolina_explorer.entity.User;
import com.carolina_explorer.entity.UserRole;
import com.carolina_explorer.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    // show login page
    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    // handle login form
    @PostMapping("/login")
    public String login(
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session
    ) {

        User user = userService.findByEmail(email);

        if (user == null || !passwordEncoder.matches(password, user.getPasswordHash())) {
            return "redirect:/login?error=true";
        }

        // store user in session
        session.setAttribute("loggedInUser", user);

        // redirect based on role
        if (user.getRole() == UserRole.TOUR_GUIDE) {
            return "redirect:/guides/dashboard";
        }

        return "redirect:/"; // tourist goes home
    }
}