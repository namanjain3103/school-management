<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.osttra.to.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gurukul Shiksha</title>
</head>
<body>

	<%
	User user = (User) session.getAttribute("user");
	String role = user.getRole();
	%>

	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark"
		aria-label="Main navigation">
		<div class="container-fluid">

			<div class="navbar-collapse offcanvas-collapse"
				id="navbarsExampleDefault">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ">

					<li class="nav-item "><a class="nav-link active font-weight-bold" 
						aria-current="page">  <b class="text-danger">Welcome to ${ user.getRole()} Panel of Gurukul Siksha</b></a></li>
	
					<li class="nav-item"><a class="nav-link active  font-weight-bold" style="color:blue;"
						aria-current="page" href="/home"><b>HOME</b></a></li>

					<li class="nav-item"><a class="nav-link active  font-weight-bold" style="color:blue;"
						aria-current="page" href="/logout"><b>LOGOUT</b></a></li>
				</ul>
				<%
				if (role.equalsIgnoreCase("admin")) {
				%>
				<form class="d-flex" action="/search" method="post">
					<input class="form-control me-2" type="search"
						placeholder="Enter Username" name="username" aria-label="Search">
					<button class="btn btn-outline-success  font-weight-bold" type="submit">SEARCH
					</button>
				</form>
				<%
				}
				%>
			</div>
		</div>

	</nav>
</body>
</html>