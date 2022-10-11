<%@ page import ="com.organiccropmastery.model.*"%>
<%@ page import ="com.organiccropmastery.resource.*"%>
<%@ page import="com.organiccropmastery.utility.*"%>
<%@ page import ="org.springframework.context.ApplicationContext"%>
<%@ page import ="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>

<%

String userType=(String)session.getAttribute("user-login");
Admin admin = null;
User user = null;
if(userType != null && userType.equals("admin")){
	 admin = (Admin) session.getAttribute("active-user");
}

else if(userType != null && userType.equals("user")){
	 user= (User)session.getAttribute("active-user");
}

ApplicationContext context =  WebApplicationContextUtils.getWebApplicationContext(getServletContext());
CategoryResource categoryresource = context.getBean(CategoryResource.class);
CartResource cartResource = context.getBean(CartResource.class);
ProductResource productResource = context.getBean(ProductResource.class);
UserResource userResource =context.getBean(UserResource.class);
OrderResource orderResource =context.getBean(OrderResource.class);
      
%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">

<div class="container-fluid">
  <img src="resources/images/logo.png" width="35" height="35" class="d-inline-block align-top" alt="">
  <a class="navbar-brand" href="/"><h3 style="color:white;"><i><b>OCM</b></i></h3></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    
    
    <%
        	 if(userType != null && userType.equals("admin"))
        	 {
    %>
                 <li class="nav-item active">
                    <a class="nav-link" href="admindashboard"><b style="color:white;">Admin Page</b> <span class="sr-only">(current)</span></a>
                 </li>
    <%
        	 }
    %>
      <li class="nav-item active dropdown text-color">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <b style="color:white;"> Categories</b>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="category?categoryId=0" >All</a>
               <%
                    for(Category c: categoryresource.getAllCategory())
                    {    	
               %> 
                         <a class="dropdown-item" href="category?categoryId=<%=c.getId() %>"><%=c.getName() %></a>     
               <%
                    }
               %>
          
        </div>
      </li>
      
      <li class="nav-item active text-color">
        <a class="nav-link" href="organic"><b style="color:white;">FAQs</b></a>
      </li>
      
      
      
    </ul>
    
    <form class="form-inline my-2 my-lg-0" action="searchproduct" method="post">
      <input class="form-control mr-sm-2" type="text" placeholder="Search product" aria-label="Search" size="40" name="productname">
      <button type="submit" class="btn btn-light" style="color:#5bccf6"><b>Search</b></button>
    </form>
    
    
        <%
           if(userType != null) {
        %>
          <ul class="navbar-nav ml-auto">
              
              <%
                  if(userType.equals("user"))
                  {	  
              %>
                     <li class="nav-item active" data-toggle="modal" data-target="#showmycartmodal">
                        <div class="nav-link text-color"><img src="resources/images/cart.png" style="width:23px;" alt="img">(<%=cartResource.getCartCountByUserId(user.getId()) %>)</div>
                     </li> 
                     
                     <li class="nav-item active text-color">
                        <a class="nav-link" href="myorder"><b style="color:white;">My Orders</b></a>
                     </li>
            
              <%
                  }
             %> 
             
              
              <li class="nav-item active text-color">
               <div class="nav-link" data-toggle="modal" data-target="#showprofilemodal"><b><%if(userType!=null && userType.equals("user") && user != null){ %><%=user.getFirstname() %><%} else if(userType!=null && userType.equals("admin") && admin !=null) { %><%=admin.getFirstname() %>  <% } %></b></div>
             </li> 
              
               <li class="nav-item active text-color">
               <div class="nav-link" data-toggle="modal" data-target=".changepasswordmodal"><b>change password</b></div>
             </li>
             
             <li class="nav-item active text-color" data-toggle="modal" data-target=".logout-modal">
               <a class="nav-link" href="#" ><b>Logout</b></a>
             </li> 
              
               
              </ul>   
              <%
             
           }     
              
                    
        else
        {
    %>
      <ul class="navbar-nav ml-auto text-color"> 
  
      
      
      <li class="nav-item active dropdown text-color ml-2">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="link" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <b style="color:white;">Register</b>
        </a>
        <div class="dropdown-menu " aria-labelledby="navbarDropdown">
          <a class="dropdown-item " href="userregister"><b class="text-color">user</b></a>
          <a class="dropdown-item" href="adminregister"><b class="text-color">admin</b></a>
              
        </div> 
      </li>   
      
    <li class="nav-item active dropdown text-color ml-2">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="link" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <b style="color:white;">Login</b>
        </a>
        <div class="dropdown-menu " aria-labelledby="navbarDropdown">
          <a class="dropdown-item " href="userlogin"><b class="text-color">user</b></a>
          <a class="dropdown-item" href="adminlogin"><b class="text-color">admin</b></a>
              
        </div> 
      </li>    
      
    </ul>
    
    <%
        }
    %>     
    
  </div>
  </div>
