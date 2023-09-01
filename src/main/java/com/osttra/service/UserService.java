package com.osttra.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.osttra.repository.UserRepository;
import com.osttra.to.User;

@Service
public class UserService {

	@Autowired
	UserRepository userRepository;

// register
	public boolean register(User user) {
		System.out.println("inside service od register");
		boolean registration = userRepository.addUser(user);

		return registration;
	}

// log in
	public User login(String username, String password) {
		System.out.println("inside service od login");

		User user = null;
		user = userRepository.getUser(username);

		if (user != null && user.getAccountStatus() == 1) {
			System.out.println("inside account status check");
			System.out.println(user.getPassword() + password);
			if (user.getPassword().equals(password)) {
				user.setLoginAttempts(0);
				user.setAccountStatus(1);
				System.out.println("inside password check ");
			} else {
				System.out.println("wrong password");
				user.setLoginAttempts(user.getLoginAttempts() + 1);
				if (user.getLoginAttempts() > 3) {
					user.setAccountStatus(0);
				}
			}
			userRepository.setLoginStatus(user);

		} else {
			System.out.println("account inactive");
			user = null;
		}

		return user;
	}

// search user
	public User searchUser(String username) {
		return userRepository.getUser(username);
	}

//getAllUser
	public List<User> getAllUsers() {
		return userRepository.getAllUsers();
	}

//deleteUser
	public void deleteUser(String username) {
		userRepository.deleteUser(username);

	}

//deactivateUser
	public boolean deactivateUser(String username) {
		return userRepository.deactivateUser(username);
	}

//activateUser
	public boolean activateUser(String username) {
		return userRepository.activateUser(username);
	}

//updateUser
	public User updateUser(User user) {
		System.out.println("inside user update service");
		userRepository.updateUser(user);
		User updatedUser = userRepository.getUser(user.getUsername());
		return updatedUser;
	}

}