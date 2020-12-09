<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
</HEAD>
<BODY onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">

<%

if (session.getAttribute("username")==null) {
    response.sendRedirect("login.jsp");
}


%>  
<h2>Are u sure to logout...</h2>

<a href="logoutconfirm.jsp">Logout</a>
</BODY>
</html>