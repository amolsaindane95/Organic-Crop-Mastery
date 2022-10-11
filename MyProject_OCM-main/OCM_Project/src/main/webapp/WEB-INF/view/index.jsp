<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" style="width: 100%">
			<div class="carousel-item active">
				<img class="d-block w-100" src="resources/images/a.jpeg" alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="resources/images/b.jpeg" alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="resources/images/c.jpeg" alt="Third slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<%@ include file="./components/message.jsp"%>
	
	<%
	    List<Product> products = (List<Product>)request.getAttribute("products");
	    String productsSentFromOtherSource = (String)request.getAttribute("sentFromOtherSource");
	    List<Category> categories = categoryresource.getAllCategory();  
	    
	    if(productsSentFromOtherSource == null )
	    {
	    	products = productResource.getAllProducts();
	    }
	%>
	
	<div class="container-fluid">

   <!-- show categories -->
   
       <div class="row">
         <div class="col-md-2 " >
             <div class="list-group mt-4">
                 
                 <a href="category?categoryId=0" class="list-group-item list-group-item-action  active"  style="border:#5bccf6" >All Categories</a>
               <%
                    for(Category c: categories)
                    {    	
               %>      
                         <a href="category?categoryId=<%=c.getId() %>" class="list-group-item list-group-item-action"><%=c.getName()%></a>
               <%
                    }
               %>
               </div>
         </div>     
   
   
   
   <!-- ****************************************** -->

   <!-- show products -->
   
   <%
       if(products!=null)
       {
   %>
     
     <div class="col-md-10 ">
         
             <div class="row mt-4">
                 <div class="col-md-12 admin">
                     <div class="card-columns hover">
                     
                         <%
                             String stock="Out Of Stock!!!"; 
                             for(Product p: products)
                             {
                         %>
                        
                         <div class="card">
                              
                             <img src="resources/productpic/<%=p.getImagePath() %>" style="max-height:270px;max-width:100%;width:auto;" class="card-img-top rounded mx-auto d-block m-2" alt="img">
                         
                             <div class="card-body">
                                 <h5 class="card-title"><a href="product?productId=<%=p.getId()%>" style="text-decoration: none;color:black;"> <%=p.getName() %></a></h5>
                                 <p class="card-text"><%=Helper.get10Words(p.getDescription()) %></p> 
                             </div>
                             <div class="card-footer text-center">
                                 <p style="font-size:25px"><span class="ml-2"><b>&#8377;<%=productResource.getProductSellingPrice(p.getPrice(), p.getDiscount()) %>/-</b></span>
                                 <span class="ml-2" style="font-size:20px;color:red"><s>&#8377;<%=p.getPrice()%></s></span>
                                  <span class="ml-2" style="font-size:20px;color:green"><%=p.getDiscount() %>&#37 off</span>
                                 </p>
                                  <span class="ml-2" style="font-size:20px;">Stock :</span>
                                  <span class="ml-1" style="font-size:20px"><%if(p.getQuantity()<1){ %><span style="color:red;"><b><%=stock%></b></span><%} else{ %><%=p.getQuantity()%><% } %></span>
                             </div>
                             
                         </div>
                         
                       
                         <%
                             
                             }
                         %>
                     </div>
                 </div>
             </div>
            
         </div>
         
     <%
         } 
     %> 
    
         
      <!-- ******* -->
 
   
         
    </div>
 </div>

<!-- Footer -->
<footer class="page-footer font-small teal pt-4 custom-bg">

  <!-- Footer Text -->
  <div class="container-fluid text-center text-md-left">

    <!-- Grid row -->
    <div class="row">

      <!-- Grid column -->
      <div class="col-md-6 mt-md-0 mt-3" style="color:white;">

        <!-- Content -->
        <h5 class="text-uppercase font-weight-bold">ABOUT US</h5>
        <p>The Organic Crop Mastery is a platform for farmers as well as users where they get the proper 
        knowledge about the organic crop, fertilizers, sprays  and farmers can able to produce food of high nutritional quality in sufficient quantity.</p>

      </div>
      <!-- Grid column -->

      <hr class="clearfix w-100 d-md-none pb-3">

      <!-- Grid column -->
      <div class="col-md-6 mb-md-0 mb-3" style="color:white;">

        <!-- Content -->
        <h5 class="text-uppercase font-weight-bold">CONTACT US</h5>
        <p>Address  : Software IT Park IT-23, Sitapura Industrial Area, EPIP, Opposite RIICO Office, Near Globe Circle, Jaipur, Rajasthan-302022</p>
        <p>E-mail   : info@netcomedu.in</p>
         <p>Phone No : +91-96492-72709</p>
          

      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row -->

  </div>
  <!-- Footer Text -->

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3 " style="color:white;"> 2022 Copyright@ 
    <a href="/"> <span style="color:white;">OrganicCropMastery.com</span></a>
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->

</body>
</html>