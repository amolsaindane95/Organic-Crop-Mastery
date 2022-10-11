package com.organiccropmastery.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.organiccropmastery.model.Orders;

@Repository
public interface OrderDao extends JpaRepository<Orders , Integer> {
	
	List<Orders> findByOrderId(String orderId);
	List<Orders> findByUserId(int userId);
	List<Orders> findByOrderDate(String orderDate);
	List<Orders> findByOrderDateAndUserId(String orderDate, int userId);
	@Query(value="select count(o) from Orders o")
	Long countOfOrders();

}
