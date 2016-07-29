<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>An Error Occurred!</title>
</head>
<body>
<% if(response.getStatus() == 500){ %>
<p style="color: red;">Forbidden: You don't have access to the this page.</p><br>
<%} %>
</body>
</html>