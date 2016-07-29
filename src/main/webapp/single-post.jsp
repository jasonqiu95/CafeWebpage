<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Single Post</title>
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

	<%@ page import="com.example.cafes.ShowMeal"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="com.example.cafes.Comment"%>
	<%
		//check whether to update comment
		String com_score = request.getParameter("com_score");
		String comment = request.getParameter("comment");
		String com_mid = request.getParameter("com_mid");
		String com_userID = (String) session.getAttribute("Users");
		if (com_score != null && comment != null && com_mid != null && com_userID != null) {
			Comment.placeComment(com_userID, comment, com_mid, com_score);
		}

		String mID = request.getParameter("mid");
		String[] introName = ShowMeal.fetchIntroAndName(mID);
		String intro = introName[0];
		String name = introName[1];
		ResultSet comments = ShowMeal.fetchComment(mID);
		comments.last();
		int count = comments.getRow();
		comments.beforeFirst();
	%>

	<div id="heading">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="heading-content">
						<h2>Single Product</h2>
						<span>Home / <a href="single-post.jsp?mid=<%=mID%>">Single Post</a></span>
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
						<h2>Single Blog Post</h2>
						<img src="images/under-heading.png" alt="" />
					</div>
				</div>
			</div>
			<div id="single-blog" class="page-section first-section">
				<div class="container">
					<div class="row">
						<div class="product-item col-md-12">
							<div class="row">
								<div class="col-md-8">
									<div class="image">
										<div class="image-post">
											<img src="images/single-post.jpg" alt="">
										</div>
									</div>

									<div class="product-content">
										<div class="product-title">
											<h3><%=name.toUpperCase()%></h3>
											<span class="subtitle"><%=count%> comments</span>
										</div>
										<p>
											<%=intro%>
										</p>
									</div>

									<div class="divide-line">
										<img src="images/div-line.png" alt="" />
									</div>

									<div class="comments-title">
										<div class="comment-section">
											<h4><%=count%>
												comments
											</h4>
										</div>
									</div>
									<div class="all-comments">
										<%
											while (comments.next()) {
												String author = (Integer.parseInt(comments.getString(2)) % 4) + "";
										%>
										<div class="view-comments">
											<div class="comments">
												<div class="author-thumb">
													<img src="images/author-comment<%=author%>.jpg" alt="">
												</div>
												<div class="comment-body">
													<h6>
														User ID
														<%=comments.getString(2)%></h6>
													<span class="date"><%=comments.getString(3) + " / 5"%></span>

													<p><%=comments.getString(1)%></p>
												</div>
											</div>
										</div>
										<%
											}
										%>

									</div>
									<div class="divide-line">
										<img src="images/div-line.png" alt="" />
									</div>
									<div class="leave-comment">
										<div class="leave-one">
											<h4>Leave a comment</h4>
										</div>
									</div>
									<div class="leave-form">
										<form action="single-post.jsp?mid=<%=mID%>" method="post"
											class="leave-comment">
											<div class="row">
												<div class="name col-md-4">
													<input type="text" name="com_score" id="score"
														placeholder="Score out of 5" />
												</div>
											</div>
											<div class="row">
												<div class="text col-md-12">
													<textarea name="comment" placeholder="Comment"></textarea>
												</div>
											</div>
											<input type="hidden" value="<%=mID%>" name="com_mid" />
											<div class="send">
												<button type="submit">Send</button>
											</div>
										</form>
									</div>
								</div>
								<div class="col-md-3 col-md-offset-1">
									<div class="advertisement">
										<h4>Flickr news</h4>
										<div class="flickr-images">
											<div class="row">
												<div class="col-md-4 col-sm-2 col-xs-3">
													<img src="images/flickr-image1.jpg" alt="">
												</div>
												<div class="col-md-4 col-sm-2 col-xs-3">
													<img src="images/flickr-image2.jpg" alt="">
												</div>
												<div class="col-md-4 col-sm-2 col-xs-3">
													<img src="images/flickr-image3.jpg" alt="">
												</div>
												<div class="col-md-4 col-sm-2 col-xs-3">
													<img src="images/flickr-image4.jpg" alt="">
												</div>
												<div class="col-md-4 col-sm-2 col-xs-3">
													<img src="images/flickr-image1.jpg" alt="">
												</div>
												<div class="col-md-4 col-sm-2 col-xs-3">
													<img src="images/flickr-image2.jpg" alt="">
												</div>
												<div class="col-md-4 col-sm-2 col-xs-3">
													<img src="images/flickr-image3.jpg" alt="">
												</div>
												<div class="col-md-4 col-sm-2 col-xs-3">
													<img src="images/flickr-image4.jpg" alt="">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
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