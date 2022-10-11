package com.organiccropmastery.resource;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.organiccropmastery.dao.AdminDao;
import com.organiccropmastery.hashing.MD5Hashing;
import com.organiccropmastery.model.Admin;
import com.organiccropmastery.service.AdminService;

@Component
public class AdminResource {
	
	@Autowired
	private AdminService adminService;

	public boolean addAdmin(Admin admin) {
		
		if(admin==null) {
			return false;
		}
		
		String hashedPassword=MD5Hashing.doHashing(admin.getPassword());
		admin.setPassword(hashedPassword);
	
		Admin a = adminService.addAdmin(admin);
		
		if(a==null) {
			return false;
		}
		
		else {
			return true;
		}
			
	}
	
    public Admin loginAdmin(String username, String password) {
		
		if(username==null || password==null) {
			return null;
		}
		
		password=MD5Hashing.doHashing(password);
		
		Admin admin = adminService.loginAdmin(username, password);
		
		if(admin==null) {
			return null;
		}
		
		else {
			return admin;
		}	
	}
    
    public List<Admin> getAllAdmin(){
    	return adminService.getAllAdmin();
    }
    
    public Admin getAdminById(int adminId) {
    	return adminService.getAdminById(adminId);
    }
    
    public void deleteAdminById(int adminId) {
    	adminService.deleteAdminById(adminId);
    }
	
    public Admin updateAdminById(Admin admin) {
    	return adminService.updateAdmin(admin);
    }
    
    public Admin getAdminByEmailId(String email) {
    	return adminService.getAdminByEmailId(email);
    }
    
    public Admin getAdminByEmailIdAndPassword(String email, String password) {
    	password = MD5Hashing.doHashing(password);
    	return adminService.getAdminByEmailIdAndPassword(email, password);
    
    }

}
