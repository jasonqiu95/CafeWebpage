<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Our Products</title>
<script src="js/vendor/jquery-2.1.4.js"></script>
<script src="js/vendor/jquery.gmap3.min.js"></script>
<script src="js/sessionHandling.js"></script>
<script src="js/plugins.js"></script>
<script src="js/main.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/templatemo_style.css">
<link rel="stylesheet" href="css/templatemo_misc.css">
<link rel="stylesheet" href="css/flexslider.css">
<link rel="stylesheet" href="css/testimonails-slider.css">
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">登 陆</h4>
				</div>
				<form class="login" action="login.jsp" method="post">
					<div class="modal-body">
						<div>
							<div class="input-group">
								<div class="input-group-addon">User Name</div>
								<input type="text" class="form-control" placeholder="name"
									name="name">
							</div>

							<div class="input-group" style="margin-top: 20px;">
								<div class="input-group-addon">Password</div>
								<input type="password" class="form-control"
									placeholder="password" name="pwd">
							</div>
							<div class="radio-inline">
								<input type="radio" name="user_type" value="Users" />User
							</div>
							<div class="radio-inline">
								<input type="radio" name="user_type" value="Admins" />Admin
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-success" value="Login">
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<div class="modal fade" id="RegisterModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">新用户注册</h4>
				</div>
				<form class="login" action="register.jsp" method="post">
					<div class="modal-body">
						<div>
							<div class="input-group" style="margin-top: 20px;">
								<div class="input-group-addon">Email</div>
								<input type="text" class="form-control" placeholder="Email"
									name="email">
							</div>
							<div class="input-group" style="margin-top: 20px;">
								<div class="input-group-addon">Password</div>
								<input type="password" class="form-control"
									placeholder="password" name="pwd">
							</div>
							<div class="radio-inline">
								<input type="radio" name="sex" value="f" />Female
							</div>
							<div class="radio-inline">
								<input type="radio" name="sex" value="m" />Male
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-success" value="Register">
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<header>
	<div id="top-header">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="home-account">
						<a href="#">Home</a>
					</div>
				</div>
				<div class="cart-info">
					<%
						if (session.getAttribute("Users") == null && session.getAttribute("Admins") == null) {
					%>
					<button class="btn btn-warning btn-xs" id="login"
						data-toggle="modal" data-target="#myModal">Log In</button>
					<button class="btn btn-warning btn-xs" id="login"
						data-toggle="modal" data-target="#RegisterModal">
						Register</button>
					<%
						} else {
							String type = "";
							if (session.getAttribute("Users") != null) {
								type = "Users";
							} else {
								type = "Admins";
							}
					%>
					<div class="cart-info" id="user" style="display: inline-block">
						<i class="fa fa-users"></i>
						<%=type + " " + session.getAttribute(type)%>
					</div>
					<button class="btn btn-warning btn-xs" id="logout">Log Out</button>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
	<div id="main-header">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="logo">
						<a href="#templatemo_417_grill"><img src="images/logo.png"
							title="Grill Template by sc.chinaz.com"
							alt="Grill Website Template by sc.chinaz.com"></a>
					</div>
				</div>
				<div class="col-md-6">
					<div class="main-menu">
						<ul>
							<li><a href="index.jsp">Home</a></li>
							<li><a href="about-us.jsp">About</a></li>
							<li><a href="products.jsp">Products</a></li>
							<li><a href="contact-us.jsp">Contact</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3">
					<div class="search-box">
						<form name="search_form" method="get" class="search_form">
							<input id="search" type="text" /> <input type="submit"
								id="search-button" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</header>
	<div id="heading">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="heading-content">
						<h2>Our Products</h2>
						<span>Home / <a href="products.jsp">Products</a></span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%@ page import="com.example.cafes.ShowMeal"%>
	<%@ page import="java.util.*"%>
	<%
		List<String> mts = ShowMeal.getMT();
		ResultSet rs = ShowMeal.getMeals();
	%>


	<div id="products-post">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div id="product-heading">
						<h2>Hungry ?</h2>
						<img src="images/under-heading.png" alt="">
					</div>
				</div>
			</div>

			<div class="row">
				<div class="filters col-md-12 col-xs-12">
					<ul id="filters" class="clearfix">
						<li><span class="filter" data-filter="all">All</span></li>
						<%
							for (int i = 0; i < mts.size(); i++) {
						%>
						<li><span class="filter"
							data-filter=".<%=mts.get(i).toLowerCase()%>"><%=mts.get(i)%></span></li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
			<div class="row" id="Container">
				<%
					while (rs.next()) {
						if (rs.getBoolean(6)) {
							String mtName = rs.getString(8);
							String mtID = rs.getString(7);
							String name = rs.getString(2);
							String mID = rs.getString(1);
							String SPrice = rs.getString(5);
				%>
				<div
					class="col-md-3 col-sm-6 mix portfolio-item <%=mtName.toLowerCase()%>">
					<div class="portfolio-wrapper">
						<div class="portfolio-thumb">
							<img src="images/product<%=mtID%>.jpg" alt="" />
							<div class="hover">
								<div class="hover-iner">
									<a class="fancybox" href="images/product<%=mtID%>_big.jpg"><img
										src="images/open-icon.png" alt="" /></a> <span><%=mtName%></span>
								</div>
							</div>
						</div>
						<div class="label-text">
							<h3>
								<a href="single-post.jsp?mid=<%=mID%>"><%=name%></a>
							</h3>
							<span class="text-category"><%=SPrice%></span>
						</div>
					</div>
				</div>
				<%
					}
					}
				%>
			</div>

			<div class="pagination">
				<div class="row">
					<div class="col-md-12">
						<ul>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">>></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer>
	<div class="container">
		<div class="top-footer">
			<div class="row">
				<div class="col-md-9">
					<div class="subscribe-form">
						<span>Get in touch with us</span>
						<form method="get" class="subscribeForm">
							<input id="subscribe" type="text" /> <input type="submit"
								id="submitButton" />
						</form>
					</div>
				</div>
				<div class="col-md-3">
					<div class="social-bottom">
						<span>Follow us:</span>
						<ul>
							<li><a href="#" class="fa fa-facebook"></a></li>
							<li><a href="#" class="fa fa-twitter"></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="main-footer">
			<div class="row">
				<div class="more-info">
					<i class="fa fa-phone" style="margin-left: 20px;"></i>010-4242342342342
					<i class="fa fa-globe" style="margin-left: 50px;"></i>BUAA <i
						class="fa fa-envelope" style="margin-left: 50px;"></i><a href="#">info@company.com</a>
				</div>
			</div>
		</div>
		<div class="bottom-footer">
			<p>Copyright &copy; 2014.Company name All rights reserved.</p>
		</div>

	</div>
	</footer>


	<script src="js/vendor/jquery-1.11.0.min.js"></script>
	<script src="js/vendor/jquery.gmap3.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/main.js"></script>

	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>