<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Register</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>

<%@ include file="./components/navbar.jsp"%>
<div class="container-fluid">
  <div class="row mt-2">
       <div class="col-md-4 offset-md-4 admin" >
            <div class="card">
                <%@ include file="./components/message.jsp"%>
                <div class="card-body px-5">
                    <img src="resources/images/registerphoto.jpeg" class="rounded mx-auto d-block" alt="img" height="90px" width="90px">
                    <h3 class="text-center my-3">Register User</h3>
            <form action="userregister" method="post"	oninput='cpassword.setCustomValidity(cpassword.value != password.value ? "Passwords do not match." : "")'>
           
           <div class="form-group">
                     <label for="name">First Name</label>
                     <input type="text" class="form-control" id="firstname" aria-describedby="emailHelp" name="firstname" placeholder="Enter first name" pattern="[A-Za-z]{3,}" title="First Name must contain alphabets only" required>
                 </div>
                 
                  <div class="form-group">
                     <label for="name">Last Name</label>
                     <input type="text" class="form-control" id="lastname" aria-describedby="emailHelp" name="lastname" placeholder="Enter last name" pattern="[A-Za-z]{3,}" title="Last Name must contain alphabets only"required>
                 </div>
             
          
                 <div class="form-group">
                     <label for="email">User name</label>
                     <input type="text" class="form-control" id="username" aria-describedby="emailHelp" name="username" placeholder="Enter username" pattern="^[A-Za-z0-9_]{1,32}$" title="You can use alphabet, number or undserscore only" required>
                 </div>
                 
                 <div class="form-group">
                     <label for="email">Email</label>
                     <input type="email" class="form-control" id="emailid" aria-describedby="emailHelp" name="emailid" placeholder="Enter email id" required>
                 </div>
                 
                 <div	class="form-row">
                 
                 
                 	<div class="form-group	col-md-4">
				      <label for="inputState">Country Code</label>
				      <select id="inputState" class="form-control">
				        <option	selected>	+91	India 	</option>
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
                     <input type="text" class="form-control" id="mobileno" aria-describedby="emailHelp" name="mobileno" placeholder="Enter mobile no" pattern="[6-9]{1}[0-9]{9}" title="Please enter the valid mobile number" required>
                 	</div>
                 	
                 	
                 
                 </div>
           
          
                  
                 
                  <div class="form-group">
                     <label for="name">Street</label>
                     <input type="text" class="form-control" id="street" aria-describedby="emailHelp" name="street" placeholder="Enter Address " required>
                 </div>
                 
             
                 <div class="form-group">
                     <label for="name">City</label>
                     <input type="text" class="form-control" id="city" aria-describedby="emailHelp" name="city" placeholder="Enter city" pattern="[A-Za-z]{3,}" title="City must contain alphabets only" required>
                 </div>
                 
                 <div class="form-group">
                     <label for="email">Pin code</label>
                     <input type="number" class="form-control" id="pincode" aria-describedby="emailHelp" name="pincode" placeholder="Enter pincode" pattern=".{6}" title="Enter valid Pin Code" required>
                 </div>
              
               
                 <div class="form-group">
                     <label for="password">Password</label>
                     <input type="password" class="form-control" id="password" aria-describedby="emailHelp" name="password" placeholder="Enter password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Password must be combination of uppercase, smallcase and one special charcter" required>
                     <small id="passwordHelpInline" class="text-muted">	</small>
                 </div>
                 
                 <div class="form-group">
                     <label for="password">Confirm Password</label>
                     <input type="password" class="form-control" id="cpassword" aria-describedby="emailHelp" name="cpassword" placeholder="Enter password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Password must be combination of uppercase, smallcase and one special charcter" required>
                     <small id="passwordHelpInline" class="text-muted">	</small>
                 </div>
             
                <div class="container text-center">
                      <button class="btn custom-bg" style="color:white;"><b>Register</b></button>
                 </div>
                 
            </form>
                </div>
            </div>
           
            
       </div>
  </div>
</div>


</body>
</html>