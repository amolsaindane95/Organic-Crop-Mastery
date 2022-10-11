package com.organiccropmastery.resource;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.organiccropmastery.model.Category;
import com.organiccropmastery.service.CategoryService;

@Component
public class CategoryResource {
	
	@Autowired
	private CategoryService categoryService; 
	
	public Category getCategoryById(int id) {
		return categoryService.getCategoryById(id);
	}
	
	public void deleteCategoryById(int id) {
		categoryService.deleteCategoryById(id);
	}
	
	public Category addToCategory(Category Category) {
		return categoryService.addToCategory(Category);
	}
	
	public Category updateCategory(Category Category) {
		return categoryService.updateCategory(Category);
	}
	
	public List<Category> getAllCategory(){
		return categoryService.getAllCategory();
	}
	
	public Long getCountOfCategory() {
		return categoryService.getCountOfCategory();
	}
	
}
