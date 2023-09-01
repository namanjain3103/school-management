<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.osttra.to.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<title>Gurukul Shiksha</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;200;300;400;500;600;700;800;900&display=swap')
	;

body {
	height: 100%;
	font-family: 'Roboto Slab', serif;
	display: -ms-flexbox;
	display: -webkit-box;
	display: flex;
	-ms-flex-align: center;
	-ms-flex-pack: center;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

button {
	padding: 0;
}
</style>
</head>
<body>

	<div class="container-fluid py-md-5 p-5">

		<main>
			<jsp:include page="header.jsp" />
			<div class="row d-flex justify-content-center">
				<h2 class="text-danger font-weight-bold">Welcome to the ${ user.getRole() } proflie of ${ user.getFirstName() }</h2>
				<div class="col-md-8 col-lg-12 mb-4">
					<hr class="my-2">
					<h4 class="mt-5">
						<b>User Profile </b>
					</h4>
					<div class="row g-3">

						<div class="col-sm-4">
							<label for="firstName" class="form-label">First Name</label> <input
								type="test" class="form-control" id="firstName"
								value="${user.getFirstName() }" readonly>
						</div>
						<div class="col-sm-4">
							<label for="lastName" class="form-label">Last Name</label> <input
								type="text" class="form-control" id="lastName"
								value="${user.getLastName() }" readonly>
							<div class="invalid-feedback">Valid date is required.</div>
						</div>
						<div class="col-sm-4">
							<label for="username" class="form-label">Username</label> <input
								type="text" class="form-control" id="username"
								value="${user.getUsername() }" readonly>
						</div>

						<div class="col-sm-4">
							<label for="email" class="form-label">Email ID</label> <input
								type="email" class="form-control" id="email"
								value="${user.getEmail() }" readonly>
						</div>

						<div class="col-sm-4">
							<label for="className" class="form-label">Class</label> <input
								type="class" class="form-control" id="email"
								value="${user.getClassName() }" readonly>
						</div>

						<div class="col-sm-4">
							<label for="role" class="form-label">User Type</label> <input
								type="text" class="form-control" id="role"
								value="${user.getRole() }" readonly>
						</div>

					</div>
					<br> <br>
					<form form action="/logout" method="post">
						<a href="/updatePage/${ user.getUsername() }"><button
								type="button" class="btn btn-outline-primary">Update</button></a>
						<a href="/deactivate/${ user.getUsername() }"><button
								type="button" class="btn btn-outline-warning">Deactivate</button></a>
						<a href="/delete/${ user.getUsername() }"><button
								type="button" class="btn btn-outline-danger">Delete</button></a>
					</form>
				</div>
			</div>
			<hr class="my-1">

		</main>
	</div>

</body>
</html>