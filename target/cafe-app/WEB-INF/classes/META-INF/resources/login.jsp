<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>

	<%
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String type = request.getParameter("user_type");
		String prefix = type.charAt(0) + "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst = con.prepareStatement("select * from " + type + " where " + prefix + "_ID = ?");
			pst.setInt(1, Integer.parseInt(name));
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				if (rs.getString(2).equals(pwd)) {
					out.print("Login success");
					session.setAttribute(type, rs.getString(1));
					if (type.equals("Admins")) {
						response.sendRedirect("/AdminProducts.jsp");
					} else {
						response.sendRedirect("/index.jsp");
					}
				} else {
					out.println("pwd doesn't match!");
				}
			} else {
				out.println("No such user.");
			}
		} catch (Exception e) {
			out.println("Error occured!");
		}
	%>
</body>
</html>