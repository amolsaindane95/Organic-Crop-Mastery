package com.organiccropmastery.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.organiccropmastery.model.User;

@Repository
public interface UserDao extends JpaRepository<User, Integer> {
	
	User findByUsernameAndPassword(String username, String password);
	
	User findByEmailidAndPassword(String emailid, String password);
	
	User findByEmailidAndMobileno(String emailid, String mobileno);
	
	@Query(value="select count(u) from User u")
	Long countOfUser();
	
	User findByEmailid(String emailId);

}