</nav>

<!-- show profile modal -->

<div class="modal fade" id="showprofilemodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >MY PROFILE</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
  <form >
         
  <div class="form-row mt-3">
    <div class="form-group col-md-4">
      <label for="inputEmail4">Name</label>
      <input type="text" class="form-control" id="inputEmail4" value="<%if(userType!=null && userType.equals("user")){ %><%=user.getFirstname() %><%} else if(userType!=null && userType.equals("admin")) { %><%=admin.getFirstname() %>  <% } %>" readonly>
    </div>
    <div class="form-group col-md-4">
      <label for="inputPassword4">Email</label>
      <input type="email" class="form-control" id="inputPassword4" value="<%if(userType!=null && userType.equals("user")){ %><%=user.getEmailid() %><%} else if(userType!=null && userType.equals("admin")) { %><%=admin.getEmailid() %>  <% } %>" readonly>
    </div>
    <div class="form-group col-md-4">
      <label for="inputPassword4">Phone</label>
      <input type="text" class="form-control" id="inputPassword4" value="<%if(userType!=null && userType.equals("user")){ %><%=user.getMobileno() %><%} else if(userType!=null && userType.equals("admin")) { %><%=admin.getMobileno() %>  <% } %>" readonly>
    </div>
  </div>
  <div class="form-group">
    <label for="inputAddress">Address</label>
    <textarea class="form-control" id="inputAddress"  rows="3" readonly><%if(userType!=null && userType.equals("user")){ %><%=user.getStreet() %><%} else if(userType!=null && userType.equals("admin")) { %><%=admin.getStreet() %>  <% } %></textarea>
  </div>
 
  <div class="container text-center">
       <button type="button" class="btn custom-bg text-light" data-dismiss="modal">Close</button>
  </div>   
</form>
      </div>
    </div>
  </div>
</div>

<!--  -->

<!-- show my cart modal -->

<div class="modal fade" id="showmycartmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >MY CART</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
     <%
      if(user!=null)
      {
    	  List<Cart> l= cartResource.getCartByUserId(user.getId());
    	 
     %>
      <div class="modal-body">
        
        <%
            if(l.isEmpty())
            {
        %>
        <div class="text-center">
        <h1>CART IS EMPTY!!</h1>
        <hr>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        <%
            }
        
            else
            {
            	
            	
        %>
        <div class="table-responsive">
          <table class="table">
  <thead class="custom-bg text-white">
    <tr>
      <th scope="col">Product Image</th>
      <th scope="col">Product Title</th>    
      <th scope="col">Product Description</th>
      <th scope="col">Quantity</th>
      <th scope="col">Price</th>
      <th scope="col">Date</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  
 
  
  <tbody>

   <%
      List<Integer> listOfProductId = new ArrayList<>();
   
      for(Cart c:l)
      {
    	  int productId=c.getProductId();
    	  Product p= productResource.getProductById(productId);
    	  listOfProductId.add(c.getProductId());
   %>
    <tr class="text-center">
      <td><img style="max-height:100px;max-width:70px;width:auto;" class="img-fluid mx-auto d-block" src="resources/productpic/<%=p.getImagePath()%>" alt="users_pic" ></td>
      <td class="mid-align"><%=p.getName() %></td>
      <td class="mid-align"><%=p.getDescription() %></td>
      <td class="mid-align"><%=c.getQuantity() %></td>
      <td class="mid-align"><%=productResource.getProductSellingPrice(p.getPrice(), p.getDiscount()) %></td>
      <td class="mid-align"><%=c.getDate() %></td>
      <td class="mid-align"><a href="deletecart?cartId=<%=c.getId()%>"><button type="button" class="btn btn-danger">Remove</button></a></td>
    </tr>
    <%
      }
    %>
  </tbody>
 
  
</table>
</div>
<hr>

<div class="text-right">
    <p style="font-size:25px;"><b>Total Price :&#8377;<%= productResource.getProductsTotalSellingPrice(listOfProductId) %>/- </b></p> 
</div>
<hr>
<div class="row">
      <form action="order" method="post">
          <input type="hidden" name="userId" value="<%=user.getId()%>">
          <input type="submit" class="btn custom-bg text-light ml-5" value="Order">
      </form>
      <button type="button" class="btn btn-secondary ml-5" data-dismiss="modal">Close</button>
</div>

       <%
            }
       %>
         
      </div>
  <%
           
      }
  %>
    </div>
  </div>
