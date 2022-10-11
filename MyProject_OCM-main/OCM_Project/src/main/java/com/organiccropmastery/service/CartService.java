package com.organiccropmastery.service;

import java.util.List;

import com.organiccropmastery.model.Cart;

public interface CartService {
	
	Cart getCartById(int id);
	void deleteCartById(int id);
	Cart addToCart(Cart cart);
	Cart updateCart(Cart cart);
	List<Cart> getCartByUserId(int user);
	Long getTotalCartCountByUserId(int userId);
	void deleteCarts(List<Cart> carts);
	
}
