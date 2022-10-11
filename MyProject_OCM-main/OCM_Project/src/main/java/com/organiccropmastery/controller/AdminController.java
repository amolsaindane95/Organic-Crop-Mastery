package com.organiccropmastery.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.organiccropmastery.model.Admin;
import com.organiccropmastery.resource.AdminResource;

@Controller
public class AdminController {
	
	private static Logger LOG = LogManager.getLogger(AdminController.class);

	@Autowired
	private AdminResource adminResource;
	
	@GetMapping("/")
	public String goToHomeDuringStart() {
		LOG.info("Redirecting to Index page.");
		return "index";
	}
	
	@GetMapping("/admindashboard")
	public String goToAdminPage(HttpSession session) 
	{
		if(session.getAttribute("active-user")!=null && session.getAttribute("user-login")=="admin")
		{
			LOG.info("Redirecting to User Admin Dashboard Page.");
			return "admin";
		}
		else
		{
			LOG.info("Redirecting to User index Page.");
			return "index";
			
		}
	}
	
	@GetMapping("/adminlogin")
	public String goToAdminLoginPage(HttpSession session) 
	{
		if(session.getAttribute("active-user")!=null && session.getAttribute("user-login")=="admin")
		{
			return "index";
		}
		else
		{
			LOG.info("Redirecting to Admin Login Page.");
			return "adminlogin";
		}
		
	}
	
	@GetMapping("/adminregister")
	public String goToAdminRegisterPage(HttpSession session) 
	{
		if(session.getAttribute("active-user")==null && session.getAttribute("user-login")==null)
		{
			LOG.info("Redirecting to Admin Login Page.");
			return "adminregister";
		}
		
		else
		{
			LOG.info("Redirecting to Index Page."); 
			return "index";
		}
		
	}
	
	@PostMapping("/adminregister")
	public ModelAndView registerAdmin(@ModelAttribute Admin admin, Model model) {
		ModelAndView mv = new ModelAndView();
		if(this.adminResource.addAdmin(admin)==true) {
			mv.addObject("status", admin.getFirstname()+" Successfully Registered as ADMIN");
			mv.setViewName("adminlogin");
			LOG.info("Registered ADMIN");
		}
		
		else {
			mv.addObject("status", admin.getFirstname()+" Failed to Registered as ADMIN");
			mv.setViewName("adminregister");
			LOG.info("Failed to Register as  ADMIN");
		}
		
		return mv;
	}
	
	@PostMapping("/adminlogin")
	public ModelAndView loginAdmin(HttpServletRequest request, @RequestParam String username, @RequestParam String password ) {
		ModelAndView mv = new ModelAndView();
		Admin admin=this.adminResource.loginAdmin(username, password);
		if(admin != null) {
			HttpSession session = request.getSession();
			session.setAttribute("active-user", admin);
			session.setAttribute("user-login","admin");
			mv.addObject("status", username+" Successfully Logged in as ADMIN");
			mv.setViewName("index");
			LOG.info("Logged in as ADMIN");
		}
		
		else {
			mv.addObject("status"," Failed to Login as ADMIN");
			mv.setViewName("adminlogin");
			LOG.info("Failed to login as ADMIN");
		}
		
		return mv;
	}
	
}
