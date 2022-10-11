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

import com.organiccropmastery.hashing.MD5Hashing;
import com.organiccropmastery.model.Admin;
import com.organiccropmastery.model.User;
import com.organiccropmastery.resource.AdminResource;
import com.organiccropmastery.resource.UserResource;

@Controller
public class UserController {
	
	private static Logger LOG = LogManager.getLogger(UserController.class);

	@Autowired
	private UserResource userResource;
	
	@Autowired
	private AdminResource adminResource;

	
	@GetMapping("/userlogin")
	public String goToAdminLoginPage(HttpSession session) {
	if(session.getAttribute("active-user")==null && session.getAttribute("user-login")==null)
	{
		LOG.info("Redirecting to User Login Page.");
		return "userlogin";
	}
	else
		LOG.info("Redirecting to User index Page.");
		return "index";
		
	}
		
	@GetMapping("/userregister")
	public String goToAdminRegisterPage(HttpSession session) {
		if(session.getAttribute("active-user")==null && session.getAttribute("user-login")==null)
		{
			LOG.info("Redirecting to Userregister Page."); 
			return "userregister";
		}
		
		else
		{
			LOG.info("Redirecting to Index Page."); 
			return "index";
		}
	}
	
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("active-user")!=null && session.getAttribute("user-login")!=null)
		{
			session.removeAttribute("active-user");
			session.removeAttribute("user-login");
			mv.addObject("status","Logged out Successfully");
			mv.setViewName("index");
		}
		
		else
		{
			mv.setViewName("index");
		}
		
			return mv;
	}
	
	@PostMapping("/userregister")
	public ModelAndView registerAdmin(@ModelAttribute User user, Model model) {
		ModelAndView mv = new ModelAndView();
		if(this.userResource.addUser(user) != null ) {
			mv.addObject("status", user.getFirstname()+" Successfully Registered as User");
			mv.setViewName("userlogin");
			LOG.info("Registered User");
		}
		
		else {
			mv.addObject("status", user.getFirstname()+" Failed to Registered as User");
			mv.setViewName("userregister");
			LOG.info("Failed to Register as User");
		}
		
		return mv;
	}
	
	@PostMapping("/changepassword")
	public ModelAndView changepassword(@RequestParam("userType") String userType, @RequestParam("pass") String password, @RequestParam("email") String email, @RequestParam("opass") String opass) {
		ModelAndView mv = new ModelAndView();
		
		if(userType.equals("user")) 
		{
			User user = userResource.getEmailIdAndPassword(email, opass);
		    if(user != null) 
		    {
		    	password = MD5Hashing.doHashing(password);
		    	user.setPassword(password);
		        user = userResource.updateUser(user);
		        if(user != null) 
		        {
		        	mv.addObject("status", "password updated successfully.");
					mv.setViewName("index");
		        }
		    
		    }
		    
		    else
		    {
		    	mv.addObject("status", "Current Password Entered is Wrong, Try Again !!!");
				mv.setViewName("index");
		    }
		}
		
		else if(userType.equals("admin")) 
		{
			Admin admin  = adminResource.getAdminByEmailIdAndPassword(email, opass);
			if(admin != null) 
			{
				password = MD5Hashing.doHashing(password);
		    	admin.setPassword(password);
		        admin = adminResource.updateAdminById(admin);
		        mv.addObject("status", "password updated successfully.");
				mv.setViewName("index");
			}
			
			else
			{
				mv.addObject("status", "Current Password Entered is Wrong, Try Again !!!");
				mv.setViewName("index");
			}
		}
		
		return mv;
	}
	@PostMapping("/forgetpassword")
	public ModelAndView forgetPassword( @RequestParam("email") String email,@RequestParam("pass") String password, @RequestParam("phone") String phone) 
	{
				ModelAndView mv = new ModelAndView();
				User user = userResource.getEmailIdAndMobileno(email,phone);
				if(user != null) 
				 {
					 	password=MD5Hashing.doHashing(password);
						user.setPassword(password);
						user = userResource.updateUser(user);
			        	mv.addObject("status", "password updated successfully.");
						mv.setViewName("userlogin");
			     }
				 
				 else
				 {
					 mv.addObject("status", "Please enter correct Emailid & Password");
					 mv.setViewName("userlogin");
				 }
		
		
		
		return mv;
	}
	@PostMapping("/userlogin")
	public ModelAndView loginAdmin(HttpServletRequest request, @RequestParam String username, @RequestParam String password ) 
	{
		ModelAndView mv = new ModelAndView();
		User user=this.userResource.loginUser(username, password);
		if(user != null) 
		{
			HttpSession session = request.getSession();
			session.setAttribute("active-user", user);
			session.setAttribute("user-login","user");
			mv.addObject("status", username+" Successfully Logged in as user");
			mv.setViewName("index");
			LOG.info("Logged in as USER");
		}
		
		else {
			mv.addObject("status"," Failed to Login as User");
			mv.setViewName("userlogin");
			LOG.info("Failed to login as USER");
		}
		
		return mv;
	}
	
	
	@GetMapping("/organic")
	public String goToorganic() {
		LOG.info("Redirecting to tur FAQs Page.");
		return "organic";
	}
	
	
}
