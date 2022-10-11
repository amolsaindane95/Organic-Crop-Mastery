<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@ page import ="com.organiccropmastery.model.*"%>
<%@ page import ="com.organiccropmastery.resource.*"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>

    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%@ include file="./components/common_cs_js.jsp"%>

</head>
<body>

 <%@ include file="./components/navbar.jsp"%>

    <%
        List<Category> li= new ArrayList<>();
        li = categoryresource.getAllCategory();
        List<User> listOfAllUsers = new ArrayList<>();
        listOfAllUsers = userResource.getAllUsers();
    %>
  
 <div class="container admin mt-2">
     <%@ include file="./components/message.jsp"%>
      <div class="row mt-3">
           <div class="col-md-4">
                 <div class="card hover" data-toggle="modal" data-target="#show-users-modal">
                     <div class="card-body text-center">
                         <div class="container">
                             <img style="max-width:120px" class="img-fluid rounded-circle" src="resources/images/user.png" alt="users_pic" >
                         </div>
                         <h1><%= userResource.getCountUsers()%></h1>
                         <h2 class="text-uppercase text-muted">Users</h2>
                     </div>
                 </div>
           </div>
           
           <div class="col-md-4">
                  <div class="card hover" data-toggle="modal" data-target="#show-category-modal">
                     <div class="card-body text-center">
                          <div class="container">
                             <img style="max-width:120px" class="img-fluid rounded-circle" src="resources/images/category.png" alt="users_pic" >
                         </div>
                          <h1><%=categoryresource.getCountOfCategory()%></h1>
                          <h2 class="text-uppercase text-muted">Total Category</h2>
                     </div>
                 </div>
           </div>
           
           <div class="col-md-4">
                  <div class="card hover" data-toggle="modal" data-target="#show-product-modal">
                     <div class="card-body text-center">
                           <div class="container">
                             <img style="max-width:120px" class="img-fluid rounded-circle" src="resources/images/product.png" alt="users_pic" >
                           </div>
                           <h1><%=productResource.getCountByProducts()%></h1>
                           <h2 class="text-uppercase text-muted">Total Products</h2>
                     </div>
                 </div>
           </div>
      </div>
      
      <div class="row mt-3" >
           <div class="col-md-4">
                 <div class="card hover" data-toggle="modal" data-target="#total-order-modal">
                     <div class="card-body text-center">
                         <div class="container">
                             <img style="max-width:120px" class="img-fluid rounded-circle" src="resources/images/check.png" alt="users_pic" >
                         </div>
                         <h1 class="text-lowercase text-muted"><%= orderResource.getCountOfOrders() %></h1>
                         <h2 class="text-uppercase text-muted">Total Orders</h2>
                     </div>
                 </div>
           </div>
           
           <div class="col-md-4">
                  <div class="card hover" data-toggle="modal" data-target="#add-category-modal">
                     <div class="card-body text-center">
                          <div class="container md-5">
                             <img style="max-width:120px" class="img-fluid rounded-circle" src="resources/images/addCategory.jpg" alt="users_pic" >
                         </div>
                          <p class="text-lowercase text-muted mt-2 " style="font-size:22px">click to add category</p>
                          <h2 class="text-uppercase text-muted mt-1">Add Category</h2>
                     </div>
                 </div>
           </div>
           
           <div class="col-md-4">
                  <div class="card hover" data-toggle="modal" data-target="#add-product-modal">
                     <div class="card-body text-center">
                          <div class="container">
                             <img style="max-width:120px" class="img-fluid rounded-circle" src="resources/images/addproduct.png" alt="users_pic" >
                         </div>
                          <p class="text-lowercase text-muted mt-2 " style="font-size:22px">click to add product</p>
                          <h2 class="text-uppercase text-muted">Add Product</h2>
                     </div>
                 </div>
           </div>
           
      </div>
      
 </div> 
  
