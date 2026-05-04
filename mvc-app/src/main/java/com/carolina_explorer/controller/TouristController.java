package com.carolina_explorer.controller;

import com.carolina_explorer.entity.Tourist;
import com.carolina_explorer.entity.UserRole;
import com.carolina_explorer.service.TouristService;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
            @RequestParam LocalDate dateOfBirth,
            RedirectAttributes redirectAttributes
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

        // tourist.setDateOfBirth(dateOfBirth);

        touristService.createTourist(tourist);

        // flash message
            redirectAttributes.addFlashAttribute(
                "successMessage",
                "Account created successfully! Please log in 🎉"
            );

            return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout(jakarta.servlet.http.HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}