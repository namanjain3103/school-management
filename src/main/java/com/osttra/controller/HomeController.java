package com.osttra.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

	
	@GetMapping({"/", "/login"})
	public String indexPage() {
		System.out.println("inside login page...");
		return "indexPage";
	}
	
	
	@GetMapping("/register")
	public String registrationPage() {

		System.out.println("inside login()...");
		return "registerPage";
	}

	
	@GetMapping("/logout")
	public ModelAndView logout(HttpServletRequest request) {
		
		System.out.println("inside logout()");

		ModelAndView modelAndView = new ModelAndView("indexPage");
		HttpSession session = request.getSession(false);
		
		if (session != null) {
			
			session.invalidate();
			modelAndView.addObject("logoutMessage", "log out successfully!!");
		} else
			modelAndView.addObject("errorMessage", "User never log in !!!");

		return modelAndView;
	}
}
