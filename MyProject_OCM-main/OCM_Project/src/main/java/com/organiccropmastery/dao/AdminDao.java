package com.organiccropmastery.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.organiccropmastery.model.Admin;

@Repository
public interface AdminDao extends JpaRepository<Admin, Integer> {
	
	Admin findByUsernameAndPassword(String username , String password);
	Admin findByEmailid(String emailId);
	Admin findByEmailidAndPassword(String emailid, String password);

}
