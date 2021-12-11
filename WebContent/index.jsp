<!DOCTYPE html>
<html>
<head>
        <title>Retro Tech Surplus Main Page</title>
		<style>
			html,
			body{
				margin:0;
			}

			.banner {
				background: #d2a24c
			}

			.banner__content {
				padding: 20px;
				max-width: 230px;
				margin: 0 auto;
				display: flex;
				align-items: center;
			}

			.banner__text{
				flex-grow: 2;
				line-height: 1.4;
				color: #FFFFFF;
				font-family: 'Comic sans MS', sans-serif;
				align-items: center;
			}
		</style>
</head>
<body bgcolor="#ECE6C2">
	<div class="banner">
		<div class="banner__content">
			<div class="banner__text">
				<font size = "+2">
				<strong>Retro Tech Surplus</strong>
				</font>
			</div>
		</div>
	</div>
<h1 align="center">Welcome to Retro Tech Surplus!</h1>

<h2 align="center"><a href="login.jsp">Login</a></h2>

<h2 align="center"><a href="listprod.jsp">Begin Shopping</a></h2>

<h2 align="center"><a href="listorder.jsp">List All Orders</a></h2>

<h2 align="center"><a href="customer.jsp">Customer Info</a></h2>

<h2 align="center"><a href="admin.jsp">Administrators</a></h2>

<h2 align="center"><a href="logout.jsp">Log out</a></h2>

<%
	String userName = (String) session.getAttribute("authenticatedUser");
	if (userName != null)
		out.println("<h3 align=\"center\">Signed in as: "+userName+"</h3>");
%>
</body>
</head>


