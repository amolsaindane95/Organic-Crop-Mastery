package com.organiccropmastery.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.organiccropmastery.model.Cart;
import com.organiccropmastery.model.Orders;
import com.organiccropmastery.model.Product;
import com.organiccropmastery.resource.CartResource;
import com.organiccropmastery.resource.OrderResource;
import com.organiccropmastery.resource.ProductResource;
import com.organiccropmastery.utility.Helper;

@Controller
public class OrderController {
	
	@Autowired
	private OrderResource orderResource;
	
	@Autowired
	private CartResource cartResource;
	
	@Autowired
	private ProductResource productResource;

	@PostMapping("/order")
	public ModelAndView orderProducts(@RequestParam("userId") int userId) {
		ModelAndView mv = new ModelAndView();
		
		String orderId = Helper.getAlphaNumericOrderId(10);
		String orderedDate = LocalDate.now().toString();
		
		List<Cart> carts = cartResource.getCartByUserId(userId);
		
		List<Orders> orders = new ArrayList<>();
		
		for(Cart cart : carts) {
			Orders order = new Orders();
			order.setOrderDate(orderedDate);
			order.setOrderId(orderId);
			order.setUserId(userId);
			order.setQuantity(cart.getQuantity());
			order.setProductId(cart.getProductId());
			orders.add(order);
			
			Product product = productResource.getProductById(cart.getProductId());
			product.setQuantity(product.getQuantity()-cart.getQuantity());
			
			productResource.updateProduct(product);
		}
		
		orders = orderResource.addOrders(orders);
		
		cartResource.deleteCarts(carts);
		
		if(orders != null) {
			mv.addObject("status","Order placed Successfully, Order Id is "+orderId);
		}
		
		else {
			mv.addObject("status","Failed to place order");
		}
		
		mv.setViewName("index");
		return mv;
	}
	
	@GetMapping("/searchorderbydate")
	public ModelAndView getOrdersByUserIdAndDate(@RequestParam("orderdate") String orderdate, @RequestParam("userid") int userid) {
		ModelAndView mv = new ModelAndView();
		   
		List<Orders> orders = orderResource.getOrderByOrderDateAndUserId(orderdate, userid);
		
		mv.addObject("orders", orders);
		mv.addObject("othersource", "yes");
		mv.setViewName("myorder");
		return mv;
	}
	
	@GetMapping("/searchorderbyid")
	public ModelAndView searchorderbyid(@RequestParam("orderid") String orderId) {
		ModelAndView mv = new ModelAndView();
		   
        List<Orders> orders = orderResource.getOrderByOrderId(orderId);
		
		mv.addObject("orders", orders);
		mv.addObject("othersource", "yes");
		mv.setViewName("myorder");
		
		return mv;
	}
	
	@GetMapping("/myorder")
	public String goToMyOrder() {
		return "myorder";
	}
	
	
}
