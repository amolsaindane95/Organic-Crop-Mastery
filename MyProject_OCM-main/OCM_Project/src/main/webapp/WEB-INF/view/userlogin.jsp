<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
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
                    <h3 class="text-center my-3">User Login</h3>
                    
            <form action="userlogin" method="post">
                 <div class="form-group">
                     <label for="email">User name</label>
                     <input type="text" class="form-control" id="username" aria-describedby="emailHelp" name="username" placeholder="Enter username" required>
                 </div>
              
                 <div class="form-group">
                     <label for="password">Password</label>
                     <input type="password" class="form-control" id="password" aria-describedby="emailHelp" name="password" placeholder="Enter password" required>
                     <small id="passwordHelpInline" class="text-muted">
                     </small>
                 </div>
        
                <div class="container text-center">
                      <button class="btn custom-bg text-color" style="height:50px;width:150px; color:white;"><b>Login</b></button>
                      <p class="w-100"></p>
                      
                       
                </div>
                
                
            </form>
            
            <div class="container text-center">
            	<button class="btn custom-bg text-color" style="height:50px;width:170px"> 
        				<div class="nav-link" data-toggle="modal" data-target=".forgetpasswordmodal"><b style="color:white; ">Forget password</b></div>
            	</button>
            </div>
            
                </div>
            </div>
           
            
       </div>
  </div>
</div>
</body>
</html>