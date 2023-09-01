<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.osttra.to.User, java.util.List"%>

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
</style>
</head>
<body>

	<%
	User user = (User) session.getAttribute("user");
	String role = user.getRole();
	List<User> users = (List<User>) request.getAttribute("users");
	%>
	<div class="container-fluid py-md-5 p-5">

		<main>
		
			<jsp:include page="header.jsp" />
			
			 <h6 style="color:red;">${searchMessage}</h6>
			<div class="row d-flex justify-content-center">
				<h2 class="text-danger font-weight-bold">Hi, ${ user.getFirstName() }</h2>
				<div class="col-md-8 col-lg-12 mb-4">
					<hr class="my-2">
					<h4 class="mt-5">
						<b>User Profile </b>
					</h4> </br>
					<div class="row g-3">

						<div class="col-sm-4">
							<label for="firstName" class="form-label">First Name</label> <input
								type="test" class="form-control" id="firstName"
								value="${user.getFirstName() }"readonly>
						</div>
						<div class="col-sm-4">
							<label for="lastName" class="form-label">Last Name</label> <input
								type="text" class="form-control" id="lastName"
								value="${user.getLastName() }"readonly>
							<div class="invalid-feedback">Valid date is required.</div>
						</div>
						<div class="col-sm-4">
							<label for="username" class="form-label">Username</label> <input
								type="text" class="form-control" id="username"
								value="${user.getUsername() }"readonly>
						</div>

						<div class="col-sm-4">
							<label for="email" class="form-label">Email ID</label> <input
								type="email" class="form-control" id="email"
								value="${user.getEmail() }"readonly>
						</div>

						<div class="col-sm-4">
							<label for="className" class="form-label">Class</label> <input
								type="class" class="form-control" id="email"
								value="${user.getClassName() }"readonly>
						</div>

						<div class="col-sm-4">
							<label for="role" class="form-label">User Type</label> <input
								type="text" class="form-control" id="role"
								value="${user.getRole() }" readonly>
						</div>

					</div>
					<br> <br>
					<form >
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

			<%
			if (!role.equalsIgnoreCase("student") && users.size() > 1) {
			%>

			<div class="row d-flex justify-content-center ">
				<h4 class="mt-5 mb-3">
					<b> User Profile List</b>
					 <h6 style="color:red;">${deleteMessage}</h6>
					 <h6 style="color:red;">${deactivateMessage}</h6>
					  <h6 style="color:red;">${activateMessage}</h6>
					  <h6 style="color:red;">${updateMessage}</h6>
				</h4>
				<div class="col-md-8 col-lg-12 mb-4 ">
					<div
						class="h-100 p-5 bg-body-tertiary border rounded-4 shadow text-center">
						<table class="table">
							<thead class="thead-dark">
								<tr>
									<th scope="col">#</th>
									<th scope="col">First Name</th>
									<th scope="col">Last Name</th>
									<th scope="col">Username</th>
									<th scope="col">Email</th>
									<th scope="col">Role</th>
									<th scope="col">Class</th>
									<%
									if (role.equalsIgnoreCase("admin")) {
									%>
									<th scope="col">Account Status</th>
									<th scope="col">Update</th>
									<th scope="col">Activate</th>
									<th scope="col">Deactivate</th>
									<th scope="col">Delete</th>
									<%
									}
									%>
								</tr>
							</thead>
							<tbody>
								<%
								int count = 0;
								for (int i = 0; i < users.size(); i++) {
									if (role.equalsIgnoreCase("admin") && !user.getUsername().equalsIgnoreCase(users.get(i).getUsername())) {
										count++;
								%>
								<tr>
									<th scope="row"><%=count%></th>
									<td><%=users.get(i).getFirstName()%></td>
									<td><%=users.get(i).getLastName()%></td>
									<td><%=users.get(i).getUsername()%></td>
									<td><%=users.get(i).getEmail()%></td>
									<td><%=users.get(i).getRole()%></td>
									<td><%=users.get(i).getClassName()%></td>
									<td><%=users.get(i).getAccountStatus()%></td>
								<td>
										<a href="/updatePage/<%= users.get(i).getUsername()%>"><button
												type="button" class="btn btn-outline-primary">Update</button></a>
									</td>

									<td>
										<a href="/activate/<%= users.get(i).getUsername()%>"><button
												type="button" class="btn btn-outline-success">Activate</button></a>
									</td>
									<td>

										<a href="/deactivate/<%= users.get(i).getUsername()%>"><button
												type="button" class="btn btn-outline-warning">Deactivate</button></a>
									</td>
									<td>

										<a href="/delete/<%= users.get(i).getUsername()%>"><button
												type="button" class="btn btn-outline-danger">Delete</button></a>
									</td>
								</tr>
								<%
								} else if (role.equalsIgnoreCase("teacher") && users.get(i).getRole().equalsIgnoreCase("student")) {
								count++;
								%>
								<tr>
									<th scope="row"><%=count%></th>
									<td><%=users.get(i).getFirstName()%></td>
									<td><%=users.get(i).getLastName()%></td>
									<td><%=users.get(i).getUsername()%></td>
									<td><%=users.get(i).getEmail()%></td>
									<td><%=users.get(i).getRole()%></td>
									<td><%=users.get(i).getClassName()%></td>
								</tr>
								<%
								}
								}
								%>
							</tbody>
						</table>


					</div>
				</div>

			</div>
			<%
			}
			%>
		</main>
	</div>

</body>
</html>