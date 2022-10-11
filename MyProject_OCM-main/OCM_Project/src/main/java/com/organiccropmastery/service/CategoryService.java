package com.organiccropmastery.service;

import java.util.List;

import com.organiccropmastery.model.Category;

public interface CategoryService {
	
	Category getCategoryById(int id);
	void deleteCategoryById(int id);
	Category addToCategory(Category Category);
	Category updateCategory(Category Category);
	List<Category> getAllCategory();
	Long getCountOfCategory();

}
