<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.osttra.to.User"%>
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
	<div class="container">
		<main>

			<jsp:include page="header.jsp" />

			<div class="py-2 text-center mt-5">
				<h1 class="mt-3 text-danger">Update form</h1>
				<p class="lead">Welcome to the update page of Gurukul siksha !!!</p>
			</div>

			<div class="container-fluid p-5  py-md-0 mb-5 ">
				<div class="row d-flex justify-content-center ">

					<div
						class=" col-md-10 col-lg-10 ml-8 h-100 p-5 bg-body-tertiary border rounded-4 shadow ">
						<h4 class="mb-3">Enter Details</h4>
						<h6 style="color: red;">${updateMessage}</h6>

						<form action="/update" method="post">
							<div class="row g-3">

								<div class="col-sm-6">
									<label for="firstName" class="form-label">First name</label> <input
										type="text" class="form-control" id="firstName"
										value="${user.getFirstName()}" name="firstName">
								</div>

								<div class="col-sm-6">
									<label for="lastName" class="form-label">Last name</label> <input
										type="text" class="form-control" id="lastName"
										value="${user.getLastName()}" name="lastName">
								</div>

								<div class="col-12">
									<label for="username" class="form-label">Username</label>
									<div class="input-group has-validation">
										<span class="input-group-text">@</span> <input type="text"
											class="form-control" id="username"
											value="${user.getUsername()}" name="username" readonly>
									</div>
								</div>

								<div class="col-12">
									<label for="email" class="form-label">Email <span
										class="text-body-secondary"></span></label> <input type="email"
										class="form-control" id="email"
										value="${user.getEmail()}" name="email">
								</div>

								<div class="col-12">
									<label for="password" class="form-label">Password</label> <input
										type="text" class="form-control" id="password"
										value="${user.getPassword()}" name="password">
								</div>

								<div class="col-md-5">
									<label for="role" class="form-label">Role</label> <input
										type="text" class="form-control" id="role"
										value="${user.getRole()}" name="role" readonly>
								</div>

								<div class="col-md-4">
									<label for="className" class="form-label">Class</label> <input
										type="text" class="form-control" id="className"
										value="${user.getClassName()}" name="className" readonly>
								</div>

								<hr class="my-4">

								<button class="w-100 btn btn-outline-primary btn-lg mb-0"
									type="submit">Update</button>
						</form>

					</div>
				</div>
			</div>
		</main>
</body>
</html>