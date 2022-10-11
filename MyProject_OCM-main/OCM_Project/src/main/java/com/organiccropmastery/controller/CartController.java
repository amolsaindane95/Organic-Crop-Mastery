package com.organiccropmastery.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.organiccropmastery.model.Cart;
import com.organiccropmastery.model.Product;
import com.organiccropmastery.resource.CartResource;
import com.organiccropmastery.resource.ProductResource;

@Controller
public class CartController {
	
	private static Logger LOG = LogManager.getLogger(CartController.class);

	@Autowired
	private CartResource cartResource;
	
	@Autowired
	private ProductResource productResource;
	
	@GetMapping("/addToCart")
	public ModelAndView addtoCart(@ModelAttribute Cart cart) {
		ModelAndView mv = new ModelAndView();
		
        Product product = productResource.getProductById(cart.getProductId());
		
		if(cart.getQuantity() > product.getQuantity()) {
			mv.addObject("status", "Can't add Product to Cart, Less stock");
			mv.setViewName("index");
			return mv;
		}
			
		if(cartResource.addToCart(cart) != null) {
			mv.addObject("status", "product added to cart successfully.");
			mv.setViewName("index");
		}
		
		else {
			mv.addObject("status", "Failed to add product to cart");
			mv.setViewName("index");
		}
		
		return mv;
	
	}
	
	@GetMapping("/deletecart")
	public ModelAndView deleteProductFromCart(@RequestParam("cartId") int  cartId) {
		ModelAndView mv = new ModelAndView();
		
		this.cartResource.deleteCartById(cartId);
		
		mv.addObject("status","Product deleted from Cart Successfully.");
		mv.setViewName("index");
		return mv;
	}

}
