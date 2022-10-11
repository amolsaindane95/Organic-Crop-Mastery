package com.organiccropmastery.service;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.organiccropmastery.dao.CartDao;
import com.organiccropmastery.model.Cart;

@Service
public class CartServiceImp implements CartService {
	
	@Autowired
	private CartDao cartDao;

	@Override
	public Cart getCartById(int id) {
        Optional<Cart> optional = cartDao.findById(id);
		
		if(optional.isPresent())
			return optional.get();
		else
			return null;
	}

	@Override
	public void deleteCartById(int id) {
	    cartDao.deleteById(id);
	}

	@Override
	public Cart addToCart(Cart cart) {
		return cartDao.save(cart);
	}

	@Override
	public Cart updateCart(Cart cart) {
		return cartDao.save(cart);
	}

	@Override
	public List<Cart> getCartByUserId(int userId) {
		return cartDao.findByUserId(userId);
	}

	@Override
	public Long getTotalCartCountByUserId(int userId) {
		return cartDao.countByUserId(userId);
	}

	@Override
	public void deleteCarts(List<Cart> carts) {
		 cartDao.deleteAllInBatch(carts);
	}
	
}
