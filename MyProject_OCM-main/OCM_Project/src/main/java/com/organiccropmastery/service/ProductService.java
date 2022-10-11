package com.organiccropmastery.service;

import java.util.List;

import com.organiccropmastery.model.Product;

public interface ProductService {
	
	Product getProductById(int id);
	void deleteProductById(int id);
	Product addProduct(Product product);
	Product updateProduct(Product product);
	List<Product> searchProductsByName(String productName);
	List<Product> getAllProducts();
	List<Product> getProductByCategoryId(int categoryId);
	Long getCountOfProduct();
	void deleteProductByCategoryId(int categoryId);
	void delete(Product product);

}
