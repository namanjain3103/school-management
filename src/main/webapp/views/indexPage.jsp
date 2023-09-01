<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Gurukul Shiksha</title>
    <style>
@import
	url('https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;200;300;400;500;600;700;800;900&display=swap')
	;

body {
	height: 100%;
	font-family: 'Roboto Slab', serif;
	background-color: #f5f5f5;
}
    </style>
  </head>
  
  <body> 
  
<%@ page session="false" %>

  <main>
    <div class="py-5 text-center">
      <h2 class="text-danger font-weight-bold"> Gurukul siksha</h2>
      <p class="lead">Welcome to the log in page of Gurukul siksha  !!!</p>
    </div>
  
		<div class="container-fluid p-5  py-md-0 ">
			<div class="row d-flex justify-content-center ">
      <div class=" col-md-4 col-lg-4 ml-4 h-100 p-5 bg-body-tertiary border rounded-4 shadow ">
        <h4 class="mb-3 ">Enter Login Details</h4>
        <form  action="/welcome" method="post">
          <div class="row g-3">
            <div class="col-12">
              <label for="username" class="form-label" >Username</label>
              <div class="input-group has-validation">
                <span class="input-group-text">@</span>
                <input type="text" class="form-control" id="username" name="username" placeholder="Username" name="username" required >
              </div>
            </div>

            <div class="col-12">
              <label for="address" class="form-label">password</label>
              <input type="password" class="form-control" id="password" name="password" placeholder="**********" name="password" required>
            </div>

          <hr class="my-4">
          <button class="w-100 btn btn-outline-primary btn-lg mb-2" type="submit">Log In</button>
          </form>
          
          <a href="/register" style="text-decoration: none;">
          <button class="w-100 btn btn-outline-danger btn-lg mb-2 " type="button">Register</button>
          </a>
           <h6 style="color:red;">${registerSuccessMessage}</h6>
          <h6 style="color:red;">${errorMessage}</h6>
          <h6 style="color:red;">${deleteMessage}</h6>
          <h6 style="color:red;">${activateMessage}</h6>
          <h6 style="color:red;">${deactivateMessage}</h6>
          <h6 style="color:red;">${logoutMessage}</h6>
   
      </div>
    </div>
    </div>
  </main>



</html>