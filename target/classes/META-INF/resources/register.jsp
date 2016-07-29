<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String sex = request.getParameter("sex");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafemanagement", "root", "950213rsd");
			PreparedStatement pst = con.prepareStatement("insert into users (U_pwd, U_SEX, U_Email) values (?, ?, ?)");
			pst.setString(1, pwd);
			pst.setString(2, sex);
			pst.setString(3, email);
			pst.executeUpdate();
			pst = con.prepareStatement("Select U_ID from users where U_email=? AND U_pwd=? AND U_Sex=?");
			pst.setString(1, email);
			pst.setString(2, pwd);
			pst.setString(3, sex);
			ResultSet rs = pst.executeQuery();
			rs.next();
			out.println("Your user ID is " + rs.getString(1));
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>