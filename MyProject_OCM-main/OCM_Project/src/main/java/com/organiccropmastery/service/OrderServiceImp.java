package com.organiccropmastery.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.organiccropmastery.dao.OrderDao;
import com.organiccropmastery.model.Orders;

@Service
public class OrderServiceImp implements OrderService {
	
	@Autowired
	private OrderDao orderDao;

	@Override
	public Orders getOrderById(int id) {
        Optional<Orders> optional = orderDao.findById(id);
		
		if(optional.isPresent())
			return optional.get();
		else
			return null;
	}

	@Override
	public void deleteOrderById(int id) {
		orderDao.deleteById(id);
	}

	@Override
	public Orders addOrder(Orders order) {
		return orderDao.save(order);
	}

	@Override
	public Orders updateOrder(Orders order) {
		return orderDao.save(order);
	}

	@Override
	public List<Orders> getOrderByUserId(int userId) {
		return orderDao.findByUserId(userId);
	}

	@Override
	public List<Orders> getOrderByOrderId(String orderId) {
		return orderDao.findByOrderId(orderId);
	}

	@Override
	public List<Orders> getAllOrders() {
		return orderDao.findAll();
	}

	@Override
	public Long getCountOfOrders() {
		return orderDao.countOfOrders();
	}

	@Override
	public List<Orders> addAllOrders(List<Orders> orders) {
		return orderDao.saveAll(orders);
	}

	@Override
	public List<Orders> getOrderByUserIdAndDate(String orderDate, int userId) {
		return orderDao.findByOrderDateAndUserId(orderDate, userId);
	}

	@Override
	public List<Orders> getOrderByDate(String orderDate) {
		return orderDao.findByOrderDate(orderDate);
	}

}
