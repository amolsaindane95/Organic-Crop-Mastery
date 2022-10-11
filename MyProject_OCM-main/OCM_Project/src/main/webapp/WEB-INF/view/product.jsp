<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.time.LocalDate"%>
    <%@ page import ="org.springframework.context.ApplicationContext"%>
<%@ page import ="org.springframework.web.context.support.WebApplicationContextUtils"%>
    
<% 
    int pId = Integer.parseInt((String)request.getAttribute("productId")); 
    ApplicationContext con =  WebApplicationContextUtils.getWebApplicationContext(getServletContext());
    ProductResource pResource = con.getBean(ProductResource.class);
    Product product = pResource.getProductById(pId);
%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=pResource.getProductById(pId).getName() %></title>
<%@ include file="components/common_cs_js.jsp"%>

</head>
<body>
<%@ include file="./components/navbar.jsp"%>

<script type="text/javascript">
function checkquantity()
	{
		var quan1=document.getElementById("amount").value;
		var quan=parseInt(quan1);
		if(quan<=5)
			return true
		else
		{
			 return false;
			
			 
		}
			 
	}

</script>

<script type="text/javascript">
      function checkUser()
      {
    	  <%
    	       
    	      if(userType != null)
    	      {
    	    	  if(userType.equals("user"))
    	    	  {
    	  %>		
    	  			var result=checkquantity();
    	  			if(result==true)
    	  				return true;
    	  			else
    	  			{
    	  				alert("Only 5 products per Order");
    	  				return false;
    	  			}
    	  				
    	             
    	          <%
    	    	  }
    	    	  
    	    	  else
    	    	  {	  
    	    	  %>
    	    	  alert("Please login as customer to buy the product.");
    	    	  return false;
    	    	  <%
    	    	  }
    	    	  
    	      }
    	      else
    	      {
    	  %>
    	    	  alert("Please login to buy the product.");
    	    	  return false;
    	  <%
    	      }
    	  %>
      }
</script>
<%@ include file="./components/message.jsp"%>

<%
     String stock="Out Of Stock!!!"; 
%>

