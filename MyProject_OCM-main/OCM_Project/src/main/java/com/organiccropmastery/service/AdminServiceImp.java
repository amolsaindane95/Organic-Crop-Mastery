package com.organiccropmastery.service;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.organiccropmastery.dao.AdminDao;
import com.organiccropmastery.model.Admin;

@Service
public class AdminServiceImp implements AdminService {

	@Autowired
	private AdminDao adminDao;

	@Override
	public Admin addAdmin(Admin admin) {
		return adminDao.save(admin);
	}

	@Override
	public Admin loginAdmin(String username, String password) {
		return adminDao.findByUsernameAndPassword(username, password);
	}

	@Override
	public void deleteAdminById(Integer id) {
		adminDao.deleteById(id);
	}

	@Override
	public Admin getAdminById(Integer id) {
        Optional<Admin> optional = adminDao.findById(id);
		
		if(optional.isPresent())
			return optional.get();
		else
			return null;
	}

	@Override
	public List<Admin> getAllAdmin() {
		return adminDao.findAll();
	}

	@Override
	public Admin updateAdmin(Admin admin) {
	    return adminDao.save(admin);
	}

	@Override
	public Admin getAdminByEmailId(String emailid) {
		return adminDao.findByEmailid(emailid);
	}
	
	public Admin getAdminByEmailIdAndPassword(String email, String password)
	{
		return adminDao.findByEmailidAndPassword(email, password);
	}
	
}
