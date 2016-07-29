<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<title>Contact Us</title>
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
						<h2>Contact Us</h2>
						<span>Home / <a href="contact-us.jsp">Contact Us</a></span>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div id="product-post">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="heading-section">
						<h2>Feel free to send a message</h2>
						<img src="images/under-heading.png" alt="">
					</div>
				</div>
			</div>
			<div id="contact-us">
				<div class="container">
					<div class="row">
						<div class="product-item col-md-12">
							<div class="row">
								<div class="col-md-8">
									<div class="message-form">
										<form action="#" method="post" class="send-message">
											<div class="row">
												<div class="name col-md-4">
													<input type="text" name="name" id="name" placeholder="Name" />
												</div>
												<div class="email col-md-4">
													<input type="text" name="email" id="email"
														placeholder="Email" />
												</div>
												<div class="subject col-md-4">
													<input type="text" name="subject" id="subject"
														placeholder="Subject" />
												</div>
											</div>
											<div class="row">
												<div class="text col-md-12">
													<textarea name="text" placeholder="Message"></textarea>
												</div>
											</div>
											<div class="send">
												<button type="submit">Send</button>
											</div>
										</form>
									</div>
								</div>
								<div class="col-md-4">
									<div class="info">
										<p>Sed dignissim, diam id molestie faucibus, purus nisl
											pretium quam, in pulvinar velit massa id elit.</p>
										<ul>
											<li><i class="fa fa-phone"></i>010-020-0340</li>
											<li><i class="fa fa-globe"></i>123 Dagon Studio, Yakin
												Street, Digital Estate</li>
											<li><i class="fa fa-envelope"></i><a href="#">info@company.com</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="heading-section">
						<h2>Find Us On Map</h2>
						<img src="images/under-heading.png" alt="">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div id="googleMap" style="height: 420px;"></div>
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

	<script
		src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDY0kkJiTPVd2U7aTOAwhc9ySH6oHxOIYM&amp;sensor=false">
		
	</script>

	<script>
		var map;

		function initialize() {
			var map_options = {
				center : new google.maps.LatLng(16.8496189, 96.1288854),
				zoom : 15,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(document.getElementById("googleMap"),
					map_options);
		}

		google.maps.event.addDomListener(window, 'load', initialize);
		google.maps.event.addDomListener(window, "resize", function() {
			var center = map.getCenter();
			google.maps.event.trigger(map, "resize");
			map.setCenter(center);
		});
	</script>

	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>