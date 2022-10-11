package com.organiccropmastery.resource;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.organiccropmastery.model.Cart;
import com.organiccropmastery.service.CartService;

@Component
public class CartResource {
	
	@Autowired
	private CartService cartService;
	
	public Cart getCartById(int id) {
	   return cartService.getCartById(id);	
	}

	public void deleteCartById(int id) {
		 cartService.deleteCartById(id);
	}
	public Cart addToCart(Cart cart) {
		return cartService.addToCart(cart);
	}
	
	public Cart updatecart(Cart cart) {
		return cartService.updateCart(cart);
	}

	public List<Cart> getCartByUserId(int userId) {
		return cartService.getCartByUserId(userId);
	}
	
	public Long getCartCountByUserId(int userId) {
		return cartService.getTotalCartCountByUserId(userId);
	}
	
	public void deleteCarts(List<Cart> carts) {
		cartService.deleteCarts(carts);
	}

}
