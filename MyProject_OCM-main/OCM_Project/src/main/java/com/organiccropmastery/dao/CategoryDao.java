package com.organiccropmastery.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.organiccropmastery.model.Category;

@Repository
public interface CategoryDao extends JpaRepository<Category, Integer> {
	
	@Query(value="select count(c) from Category c")
	Long countOfCategory();

}