<!-- add category modal -->
     
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLongTitle" >Fill category details.</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="addcategory" method="post">
               <div class="form-group">
                   <input type="text" class="form-control" name="name" placeholder="Enter Category Title here" required>
               </div>
               
               <div class="form-group">
                   <textarea style="height:250px" class="form-control" name="description" placeholder="Enter Category Description here" required></textarea>
               </div>
               
               <div class="container text-center">
                   <button class="btn custom-bg text-white">Add Category</button>
                   <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
               </div>   
          </form>
      </div>
    </div>
  </div>
</div>
      
      
  <!-- end add category modal -->
  
  <!-- add product modal -->
     
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLongTitle" >Add Product details.</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="addproduct" method="post" enctype="multipart/form-data">
               <div class="form-group">
                   <input type="text" class="form-control" name="productTitle" placeholder="Enter Product Title here" required>
               </div>
               
               <div class="form-group">
                   <textarea style="height:150px" class="form-control" name="productDescription" placeholder="Enter Product Description here" required></textarea>
               </div>
               
               <div class="form-group">
                   <input type="number" class="form-control" name="productPrice" placeholder="Enter Product Price here" required>
               </div>
               
               <div class="form-group">
                   <input type="text" class="form-control" name="productQuantity" placeholder="Enter Product Quantity here" required>
               </div>
               
               <div class="form-group">
                   <input type="text" class="form-control" name="productDiscount" placeholder="Enter Product Discount in (%)" required>
               </div>
               
               <div class="form-group">
                   <select name="productCategoryId" class="form-control">
                       <option value="">Select Category</option>
                       <%
                           for(Category category:li)
                           {
                       %>
                       <option value="<%=category.getId()%>"><%=category.getName() %></option>
                       <%
                           }
                       %>
                   </select>
               </div>
               
               <div class="form-group">
                   <label>Select Product Pic</label><br>
                   <input type="file" class="form-control" name="productPic" required>
               </div>
               
               <div class="container text-center">
                   <button class="btn custom-bg text-white">Add Product</button>
                   <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
               </div>   
          </form>
      </div>
    </div>
  </div>
</div>   
   
  <!-- end add product modal -->
  
  <!-- show users modal -->
     
<div class="modal fade" id="show-users-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Total Users</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="table-responsive">
          <table class="table">
  <thead class="custom-bg text-white">
    <tr>
      <th scope="col">User Id</th>
      <th scope="col">First Name</th>
      <th scope="col">Last Name</th>
      <th scope="col">Email Id</th>
      <th scope="col">Mobile</th>
      <th scope="col">Address</th>
    </tr>
  </thead>
  <tbody>
  
   <%
      for(User u:listOfAllUsers)
      {
   %>
    <tr>
      <th scope="row" class="mid-align"><%=u.getId() %></th>
      <td class="mid-align"><%=u.getFirstname() %></td>
      <td class="mid-align"><%=u.getLastname() %></td>
      <td class="mid-align"><%=u.getEmailid() %></td>
      <td class="mid-align"><%=u.getMobileno()%></td>
      <td class="mid-align"><%=u.getStreet()+" "+u.getCity()+" "+u.getPincode()%></td>
    </tr>
    <%
      }
    %>
  </tbody>
</table>
</div>
      </div>
    </div>
  </div>
</div>
        
<!-- end of show users modal -->

<!-- show category modal -->

<div class="modal fade" id="show-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Total Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="table-responsive">
          <table class="table">
  <thead class="custom-bg text-white">
    <tr>
      <th scope="col">Category Id</th>
      <th scope="col">Category Name</th>
      <th scope="col">Category Description</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>

   <%
      for(Category c: categoryresource.getAllCategory())
      {
   %>
    <tr>
      <td class="mid-align"><%=c.getId() %></td>
      <td class="mid-align"><%=c.getName() %></td>
      <td class="mid-align"><%=c.getDescription() %></td>
      <td class="mid-align"><a href="deletecategory?categoryId=<%=c.getId()%>"><input type="submit" class="btn btn-danger" value="Delete"></a></td>
    </tr>
    <%
      }
    %>
  </tbody>
