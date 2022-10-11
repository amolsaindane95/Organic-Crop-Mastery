package com.organiccropmastery.service;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.organiccropmastery.dao.ProductDao;
import com.organiccropmastery.model.Product;

@Service
public class ProductServiceImp implements ProductService{
	
	@Autowired
	private ProductDao productDao;

	@Override
	public Product getProductById(int id) {
        Optional<Product> optional = productDao.findById(id);
		
		if(optional.isPresent())
			return optional.get();
		else
			return null;
	}

	@Override
	public void deleteProductById(int id) {
		productDao.deleteById(id);
	}

	@Override
	public Product addProduct(Product product) {
		return productDao.save(product);
	}

	@Override
	public Product updateProduct(Product product) {
		return productDao.save(product);
	}

	@Override
	public List<Product> searchProductsByName(String productName) {
		return productDao.findByNameContainingIgnoreCase(productName);
	}

	@Override
	public List<Product> getAllProducts() {
		return productDao.findAll();
	}

	@Override
	public List<Product> getProductByCategoryId(int categoryId) {
		return productDao.findByCategoryId(categoryId);
	}

	@Override
	public Long getCountOfProduct() {
		return productDao.countOfProducts();
	}

	@Override
	public void deleteProductByCategoryId(int categoryId) {
		productDao.deleteProductByCategoryId(categoryId);
	}

	@Override
	public void delete(Product product) {
		productDao.delete(product);
	}

}
