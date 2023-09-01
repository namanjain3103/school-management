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

    
    <!-- Custom styles for this template -->
    <link href="checkout.css" rel="stylesheet">
  </head>
  <body> 
<div class="container">
  <main>
    <div class="py-2 text-center ">
      <h1 class="text-danger">Registration form</h1>
      <p class="lead">Welcome to the log in page of Gurukul siksha  !!!</p>
    </div>

     	<div class="container-fluid p-5  py-md-0 mb-5 ">
			<div class="row d-flex justify-content-center ">

      <div class=" col-md-10 col-lg-10 ml-8 h-100 p-5 bg-body-tertiary border rounded-4 shadow ">
        <h4 class="mb-3">Enter Details</h4>
     
     
        <form  action="/register" method="post"  >
          <div class="row g-3">
            <div class="col-sm-6">
              <label for="firstName" class="form-label">First name</label>
              <input type="text" class="form-control" id="firstName" placeholder=" first name" name="firstName" required>
 
            </div>

            <div class="col-sm-6">
              <label for="lastName" class="form-label" >Last name</label>
              <input type="text" class="form-control" id="lastName" placeholder="last name" name="lastName" required>
 
            </div>

            <div class="col-12">
              <label for="username" class="form-label">Username</label>
              <div class="input-group has-validation">
                <span class="input-group-text">@</span>
                <input type="text" class="form-control" id="username" placeholder="Username" name="username" required>
   
              </div>
            </div>

            <div class="col-12">
              <label for="email" class="form-label">Email <span class="text-body-secondary"></span></label>
              <input type="email" class="form-control" id="email" placeholder="you@example.com" name="email" required>

            </div>

            <div class="col-12">
              <label for="address" class="form-label">password</label>
              <input type="password" class="form-control" id="password" placeholder="**********" name="password" required>

            </div>

            <div class="col-md-5">
              <label for="role" class="form-label">Role</label>
              <select class="form-select" id="role" name="role" required>
                <option value="Student">Student</option>
                 <option value="Teacher">Teacher</option>
                  <option value="Admin">Admin</option>
              </select>
  
            </div>

            <div class="col-md-4">
              <label for="className" class="form-label">Class</label>
              <select class="form-select" id="className" name="className" required>
                <option value="C_101">C_101</option>
                <option value="C_102">C_102</option>
                <option value="C_103">C_103</option>
                <option value="C_104">C_104</option>
                <option value="Admin">Admin</option>
              </select>

            </div>

          <hr class="my-4">

          <button class="w-100 btn btn-outline-primary btn-lg mb-0" type="submit">Register</button>
        </form>
   
      </div>
    </div>
    </div>
  </main>
</body>
</html>