</div>

<!--  -->

<!-- Logout modal -->

<div class="modal fade logout-modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Log Out</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body text-center">
            <h5>Do you want to logout?</h5>
          
          <div class="text-center">
            <a href="logout"><button type="button" class="btn custom-bg text-white">Yes</button></a>
            <button type="button" class="btn btn-secondary ml-5" data-dismiss="modal">No</button>
          </div> 
     </div>     
    </div>
  </div>
</div>

<!-- *********** -->

<!-- change password modal -->

<div class="modal fade changepasswordmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Change Password</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
 <form action="changepassword" method="post"	oninput='cpass.setCustomValidity(cpass.value != pass.value ? "Passwords do not match." : "")'>
           <input type="hidden" name="userType" value="<%=userType%>">
  <div class="form" >
 
    <div class="form-group ">
      <label for="inputPassword4">Email</label>
      <input type="email" class="form-control" id="inputPassword4" name="email" value="<%if(userType!=null && userType.equals("user")){ %><%=user.getEmailid() %><%} else if(userType!=null && userType.equals("admin")) { %><%=admin.getEmailid() %>  <% } %>" readonly>
    </div>
    
    <div class="form-group">
      <label for="inputPassword4">Old Password</label>
      <input type="password" class="form-control" id="opass" name="opass" required="required">
    </div>
    
    <div class="form-group">
      <label for="inputPassword4">Password</label>
      <input type="password" class="form-control" id="pass" name="pass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Password must be combination of uppercase, smallcase and one special charcter" required="required" >
    </div>
    <div class="form-group">
      <label for="inputPassword4">Confirm Password</label>
      <input type="password" class="form-control" id="cpass" name="cpass"	required="required">
    </div>
  </div>
 
  <div class="container text-center">
       
       <input type="submit" class="btn custom-bg text-light" value="Change">
       <button type="button" class="btn custom-bg text-light ml-5" data-dismiss="modal">Close</button>
                                      
  </div>   
</form>
      </div>
    </div>
  </div>
</div>


<!--  -->

<!-- forget password modal -->

