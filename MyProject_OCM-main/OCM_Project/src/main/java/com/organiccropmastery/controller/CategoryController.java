package com.organiccropmastery.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.organiccropmastery.model.Category;
import com.organiccropmastery.model.Product;
import com.organiccropmastery.resource.CategoryResource;
import com.organiccropmastery.resource.ProductResource;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryResource categoryResource;
	
	@Autowired
	private ProductResource productResource;
	
	@PostMapping("/addcategory")
	public ModelAndView addcategory(@ModelAttribute Category category, Model model) {
		ModelAndView mv = new ModelAndView();
		if(this.categoryResource.addToCategory(category) != null ) {
			mv.addObject("status", category.getName()+" Successfully Added.");
			mv.setViewName("admin");
			
		}
		
		else {
			mv.addObject("status", "Failed to add category"+category.getName());
			mv.setViewName("adminregister");
			
		}
		
		return mv;
	}
	
	@GetMapping("/deletecategory")
	public ModelAndView addcategory(@RequestParam("categoryId") int categoryId) {
		ModelAndView mv = new ModelAndView();
		this.categoryResource.deleteCategoryById(categoryId);
		
		List<Product> products = productResource.getProductByCategoryId(categoryId);
		
		for(Product product : products) {
			productResource.delete(product);
		}
		
		    mv.addObject("status", "Category Deleted Successfully");
			mv.setViewName("index");
			
		return mv;
	}
	
	@GetMapping("/category")
	public ModelAndView category(@RequestParam("categoryId") int categoryId) {
		ModelAndView mv = new ModelAndView();
		List<Product> products = new ArrayList<>();
		if(categoryId == 0) {
			products = productResource.getAllProducts();
		}
		
		else {
			products = productResource.getProductByCategoryId(categoryId);
		}
		
		    mv.addObject("sentFromOtherSource","yes");
			mv.addObject("products", products);
			mv.setViewName("index");
		
		return mv;
	}
	

}
