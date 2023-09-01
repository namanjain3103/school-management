package com.osttra.to;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class User {
	
	private String firstName;
	private String lastName;
	private String username;
	private String email;
	private String password;
	private String role;
	private String className;
	private int loginAttempts = 0;
	private int accountStatus = 0;
}