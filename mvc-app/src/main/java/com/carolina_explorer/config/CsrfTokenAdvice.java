package com.carolina_explorer.config;

import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

// Makes the CSRF token available to every FreeMarker template as ${_csrf}
@ControllerAdvice
public class CsrfTokenAdvice {

    @ModelAttribute("_csrf")
    public CsrfToken csrfToken(CsrfToken token) {
        return token;
    }
}
