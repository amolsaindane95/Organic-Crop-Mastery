package com.organiccropmastery.service;

import java.util.List;

import com.organiccropmastery.model.Orders;

public interface OrderService {
	
	Orders getOrderById(int id);
	void deleteOrderById(int id);
	Orders addOrder(Orders order);
	Orders updateOrder(Orders order);
	List<Orders> getOrderByUserId(int userId);
	List<Orders> getOrderByOrderId(String orderId);
	List<Orders> getAllOrders();
	Long getCountOfOrders();
	List<Orders> addAllOrders(List<Orders> orders);
	List<Orders> getOrderByUserIdAndDate(String orderDate, int userId);
	List<Orders> getOrderByDate(String orderDate);
	
}