<div class="modal fade forgetpasswordmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Forget Password</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      
          <form action="forgetpassword" method="post" oninput='cpass.setCustomValidity(cpass.value != pass.value ? "Passwords do not match." : "")'>
          <input type="hidden" name="action" value="forgetPassword">
          
         
  	<div class="form"	>
 
    		<div class="form-group ">
      		<label for="inputPassword4">Email</label>
      		<input type="email" class="form-control" id="email" name="email"	required="required">
    </div>
    
    
    <div	class="form-row">
                 
                 
                 	<div class="form-group	col-md-4">
				      <label for="inputState">Country Code</label>
				      <select id="inputState" class="form-control"	required="required">
				        	<option selected>Choose...</option>
				        	<option>	+91	India 	</option>
							<option>	+54	Afghanistan 	</option>
							<option>	+61	Argentina 	</option>
							<option>	+43	Australia	</option>
							<option>	+32	Austria	</option>
							<option>	+55	Belgium 	</option>
							<option>	+56	Brazil 	</option>
							<option>	+86	Chile 	</option>
							<option>	+53	China 	</option>
							<option>	+53	Nigeria 	</option>
							<option>	+49	Cuba 	</option>
							<option>	+36	Germany 	</option>
							<option>	+39	Hungary 	</option>
							<option>	+58	Italy 	</option>
							<option>	+93	Venezuela 	</option>


				        
				      </select>
				    </div>
                 	
                 	<div class="form-group	col-md-8">
                     <label for="email">Mobile</label>
                     <input type="text" class="form-control" id="phone" aria-describedby="emailHelp" name="phone" placeholder="Enter mobile no" pattern="[7-9]{1}[0-9]{9}" title="Please enter the valid mobile number" required>
                 	</div>
                 	
                 	
                 
                 </div>
    <div class="form-group">
      <label for="inputPassword4">Password</label>
      <input type="password" class="form-control" id="pass" name="pass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Password must be combination of uppercase, smallcase and one special charcter" required="required">
    </div>
    <div class="form-group">
      <label for="inputPassword4">Confirm Password</label>
      <input type="password" class="form-control" id="cpass" name="cpass" required="required">
    </div>
  </div>
 
  <div class="container text-center">
       
       <input type="submit" class="btn custom-bg text-light" value="Change">
       <button type="button" class="btn custom-bg text-light ml-5" data-dismiss="modal">Close</button>
                                      
  </div>   
</form>
      </div>
    </div>
  </div>
</div>


<!--  -->

<!-- show my order modal -->

<div class="modal fade" id="showmyordermodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >MY ORDERS</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
     <%
      if(user!=null)
      {
    	  List<Orders> l= orderResource.getOrderByUserId(user.getId());
    	 
     %>
      <div class="modal-body">
        
        <%
            if(l == null )
            {
        %>
        <div class="text-center">
        <h1>NO ORDERS MADE BY YOU !!</h1>
        <hr>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        <%
            }
        
            else
            {
            	
            	
        %>
        <div class="table-responsive">
          <table class="table">
  <thead class="custom-bg text-white">
    <tr>
      <th scope="col">Product Image</th>
      <th scope="col">Product Title</th> 
      <th scope="col">Product Description</th>    
      <th scope="col">Quantity</th>
      <th scope="col">Price</th>
      <th scope="col">Order Id</th>
      <th scope="col">Ordered Date</th>
    </tr>
  </thead>
  
 
  
  <tbody>
  
   <%
      for(Orders o:l)
      {
    	  Product p=productResource.getProductById(o.getProductId());
   %>
    <tr class="text-center">
      <td><img style="max-height:100px;max-width:70px;width:auto;" class="img-fluid mx-auto d-block" src="resources/productpic/<%=p.getImagePath() %>" alt="users_pic" ></td>
      <td class="mid-align"><%=p.getName() %></td>
      <td class="mid-align"><%=p.getDescription() %></td>
      <td class="mid-align"><%=o.getQuantity() %></td>
      <td class="mid-align"><%=productResource.getProductSellingPrice(p.getPrice(), p.getDiscount()) * o.getQuantity() %></td>
      <td class="mid-align"><%=o.getOrderId() %></td>
      <td class="mid-align"><%=o.getOrderDate() %></td>
    </tr>
    <%
      }
    %>
  </tbody>
 
  
</table>
<hr>

<%-- <div class="text-right">
    <p style="font-size:25px;"><b>Total Price :&#8377;<%=new OrderDaoImp().totalOrderPrice(user.getUserId()) %>/- </b></p> 
</div> --%>
<hr>

      <button type="button" class="btn btn-secondary ml-5" data-dismiss="modal">Close</button>

       <%
            }
       %>
         
      </div>
  <%
           
      }
  %>
    </div>
  </div>
</div>
</div>

<!--  -->

