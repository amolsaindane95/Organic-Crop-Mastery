package com.organiccropmastery.service;

import java.util.List;

import com.organiccropmastery.model.User;

public interface UserService {
	
	User getUserById(int id);
	void deleteUserById(int id);
	User addUser(User User);
	User updateUser(User User);
	List<User> getAllUsers();
	User loginUser(String username, String password);
	Long getCountOfUser();
	User getUserByEmail(String emailId);
	User getEmailIdAndPassword(String emailid, String password);
	User getEmailIdAndMobileno(String emailid, String mobileno);

}
