package com.osttra.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.osttra.to.User;

import com.osttra.utils.DBUtils;

@Repository
public class UserRepository {

	public boolean addUser(User user) {
		boolean registration;
		try {
			Connection connection = DBUtils.getConnection();
			PreparedStatement statement = connection.prepareStatement("insert into user_details values(?, ?, ?, ?, ?,?,?,?,?)");

			statement.setString(1, user.getFirstName());
			statement.setString(2, user.getLastName());
			statement.setString(3, user.getUsername());
			statement.setString(4, user.getEmail());
			statement.setString(5, user.getPassword());
			statement.setString(6, user.getRole());
			statement.setString(7, user.getClassName());
			statement.setInt(8, user.getLoginAttempts());
			statement.setInt(9, user.getAccountStatus());
			statement.executeUpdate();		
			
			registration = true;
			
		} catch (Exception e) {
			System.out.println("inside catch of add() of UserRepository... USERNAME ALREADY EXIST");
		//	e.printStackTrace();
			registration = false;
		}
		return registration;
	}

	
	public User getUser(String username) {
		User user = null;
		try {
			Connection connection = DBUtils.getConnection();
			PreparedStatement statement = connection.prepareStatement("select * from user_details where username = ?");
			statement.setString(1,username);
			ResultSet resultSet = statement.executeQuery();

			if (resultSet.next()) {
				String firstName = resultSet.getString(1);
				String lastName = resultSet.getString(2);
				String email = resultSet.getString(4);
				String password = resultSet.getString(5);
				String role = resultSet.getString(6);
				String className = resultSet.getString(7);  
				int loginAttempts = resultSet.getInt(8);
				int accountStatus = resultSet.getInt(9);

				user = new User(firstName, lastName, username, email, password, role, className, loginAttempts, accountStatus );
			}
		
		}
		catch (Exception e) {
			System.out.println("inside catch of add() of UserRepository...");
			e.printStackTrace();
		}
		return user;
	}

	
	public void setLoginStatus(User user) {
		try {

			Connection connection = DBUtils.getConnection();
			PreparedStatement statement = connection.prepareStatement("update user_details set login_attempts = ?, account_status = ? where username = ?");
			statement.setInt(1, user.getLoginAttempts());
			statement.setInt(2, user.getAccountStatus());
			statement.setString(3,user.getUsername());
			statement.executeUpdate();		
	}
		catch (Exception e) {
			System.out.println("inside catch of attemotedit() of UserRepository...");
			e.printStackTrace();
		}
}

	public List<User> getAllUsers() {
		User user = null;
		List<User> users = new ArrayList<>();
		Connection connection = DBUtils.getConnection();
		
		try {
			PreparedStatement statement = connection.prepareStatement("select * from user_details");
			ResultSet resultSet = statement.executeQuery();
			
			while(resultSet.next()) {
				String firstName = resultSet.getString(1);
				String lastName = resultSet.getString(2);
				String username = resultSet.getString(3);
				String email = resultSet.getString(4);
				String password = resultSet.getString(5);
				String role = resultSet.getString(6);
				String className = resultSet.getString(7);  
				int loginAttempts = resultSet.getInt(8);
				int accountStatus = resultSet.getInt(9);
				user = new User(firstName, lastName, username, email, password, role, className, loginAttempts, accountStatus );
				users.add(user);
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("inside repository.getallusers");
			e.printStackTrace();
		}
		return users;
	}


	public void deleteUser(String username) {	
		Connection connection = DBUtils.getConnection();
		try {
			PreparedStatement statement = connection.prepareStatement(" delete from user_details where username = ?");
			statement.setString(1,username);
			statement.executeUpdate();
		} catch (SQLException e) {
			System.out.println("inside catch of delete user repository");
			e.printStackTrace();
		}
	}


	public boolean deactivateUser(String username) {
		Connection connection = DBUtils.getConnection();
        boolean deactivateStatus = false;
		try {
			PreparedStatement statement = connection.prepareStatement(" update user_details set account_status = ? where username = ?");
			statement.setInt(1, 0 );
			statement.setString(2,username);
			int resultSet = statement.executeUpdate();
			if(resultSet > 0) {
				deactivateStatus = true;
			}
		} catch (SQLException e) {
			System.out.println("inside catch of deactivate user repository");
			e.printStackTrace();
		}
		return deactivateStatus;
	}


	public boolean activateUser(String username) {
		Connection connection = DBUtils.getConnection();
		boolean activateStatus = false;
		try {
			PreparedStatement statement = connection.prepareStatement(" update user_details set account_status = ? where username = ?");
			statement.setInt(1, 1 );
			statement.setString(2,username);
			statement.executeUpdate();
			int resultSet = statement.executeUpdate();
			if(resultSet > 0) {
				activateStatus = true;
			}
		} catch (SQLException e) {
			System.out.println("inside catch of deactivate user repository");
			e.printStackTrace();
		}	
		return activateStatus;
	}


	public Boolean updateUser(User user) {
		Connection connection = DBUtils.getConnection();
		boolean updateStatus = false;
		try {
			PreparedStatement statement = connection.prepareStatement(" update user_details set first_name = ?, last_name = ?, email = ?, password = ?   where username = ?");
			statement.setString(1, user.getFirstName() );
			statement.setString(2, user.getLastName() );
			statement.setString(3, user.getEmail() );
			statement.setString(4, user.getPassword() );
			statement.setString(5,user.getUsername());
			int resultSet = statement.executeUpdate();
			if(resultSet > 0) {
				updateStatus = true;
				System.out.println("inside user update repo");
			}
		} catch (SQLException e) {
			System.out.println("inside catch of deactivate user repository");
			e.printStackTrace();
		}	
		return updateStatus;
		
	}
	
}
