<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admin Sell Record</title>
<script src="js/vendor/jquery-2.1.4.js"></script>
<script src="js/reviseModal_sell.js"></script>
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
	<%@ page import="java.util.*"%>
	<%@ page import="com.example.cafes.SellRecord"%>
	<%
		if (session.getAttribute("Admins") == null) {
			throw new javax.xml.ws.http.HTTPException(403);
		}
			
		//first check whether to add
		String mealID = request.getParameter("insert_meal_ID");
		String price = request.getParameter("insert_price");
		String count = request.getParameter("insert_count");
		String opid = request.getParameter("insert_opid");
		if (mealID != null && price != null && count != null && opid != null) {
			SellRecord.add(mealID, price, count, opid);
		}

		//Next check whether to revise.
		String revise_meal_ID = request.getParameter("revise_meal_ID");
		String revise_price = request.getParameter("revise_price");
		String revise_count = request.getParameter("revise_count");
		String S_ID = request.getParameter("s_id");
		String revise_opid = request.getParameter("revise_opid");
		if (revise_meal_ID != null && revise_price != null && revise_count != null && S_ID != null
				&& revise_opid != null) {
			SellRecord.update(S_ID, revise_meal_ID, revise_price, revise_count, revise_opid);
		}

		//then check whether to delete
		String[] deleteItems = request.getParameterValues("deleteItem");
		if (deleteItems != null) {
			for (int i = 0; i < deleteItems.length; i++) {
				SellRecord.delete(deleteItems[i]);
			}
		}

		ResultSet rs = SellRecord.fetch();
		List<String> meals = SellRecord.getMeal();
	%>

	<div class="modal fade" id="AddSellRecordModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="AdminSellRecord.jsp" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">新增售出记录</h4>
					</div>
					<div class="modal-body">
						<div>
							<div class="input-group" style="margin-top: 25px;">
								<div class="form-group">
									<label for="sel1">选择菜品:</label> <select
										class="form-control" name="insert_meal_ID">
										<%
											for (int i = 0; i < meals.size(); i++) {
										%>
										<option value="<%=meals.get(i)%>"><%=meals.get(i)%></option>
										<%
											}
										%>
									</select>
								</div>
							</div>
							<div class="input-group" style="margin-top: 25px;">
								<div class="input-group-addon">单价</div>
								<input type="text" class="form-control" placeholder="Price"
									name="insert_price">
							</div>
							<div class="input-group" style="margin-top: 25px;">
								<div class="input-group-addon">数量</div>
								<input type="text" class="form-control" placeholder="Count"
									name="insert_count">
							</div>
							<div class="input-group" style="margin-top: 25px;">
								<div class="input-group-addon">售货员ID</div>
								<input type="text" class="form-control"
									placeholder="Operator ID" name="insert_opid">
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

	<div class="modal fade" id="ReviseSellRecordModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="AdminSellRecord.jsp" method="post">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">修改售出记录</h4>
					</div>
					<div class="modal-body">
						<div>
							<div class="input-group" style="margin-top: 25px;">
								<div class="form-group">
									<label for="sel1">选择菜品:</label> <select
										class="form-control" name="revise_meal_ID" id="revise_meal_ID">
										<%
											for (int i = 0; i < meals.size(); i++) {
										%>
										<option value="<%=meals.get(i)%>"><%=meals.get(i)%></option>
										<%
											}
										%>
									</select>
								</div>
							</div>
							<div class="input-group" style="margin-top: 25px;">
								<div class="input-group-addon">单价</div>
								<input type="text" class="form-control"
									placeholder="Introduction" name="revise_price"
									id="revise_price">
							</div>
							<div class="input-group" style="margin-top: 25px;">
								<div class="input-group-addon">数量</div>
								<input type="text" class="form-control" placeholder="Count"
									name="revise_count" id="revise_count">
							</div>
							<div class="input-group" style="margin-top: 25px;">
								<div class="input-group-addon">售货员ID</div>
								<input type="text" class="form-control"
									placeholder="Operator ID" name="revise_opid" id="revise_opid">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="hidden" id="s_id" name="s_id" value=""> 
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
						<h2>Sell Records</h2>
						<span>Home / <a href="AdminPurchaseRecord.html">Sell Records</a></span>
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
						<h2>Sell Records</h2>
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
										data-toggle="modal" data-target="#AddSellRecordModal">
										<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
									</button>
									<button type="button" id="reviseBtn"
										class="btn btn-default btn-sm" data-toggle="modal"
										data-target="#ReviseSellRecordModal">
										<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
									</button>
									<form action="AdminSellRecord.jsp" method="post">

										<table class="table table-striped" style="margin-top: 25px;">
											<thead>
												<tr>
													<th><input type="checkbox" /></th>
													<th>编号</th>
													<th>菜品名称</th>
													<th>日期</th>
													<th>单价</th>
													<th>数量</th>
													<th>售货员ID</th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<%
													while (rs.next()) {
														String s_id = rs.getString(1);
														String m_id = rs.getString(2);
														String s_date = rs.getString(3);
														String s_price = rs.getString(4);
														String s_count = rs.getString(5);
														String s_opid = rs.getString(6);
														String meal_name = rs.getString(8);
												%>
												<tr>
													<th><input type="checkbox" class="<%=s_id%>" id="<%=m_id %>"
														value="<%=s_id%>" name="deleteItem" /></th>
													<td class="<%=s_id%>"><%=s_id%></td>
													<td class="<%=s_id%>"><%=meal_name%></td>
													<td class="<%=s_id%>"><%=s_date%></td>
													<td class="<%=s_id%>"><%=s_price%></td>
													<td class="<%=s_id%>"><%=s_count%></td>
													<td class="<%=s_id%>" style="width: 350px;"><%=s_opid%></td>
												</tr>
												<%
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