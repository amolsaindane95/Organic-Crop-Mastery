package com.organiccropmastery.service;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.organiccropmastery.dao.CategoryDao;
import com.organiccropmastery.model.Category;

@Service
public class CategoryServiceImp implements CategoryService{
	
	@Autowired
	private CategoryDao categoryDao; 

	@Override
	public Category getCategoryById(int id) {
        Optional<Category> optional = categoryDao.findById(id);
		
		if(optional.isPresent())
			return optional.get();
		else
			return null;
	}

	@Override
	public void deleteCategoryById(int id) {
		categoryDao.deleteById(id);
		
	}

	@Override
	public Category addToCategory(Category Category) {
		return categoryDao.save(Category);
	}

	@Override
	public Category updateCategory(Category Category) {
		return categoryDao.save(Category);
	}

	@Override
	public List<Category> getAllCategory() {
		return categoryDao.findAll();
	}

	@Override
	public Long getCountOfCategory() {
		return categoryDao.countOfCategory();
	}

}
