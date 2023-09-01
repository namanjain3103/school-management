package com.osttra.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.osttra.service.UserService;
import com.osttra.to.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	
	// after register
	@PostMapping("/register")
	public ModelAndView register(User user) {
		
		System.out.println("inside register()..." + user);
		
		boolean registration = userService.register(user);
		
		ModelAndView modelAndView = new ModelAndView("indexPage");
		
		if (registration == true) {
			
			modelAndView.addObject("registerSuccessMessage",
					"User Registered Successfully. Please wait for Admin to actvate your account !!");
		} else {
			modelAndView.addObject("registerSuccessMessage", "Username already exist !!!");
		}
		return modelAndView;
	}

	
	//After login
	@PostMapping("/welcome")
	public ModelAndView login(String username, String password, HttpServletRequest request) {
		
		System.out.println("inside register()..." + username + password);
		
		User user = userService.login(username, password);
		ModelAndView modelAndView = null;
		
		if (user != null && user.getLoginAttempts() == 0) {
			
			modelAndView = new ModelAndView("welcomePage");
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			
			if (!user.getRole().equalsIgnoreCase("student")) {

				List<User> users = userService.getAllUsers();
				modelAndView.addObject("users", users);
			}
		} else {
			modelAndView = new ModelAndView("indexPage");
			modelAndView.addObject("errorMessage", " Inactive User or Wrong Password !!!");
		}
		return modelAndView;
	}

	
	//home button
	@GetMapping({"/home", "/search", "/update" })
	public ModelAndView welcomePage(HttpServletRequest request) {
		
		ModelAndView modelAndView = null;
		HttpSession session = request.getSession(false);

		if (session != null) {
			
			modelAndView = new ModelAndView("welcomePage");
			System.out.println(((User) session.getAttribute("user")).getRole() + " this is the welcome page");
			
			if (!((User) session.getAttribute("user")).getRole().equalsIgnoreCase("student")) {
				
				List<User> users = userService.getAllUsers();
				modelAndView.addObject("users", users);
			}
		} else {
			modelAndView = new ModelAndView("indexPage");
			modelAndView.addObject("errorMessage", "Pleae check your credentials again !!");
		}

		return modelAndView;
	}


	//search button
	@PostMapping("/search")
	public ModelAndView search(String username, HttpServletRequest request) {
		
		ModelAndView modelAndView = null;
		HttpSession session = request.getSession(false);
		
		User user = null;
		
		if (session != null) {
			
			System.out.println("inside searchuser/-controller()");
			
			user = userService.searchUser(username);
			
			if (user != null) {
				System.out.println(user);
				
				modelAndView = new ModelAndView("userProfilePage");
				modelAndView.addObject("user", user);
				
			} else {
				modelAndView = new ModelAndView("WelcomePage");
				modelAndView.addObject("searchMessage", " No user with this username!!");
			}
		} else {
			modelAndView = new ModelAndView("indexPage");
			modelAndView.addObject("errorMessage", "User never log in !!!");
		}
		return modelAndView;
	}
    
	
	//delete button
	@GetMapping("/delete/{username}")
	public ModelAndView deleteUser(@PathVariable String username, HttpServletRequest request) {
		
		ModelAndView modelAndView = null;
		HttpSession session = request.getSession(false);
		
		if (session != null) {
			
			System.out.println("inside delete controller");
			
			userService.deleteUser(username);
			User user = ((User) session.getAttribute("user"));
			
			if (user.getRole().equalsIgnoreCase("Admin") && !user.getUsername().equalsIgnoreCase(username)) {
				
				modelAndView = new ModelAndView("welcomePage");
				List<User> users = userService.getAllUsers();
				modelAndView.addObject("users", users);
				modelAndView.addObject("deleteMessage", "User deleted successfully !!!");
				
			} else {
				modelAndView = new ModelAndView("indexPage");
				modelAndView.addObject("deleteMessage", "User deleted successfully !!!");
				session.invalidate();
			}
		} else {
			modelAndView = new ModelAndView("indexPage");
			modelAndView.addObject("errorMessage", "User never log in !!!");
		}
		return modelAndView;
	}

	
	//deactivate button
	@GetMapping("/deactivate/{username}")
	public ModelAndView deactivateUser(@PathVariable String username, HttpServletRequest request) {
		
		ModelAndView modelAndView = null;
		HttpSession session = request.getSession(false);

		if (session != null) {
			
			System.out.println("inside delete controller");
			
			boolean deactivateStatus = userService.deactivateUser(username);
			
			User user = ((User) session.getAttribute("user"));

			if (user.getRole().equalsIgnoreCase("Admin") && !user.getUsername().equalsIgnoreCase(username)) {
				
				modelAndView = new ModelAndView("welcomePage");
				List<User> users = userService.getAllUsers();
				modelAndView.addObject("users", users);

				if (deactivateStatus == true) {
					modelAndView.addObject("deactivateMessage", "User deactivated successfully !!!");
				} else 
					modelAndView.addObject("deactivateMessage", "User is already deactivated !!!");
				
			} else {
				modelAndView = new ModelAndView("indexPage");
				modelAndView.addObject("deactivateMessage", "User deactivated successfully !!!");
				session.invalidate();
			}
		} else {
			modelAndView = new ModelAndView("indexPage");
			modelAndView.addObject("errorMessage", "User never log in !!!");
		}
		return modelAndView;
	}

	
	//activate button
	@GetMapping("/activate/{username}")
	public ModelAndView activateUser(@PathVariable String username, HttpServletRequest request) {
		
		ModelAndView modelAndView = null;
		HttpSession session = request.getSession(false);

		if (session != null) {
			
			System.out.println("inside activate controller");

			boolean activateStatus = userService.activateUser(username);

			modelAndView = new ModelAndView("welcomePage");
			List<User> users = userService.getAllUsers();
			modelAndView.addObject("users", users);

			if (activateStatus == true) {
				
				modelAndView.addObject("activateMessage", "User activated successfully !!!");
			} else
				modelAndView.addObject("activateMessage", "User is already activated !!!");
		} else {
			modelAndView = new ModelAndView("indexPage");
			modelAndView.addObject("errorMessage", "User never log in !!!");
		}
		return modelAndView;
	}

	
	//update button 
	@GetMapping("/updatePage/{username}")
	public ModelAndView updatePage(@PathVariable String username, HttpServletRequest request) {
		
		ModelAndView modelAndView = null;
		HttpSession session = request.getSession(false);
		
		
		if (session != null) {
			
			System.out.println("inside updatepage controller");
			
			User user = userService.searchUser(username);
			
			modelAndView = new ModelAndView("updatePage");
			modelAndView.addObject("user", user);
			
		} else {
			modelAndView = new ModelAndView("indexPage");
			modelAndView.addObject("errorMessage", "User never log in !!!");
		}
		return modelAndView;
	}

	
	//after update
	@PostMapping("/update")
	public ModelAndView updateUser(User user, HttpServletRequest request) {
		
		ModelAndView modelAndView = null;
		HttpSession session = request.getSession(false);
		
		if (session != null) {
			
			System.out.println("inside update controller" + user);
			
			modelAndView = new ModelAndView("/updatePage");
			
			User updatedUser = userService.updateUser(user);
			
			// updating old session details with updated one...
			session.setAttribute("user", updatedUser);
			modelAndView.addObject("updateMessage", "User updated successfully !!!");

		} else {
			modelAndView = new ModelAndView("indexPage");
			modelAndView.addObject("errorMessage", "User never log in !!!");
		}
		return modelAndView;
	}

	// end of class...
}
