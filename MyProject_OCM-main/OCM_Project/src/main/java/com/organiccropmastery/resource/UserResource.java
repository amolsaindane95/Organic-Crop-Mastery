package com.organiccropmastery.resource;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.organiccropmastery.hashing.MD5Hashing;
import com.organiccropmastery.model.User;
import com.organiccropmastery.service.UserService;

@Component
public class UserResource {
	
	@Autowired
	private UserService userService;
	
	public User getUserById(int id) {
		return userService.getUserById(id);
	}
	
	public void deleteUserById(int id) {
		userService.deleteUserById(id);
	}
	
	public User addUser(User user) {
		String hashedPassword=MD5Hashing.doHashing(user.getPassword());
		user.setPassword(hashedPassword);
	
		return userService.addUser(user);
	}
	
	
	
	public User updateUser(User User) {
		return userService.updateUser(User);
	}
	
	public List<User> getAllUsers(){
		return userService.getAllUsers();
	}
	
	public User loginUser(String username, String password) {
		password=MD5Hashing.doHashing(password);
		return userService.loginUser(username, password);
	}
	
	public Long getCountUsers() {
		return userService.getCountOfUser();
	}
	
	public User getUserByEmail(String email) {
		return userService.getUserByEmail(email);
	}
	
	public User getEmailIdAndPassword(String emailid, String password) {
		password=MD5Hashing.doHashing(password);
		return userService.getEmailIdAndPassword(emailid, password);
	}
	
	public User getEmailIdAndMobileno(String emailid, String mobileno)
	{
		return userService.getEmailIdAndMobileno(emailid, mobileno);
	}

}
