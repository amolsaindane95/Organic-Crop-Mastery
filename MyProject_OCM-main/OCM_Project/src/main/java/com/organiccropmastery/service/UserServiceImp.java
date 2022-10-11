package com.organiccropmastery.service;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.organiccropmastery.dao.UserDao;
import com.organiccropmastery.model.User;

@Service
public class UserServiceImp implements UserService {
	
	@Autowired
	private UserDao userDao;

	@Override
	public User getUserById(int id) {
        Optional<User> optional = userDao.findById(id);
		
		if(optional.isPresent())
			return optional.get();
		else
			return null;
	}

	@Override
	public void deleteUserById(int id) {
		userDao.deleteById(id);
	}

	@Override
	public User addUser(User User) {
		return userDao.save(User);
	}

	@Override
	public User updateUser(User User) {
		return userDao.save(User);
	}

	@Override
	public List<User> getAllUsers() {
		return userDao.findAll();
	}

	@Override
	public User loginUser(String username, String password) {
		return userDao.findByUsernameAndPassword(username, password);
	}

	@Override
	public Long getCountOfUser() {
		return userDao.countOfUser();
	}

	@Override
	public User getUserByEmail(String emailId) {
		return userDao.findByEmailid(emailId);
	}
	
	@Override
	public User getEmailIdAndPassword(String emailid, String password)
	{
		return userDao.findByEmailidAndPassword(emailid, password);
	}
	
	@Override
	public User getEmailIdAndMobileno(String emailid, String mobileno)
	{
		return userDao.findByEmailidAndMobileno(emailid, mobileno);
	}

}
