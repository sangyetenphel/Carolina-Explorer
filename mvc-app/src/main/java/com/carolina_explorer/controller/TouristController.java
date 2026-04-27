package com.carolina_explorer.controller;

import com.carolina_explorer.entity.Tourist;
import com.carolina_explorer.entity.UserRole;
import com.carolina_explorer.service.TouristService;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.crypto.password.PasswordEncoder;

@Controller
public class TouristController {

    @Autowired
    private TouristService touristService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    // SHOW SIGNUP PAGE
    @GetMapping("/signup")
    public String showSignupForm() {
        return "signup";
    }

    // HANDLE FORM SUBMIT
    @PostMapping("/signup")
    public String signup(
            @RequestParam String firstName,
            @RequestParam String lastName,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String confirmPassword,
            @RequestParam LocalDate dateOfBirth
    ) {

        // Basic validation
        if (!password.equals(confirmPassword)) {
            return "redirect:/signup?error=password";
        }

        Tourist tourist = new Tourist();
        tourist.setFirstName(firstName);
        tourist.setLastName(lastName);
        tourist.setEmail(email);
        tourist.setPasswordHash(passwordEncoder.encode(password));
        tourist.setRole(UserRole.TOURIST);

        tourist.setDateOfBirth(dateOfBirth);

        touristService.createTourist(tourist);

        return "redirect:/?signup=success";
    }

    // @GetMapping("/login")
    // public String showLoginPage() {
    //     return "login";
    // }

    // @PostMapping("/login")
    // public String login(
    //         @RequestParam String email,
    //         @RequestParam String password,
    //         jakarta.servlet.http.HttpSession session
    // ) {

    //     Tourist tourist = touristService.login(email, password);

    //     if (tourist == null) {
    //         return "redirect:/login?error=true";
    //     }

    //     // store user in session
    //     session.setAttribute("loggedInUser", tourist);

    //     return "redirect:/?login=success";
    // }

    @GetMapping("/logout")
    public String logout(jakarta.servlet.http.HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}