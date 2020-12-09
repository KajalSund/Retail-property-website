<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.Book.*,com.Dao.CustomerHelperClass" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
    
</head>

<%
String uname=(String)request.getSession(false).getAttribute("username");
CustomerHelperClass customer=new CustomerHelperClass();
List<BookinStatus> book=customer.MyBookings(uname);
UserType user=customer.UserInfo(uname);
pageContext.setAttribute("mybooking", book, PageContext.PAGE_SCOPE);
%>

<body>

<div class="container">
<div class="row justify-content-center align-items-center">
<div class="col-lg-10 col-sm-12">
<table class="table table-striped table-hover mt-5">

<thead style="background:#0066ff" >
<tr>

<th> User Name</th>
<th> Space Category</th>
<th> Space Id</th>
<th> From</th>
<th>To</th>
<th>Action</th>
</tr>

</thead>

<tbody>
<c:forEach var="temp" items="${mybooking}">
<tr>
<td>${temp.uname}</td>
<td>${temp.cat}</td>
<td>${temp.num}</td>
<td>${temp.from}</td>
<td>${temp.to}</td>
<td > <a style="color:#00cc00;" href="">Update</a></td>
</tr>
</c:forEach>
</tbody>

</table>
	</div>
	</div>
</div>




<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
</body>
</html>