<div class="container-fluid">
   <div class="row">
         <div class="col-md-2" >
             <div class="list-group mt-4">
                 <a href="category?categoryId=0" class="list-group-item list-group-item-action active" style="border:#5bccf6">All Categories</a>
               <%
                   
                    for(Category c: categoryresource.getAllCategory())
                    {    	
               %>      
                         <a href="category?categoryId=<%=c.getId() %>" class="list-group-item list-group-item-action"><%=c.getName() %></a>
               <%
                    }
               %>
             </div>
        </div> 
        
        <div class="col-sm-3 mt-4 admin">
              <div class="card">
                   <img src="resources/productpic/<%=product.getImagePath() %>" style="max-height:500px;max-width:100%;width:auto;" class="card-img-top rounded mx-auto d-block m-2" alt="img">
              </div>
        </div>
        
        <div class="col-sm-6 mt-4 admin">
              <div class="card">
                   <div class="card-header text-center">
                        <h2><%=product.getName() %></h2>
                   </div>
                    <div class="text-left ml-3 mt-3"><h4>Description :</h4></div>
                        <div class="card-body text-left">     
                                 <p class="card-text"><%=product.getDescription() %></p> 
                        </div>
                        <div class="card-footer text-center">
                                 <p style="font-size:35px"><span style="font-size:35px;"><b>Price :</b></span><span class="ml-2"><b>&#8377;<%=productResource.getProductSellingPrice(product.getPrice(), product.getDiscount()) %>/-</b></span>
                                 <span class="ml-2" style="font-size:30px;color:red"><s>&#8377;<%=product.getPrice()%></s></span>
                                  <span class="ml-2" style="font-size:25px;color:green"><%=product.getDiscount() %>&#37 off</span>
                                  <span class="ml-5" style="font-size:22px;">Stock :</span>
                                  <span class="ml-1" style="font-size:20px">
                                  <%
                                  		if(product.getQuantity()<1)
                                  		{ 
                                  			
                                  %>
                                  
                                  		<span style="color:red;">
                                  		<b><%=stock%></b>
                                  		</span>
                                  		
                                  <%
                                  		} 
                                  		else
                                  		{ 
                                  %>
                                  		<%=product.getQuantity()%>
                                  		
                                  <% 
                                  		} 
                                  %>
                                  </span>
                                 </p>
                                 <hr>
                                 
                               <%
                                   if(userType != null && userType.equals("user"))
                                   {
                                	   
                                	   if(product.getQuantity()>=1) { 
                               %>
                               
                               <form class="form-inline" action="addToCart" onclick="return checkUser()">
                                  <input type="hidden" name="productId" value="<%=pId%>">
                                  <input type="hidden" name="userId" value="<%if(user!= null) {  %><%=user.getId() %> <%}%>">
                                  <% LocalDate date=LocalDate.now(); %>
                                  <input type="hidden" name="date" value="<%=date.toString()%>">
                                  <div class="form-group mx-sm-3 mb-2">
                                      <input type="number" class="form-control" name="quantity"	id="amount" placeholder="Quantity" required>
                                  </div>
                                  <button type="submit" class="btn custom-bg text-white mb-2">Add To Cart</button>
                               </form>
                              
                              <%
                              
                                	   }
                                   }
                               
                                   else if(userType != null && userType.equals("admin"))
                                   {
                              %> 
                                     
                                      <a href="deleteproduct?productId=<%=pId%>"><button type="button" class="btn btn-danger">Delete Product</button></a>
                                      <button type="button" class="btn custom-bg text-light ml-5" data-toggle="modal" data-target="#update-product-modal">Update Product</button>
                                      
                              <%
                                   }
                               
                                   else {
                              %> 
                              
                                 <form class="form-inline" action="addToCart" onclick="return checkUser()">
                                  <input type="hidden" name="productId" value="<%=pId%>">
                                  <input type="hidden" name="userId" value="<%if(user!= null) {  %><%=user.getId() %> <%}%>">
                                  <% LocalDate date=LocalDate.now(); %>
                                  <input type="hidden" name="date" value="<%=date.toString()%>">
                                  <div class="form-group mx-sm-3 mb-2">
                                      <input type="number" class="form-control" name="quantity" placeholder="Quantity" required>
                                  </div>
                                  <button type="submit" class="btn custom-bg text-white mb-2">Add To Cart</button>
                               </form>
                              
                              <%
                                   }
                              %>
                             
                        </div>
                   </div>
              </div>
        </div>
        
        
         <!-- update product modal -->
    
    <div class="modal fade" id="update-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLongTitle" >Update Product.</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
          <form action="updateproduct" method="post" enctype="multipart/form-data">
          
          <input type="hidden" name="productId" value="<%=pId%>">
        
     <div class="container text-center">
                   <img style="max-width:200px" class="img-fluid" src="resources/productpic/<%=product.getImagePath() %>" alt="users_pic" >
                   <h3><%=product.getImagePath() %></h3>
         </div> 
     
    <div class="form-group">
      <label for="inputEmail4">Product Title</label>
      <input type="text" class="form-control" name="productTitle" value="<%=product.getName() %>" required>
    </div>
    <div class="form-group">
      <label for="inputEmail4">Product Description</label>
      <textarea class="form-control"rows="4" name="productDescription" required><%=product.getDescription() %></textarea>
    </div>
    <div class="form-row">
    <div class="form-group col-md-4">
      <label for="inputEmail4">Product Price</label>
      <input type="number" class="form-control" name="productPrice" value=<%=product.getPrice() %> required>
    </div>
    <div class="form-group col-md-4">
      <label for="inputPassword4">Product Discount</label>
      <input type="number" class="form-control" name="productDiscount" value=<%=product.getDiscount() %> required>
    </div>
    <div class="form-group col-md-4">
      <label for="inputPassword4">Product Quantity</label>
      <input type="number" class="form-control" name="productQuantity" value=<%=product.getQuantity() %> required>
    </div>
   </div>
   
               <div class="form-group">
                   <label>Select Product Pic</label><br>
                   <input type="file" class="form-control" name="productPic" required>     
               </div>

   
   <div class="container text-center">
                   <input type="submit" class="btn custom-bg text-white" value="Update Product">
                   <!-- <button type="button" class="btn btn-secondary ml-5" data-dismiss="modal">Close</button> -->
               </div> 
    
</form>   
         
      </div>
    </div>
  </div>
</div>   
    <!-- *********************************** -->
     
    
    
     
</div>
</body>
</html>