<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admin Providers</title>
<script src="js/vendor/jquery-2.1.4.js"></script>
<script src="js/reviseModal_p.js"></script>
<script src="js/vendor/jquery.gmap3.min.js"></script>
<script src="js/sessionAdmin.js"></script>
<script src="js/plugins.js"></script>
<script src="js/main.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/templatemo_style.css">
<link rel="stylesheet" href="css/templatemo_misc.css">
<link rel="stylesheet" href="css/flexslider.css">
<link rel="stylesheet" href="css/testimonails-slider.css">
<link rel="stylesheet" href="css/index.css"> 
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="com.example.cafes.Provider" %>
<%
		if (session.getAttribute("Admins") == null) {
			throw new javax.xml.ws.http.HTTPException(403);
		}

		//first check whether to add
		String name = request.getParameter("insert_name");
		String intro = request.getParameter("insert_intro");
		String addr = request.getParameter("insert_addr");
		String contact = request.getParameter("insert_contact");
		if (name != null && intro != null && addr != null && contact != null)  {
			Provider.addProvider(name, addr, intro, contact);
		}
		
		//Next check whether to revise.
		String revise_name = request.getParameter("revise_name");
		String revise_intro = request.getParameter("revise_intro");
		String revise_addr = request.getParameter("revise_addr");
		String P_ID = request.getParameter("p_id");
		String revise_contact = request.getParameter("revise_contact");
		if (revise_name != null && revise_intro != null && revise_addr != null && P_ID != null
				&& revise_contact != null) {
			Provider.updateProvider(P_ID, revise_name, revise_intro, revise_contact, revise_addr);
		}
		
		//then check whether to delete
		String[] deleteItems = request.getParameterValues("deleteItem");
		if (deleteItems != null) {
			for (int i = 0; i < deleteItems.length; i++) {
				Provider.deleteProvider(deleteItems[i]);
			}
		}

	ResultSet rs = Provider.fetchProviders();
%>
	
	<div class="modal fade" id="AddProviderModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="AdminProvider.jsp" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">新增供应商</h4>
					</div>
					<div class="modal-body">
						<div>
							<div class="input-group">
								<div class="input-group-addon">名称</div>
								<input type="text" class="form-control" placeholder="New Name"
									name="insert_name">
							</div>
							<div class="input-group" style="margin-top: 25px;">
								<div class="input-group-addon">简介</div>
								<input type="text" class="form-control"
									placeholder="New Introduction" name="insert_intro">
							</div>
							<div class="input-group" style="margin-top: 25px;">
								<div class="input-group-addon">地址</div>
								<input type="text" class="form-control" placeholder="New Address"
									name="insert_addr">
							</div>
							<div class="input-group" style="margin-top: 25px;">
								<div class="input-group-addon">联系方式</div>
								<input type="text" class="form-control" placeholder="New Contact"
									name="insert_contact">
							</div>
							
						</div>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-success" value="Add">
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<div class="modal fade" id="ReviseProviderModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="AdminProvider.jsp" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">修改供应商</h4>
					</div>
					<div class="modal-body">
						<div>
							<div class="input-group">
								<div class="input-group-addon">名称</div>
								<input type="text" class="form-control" placeholder="Name"
									name="revise_name" id="revise_name">
							</div>
							<div class="input-group" style="margin-top: 25px;">
								<div class="input-group-addon">简介</div>
								<input type="text" class="form-control"
									placeholder="Introduction" name="revise_intro"
									id="revise_intro">
							</div>
							<div class="input-group" style="margin-top: 25px;">
								<div class="input-group-addon">地址</div>
								<input type="text" class="form-control" placeholder="Address"
									name="revise_addr" id="revise_addr">
							</div>
							<div class="input-group" style="margin-top: 25px;">
								<div class="input-group-addon">联系方式</div>
								<input type="text" class="form-control" placeholder="Contact"
									name="revise_contact" id="revise_contact">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="hidden" id="p_id" name="p_id" value="">
						<input type="submit" class="btn btn-success" value="Update">
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
				<div class="col-md-6">
					<div class="cart-info">
						<i class="fa fa-users"></i> Admin <%= session.getAttribute("Admins")%>
						<button class="btn btn-warning btn-xs" id="logout">Log Out</button>
					</div>
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
						<h2>Products</h2>
						<span>Home / <a href="AdminPurchaseRecord.html">Products</a></span>
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
						<h2>Products</h2>
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
									<button type="button" class="btn btn-default btn-sm"
										data-toggle="modal" data-target="#AddProviderModal">
										<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
									</button>
									<button type="button" id="reviseBtn"
										class="btn btn-default btn-sm" data-toggle="modal"
										data-target="#ReviseProviderModal">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
									</button>
									<form action="AdminProvider.jsp" method="post">

										<table class="table table-striped" style="margin-top: 25px;">
											<thead>
												<tr>
													<th><input type="checkbox" /></th>
													<th>编号</th>
													<th>名称</th>
													<th>联系方式</th>
													<!--这里的食品类型，用食品食品类型名表示-->
													<th>地址</th>
													<th>简介</th>
												</tr>
											</thead>
											<tbody>
												<%
													while (rs.next()) {
														if (rs.getBoolean(6)) {
															String p_id = rs.getString(1);
															String p_name = rs.getString(2);
															String p_intro = rs.getString(3);
															String p_addr = rs.getString(4);
															String p_contact = rs.getString(5);
												%>
												<tr>
													<th><input type="checkbox" class="<%=p_id%>"
														value="<%=p_id%>" name="deleteItem" /></th>
													<td class="<%=p_id%>"><%=p_id%></td>
													<td class="<%=p_id%>"><%=p_name%></td>
													<td class="<%=p_id%>"><%=p_contact%></td>
													<td class="<%=p_id%>"><%=p_addr%></td>
													<td class="<%=p_id%>" style="width: 350px;"><%=p_intro%></td>
												</tr>
												<%
														}
													}
												%>
											</tbody>
										</table>
										<button type="submit" class="btn btn-default btn-sm">
											<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
										</button>
									</form>
								</div>

								<div class="col-md-3 col-md-offset-1">
									<div class="side-bar">
										<div class="news-letters">
											<h4>you want to go</h4>
											<div class="archives-list">
												<ul>
													<li><a href="AdminBuy.jsp"><i class="fa fa-angle-right"></i>Purchase
															Records</a></li>
													<li><a href="AdminSellRecord.jsp"><i class="fa fa-angle-right"></i>Sold
															Notes</a></li>
													<li><a href="AdminProducts.jsp"><i class="fa fa-angle-right"></i>Products</a></li>
													<li><a href="AdminProvider.jsp"><i class="fa fa-angle-right"></i>Suppliers</a></li>
													<li><a href="AdminOM.jsp"><i class="fa fa-angle-right"></i>Ingredients</a></li>
													<li><a href="AdminTake.jsp"><i class="fa fa-angle-right"></i>Take Records</a></li>
												</ul>
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

	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>