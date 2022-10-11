package com.organiccropmastery.resource;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.organiccropmastery.model.Orders;
import com.organiccropmastery.service.OrderService;

@Component
public class OrderResource {
	
	@Autowired
	private OrderService orderService;
	
	public Orders getOrderById(int id) {
		return orderService.getOrderById(id);
	}
	
	public void deleteOrderById(int id) {
		orderService.deleteOrderById(id);
	}
	
	public Orders addOrder(Orders order) {
		return orderService.addOrder(order);
	}
	
	public Orders updateOrder(Orders order) {
		return orderService.updateOrder(order);
	}
	
	public List<Orders> getOrderByUserId(int userId){
		return orderService.getOrderByUserId(userId);
	}
	
	public List<Orders> getOrderByOrderId(String orderId){
		return orderService.getOrderByOrderId(orderId);
	}
	
	public List<Orders> getAllOrders(){
		return orderService.getAllOrders();
	}
	
	public Long getCountOfOrders() {
		return orderService.getCountOfOrders();
	}
	
	public List<Orders> addOrders(List<Orders> orders){
		return orderService.addAllOrders(orders);
	}
	
	public List<Orders> getOrderByOrderDate(String orderDate) {
		return orderService.getOrderByDate(orderDate);
	}
	
	public List<Orders> getOrderByOrderDateAndUserId(String orderDate, int userId){
		return orderService.getOrderByUserIdAndDate(orderDate, userId);
	}

}
