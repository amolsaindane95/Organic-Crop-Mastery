package com.organiccropmastery.service;

import java.util.List;

import com.organiccropmastery.model.Admin;

public interface AdminService {
	
	Admin addAdmin(Admin admin);
	Admin loginAdmin(String username, String password);
	void deleteAdminById(Integer id);
	Admin getAdminById(Integer id);
	List<Admin> getAllAdmin();
	Admin updateAdmin(Admin admin);
	Admin getAdminByEmailId(String emailid);
	Admin getAdminByEmailIdAndPassword(String email, String password);

}
