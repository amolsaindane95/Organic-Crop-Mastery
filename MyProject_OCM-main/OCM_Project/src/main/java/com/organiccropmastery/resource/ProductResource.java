package com.organiccropmastery.resource;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.organiccropmastery.model.Product;
import com.organiccropmastery.service.ProductService;

@Component
public class ProductResource {
	
	@Autowired
	private ProductService productService;
	
	public Product getProductById(int id) {
		return productService.getProductById(id);
	}
	
	public void deleteProductById(int id) {
		productService.deleteProductById(id);
	}
	
	public Product addProduct(Product product) {
		return productService.addProduct(product);
	}
	
	public Product updateProduct(Product product) {
		return productService.updateProduct(product);
	}
	
	public List<Product> searchProductsByName(String productName){
		return productService.searchProductsByName(productName);
	}
	
	public List<Product> getAllProducts(){
		return productService.getAllProducts();
	}
	
	public List<Product> getProductByCategoryId(int categoryId){
		return productService.getProductByCategoryId(categoryId);
	}
	
	public double getProductSellingPrice(double productPrice,double productDiscountPercent)
    {
    	double tenPercentValue = productDiscountPercent*0.01;
    	double tenPercentOfPrice = tenPercentValue*productPrice;
    	
    	return productPrice-tenPercentOfPrice;
   
    }
	
	public double getProductsTotalSellingPrice(List<Integer> listOfProductId) {
		
		double totalPrice = 0;
		
		for(int productId: listOfProductId) {
			Product product = this.getProductById(productId);
			totalPrice = totalPrice + getProductSellingPrice(product.getPrice(),product.getDiscount());	    
		}
		
		return totalPrice;
		
	}
	
	public Long getCountByProducts() {
		return productService.getCountOfProduct();
	}
	
	public void deleteProductsByCategoryId(int categoryId) {
		productService.deleteProductByCategoryId(categoryId);
	}
	
	public void delete(Product product) {
		productService.delete(product);
	}

}