</table>
</div>
      </div>
    </div>
  </div>
</div>

<!-- ********************* -->

<!-- show Product modal -->

<div class="modal fade" id="show-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >Total Product</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="table-responsive">
          <table class="table">
  <thead class="custom-bg text-white">
    <tr>
      <th scope="col">Product Name</th>
      <th scope="col">Product Image</th>
      <th scope="col">Product Description</th>
      <th scope="col">Product Category</th>
      <th scope="col">Product Price</th>
      <th scope="col">Product Discount</th>
      <th scope="col">Product Quantity</th>
    </tr>
  </thead>
  <tbody>
   <%
      List<Product> lp=productResource.getAllProducts();
   %>
  
   <%
      for(Product p:lp)
      {
   %>
    <tr>
      <td class="mid-align"><%=p.getName() %></td>
      <td class="mid-align"><img style="max-width:70px" class="img-fluid" src="resources/productpic/<%=p.getImagePath() %>" alt="users_pic" ></td>
      <td class="mid-align"><%=p.getDescription()%></td>
       <td class="mid-align"><%=categoryresource.getCategoryById(p.getCategoryId()).getName() %></td>
      <td class="mid-align"><%=p.getPrice() %></td>
      <td class="mid-align"><%=p.getDiscount() %></td>
      <td class="mid-align"><%=p.getQuantity() %></td>
    </tr>
    <%
      }
    %>
  </tbody>
</table>
</div>
      </div>
    </div>
  </div>
</div>

<!-- ********************* -->

<!-- total order modal -->

<div class="modal fade bd-example-modal-lg" id="total-order-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-size" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle" >TOTAL ORDERS</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    
      <div class="modal-body">
        
        <%
            List<Orders> lor= orderResource.getAllOrders(); 
            if(lor == null)
            {
        %>
        <div class="text-center">
        <h1>NO ORDERS MADE BY ANYONE !!</h1>
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
    <tr class="text-center">
      <th scope="col">User Id</th>
      <th scope="col">User Name</th>
      <th scope="col">User Email</th>
      <th scope="col">User Phone</th>
      <th scope="col">Product Image</th>
      <th scope="col">Product Title</th>    
      <th scope="col">Qnty</th>
      <th scope="col">Price</th>
      <th scope="col">Order Id</th>
      <th scope="col">Ord. date</th>
      
    </tr>
  </thead>
  
 
  
  <tbody>
  
   <%
      for(Orders o:lor)
      {
    	  Product prd =  productResource.getProductById(o.getProductId());
    	  User us= userResource.getUserById(o.getUserId());
   %>
    <tr class="text-center">
      <td class="mid-align"><%=us.getId() %></td>
      <td class="mid-align"><%=us.getFirstname() %></td>
      <td class="mid-align"><%=us.getEmailid() %></td>
      <td class="mid-align"><%=us.getMobileno() %></td>
      <td><img style="max-height:100px;max-width:70px;width:auto;" class="img-fluid mx-auto d-block" src="resources/productpic/<%=prd.getImagePath() %>" alt="users_pic" ></td>
      <td class="mid-align"><%=prd.getName() %></td>
      <td class="mid-align"><%=o.getQuantity() %></td>
      <td class="mid-align"><%=productResource.getProductSellingPrice(prd.getPrice(), prd.getDiscount())*o.getQuantity() %></td>
      <td class="mid-align"><%=o.getOrderId() %></td>
      <td class="mid-align"><%=o.getOrderDate() %></td>
    </tr>
    <%
      }
    %>
  </tbody>
 
  
</table>
</div>
<hr>

<div class="text-center">
      <button type="button" class="btn btn-secondary ml-5" data-dismiss="modal">Close</button>
</div>
       <%
            }
       %>
         
      </div>
    </div>
  </div>
</div>

<!--  -->
  
</body>
</html>