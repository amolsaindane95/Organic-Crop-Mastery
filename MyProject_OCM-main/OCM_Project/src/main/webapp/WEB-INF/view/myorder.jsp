<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.util.*"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<%@ page import ="java.text.DateFormat"%>
<%@ page import ="java.time.LocalDate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Orders</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<div class="container-fluid">
  <div class="row mt-4">
       <form class="form-inline ml-5" action="searchorderbyid">
          <div class="form-group">
            <label for="inputPassword2" class="text-color"><h4>Search By Order Id</h4></label>
            <input type="text" class="form-control ml-3" id="inputPassword2" name="orderid" placeholder="Enter Order Id">
          </div>
          <button type="submit" class="btn custom-bg ml-2" style="color:white;">Search</button>
       </form>
 
        <form class="form-inline mt-1" action="searchorderbydate">
        <input type="hidden" class="form-control ml-3" id="inputPassword2" name="userid" value="<%=user.getId()%>">
          <div class="form-group">
            <label for="inputPassword2" class="text-color ml-5"><h4>Search By Order Date</h4></label>
            <input type="text" class="form-control ml-3" id="inputPassword2" name="orderdate" placeholder="Enter Order Date">
          </div>
          <button type="submit" class="btn custom-bg ml-2" style="color:white;">Search</button>
       </form>
   
       <a href="searchorderbydate?orderdate=<%=LocalDate.now().toString()%>&userid=<%=user.getId()%>" class="ml-2"><button class="btn  custom-bg ml-2" style="color:white;">Get Todays Order</button></a>
  </div>
  <div class="table-responsive">
          <table class="table">
  <thead class="custom-bg text-color">
    <tr style="color:white;">
      <th scope="col">Id</th>
      <th scope="col">Order Id</th> 
      <th scope="col">Product Name</th>    
      <th scope="col">Product Image</th>
      <th scope="col">Product Description</th>
      <th scope="col">Quantity</th>
      <th scope="col">Price</th>
      <th scope="col">Order Date</th>
      <th scope="col">Delivery Date</th> 
    </tr>
  </thead>
  
   <%
      List<Orders> listOfOrders = new ArrayList<>();
   
   listOfOrders = (List<Orders>)request.getAttribute("orders");
      String isResponseFromOtherSource = (String)request.getAttribute("othersource");
      
      if(listOfOrders == null && isResponseFromOtherSource != null && isResponseFromOtherSource.equals("yes")){
    	  listOfOrders = orderResource.getOrderByUserId(user.getId());
      }
      
      if(listOfOrders != null ) {
          for(Orders o : listOfOrders) {
        	 Product p = productResource.getProductById(o.getProductId());
    %>
  <tbody>
    <tr class="text-center">
      <td class="mid-align"><%=o.getId()%></td>
      <td class="mid-align"><%=o.getOrderId() %></td>
      <td class="mid-align"><%=p.getName() %></td>
      <td><img style="max-height:100px;max-width:70px;width:auto;" class="img-fluid mx-auto d-block" src="resources/productpic/<%=p.getImagePath() %>" alt="users_pic" ></td>
      <td class="mid-align"><%=p.getDescription() %></td>
      <td class="mid-align"><%=o.getQuantity() %></td>
      <td class="mid-align"><%=productResource.getProductSellingPrice(p.getPrice(), p.getDiscount()) * o.getQuantity()%></td>
      <td class="mid-align"><%=o.getOrderDate() %></td>
    </tr>
  </tbody>
    <%
          }
      }
    %>
</table>
   </div>
</div>

</body>
</html>