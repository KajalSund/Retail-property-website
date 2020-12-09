<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.Dao.ManagmentHelperClass,java.util.*,com.Book.Spaces" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
<title>Insert title here</title>
 <style>
 table thead th{
 height:70px;
 font-size:25px;
 color:white;
   
 }
 
 </style>
</head>
<body>
<%
ManagmentHelperClass manag=new ManagmentHelperClass();
List<Spaces> list=manag.PrintCategory();
pageContext.setAttribute("printCat", list, PageContext.PAGE_SCOPE);
%>

<div class="container">
<div class="row justify-content-center align-items-center">
<div class="col-lg-10 col-sm-12">
<table class="table table-striped table-hover mt-5">

<thead style="background:#0066ff" >
<tr>

<th> Space Type </th>
<th> Area</th>
<th> Duration</th>
<th> Rent Type </th>
<th>Cost</th>
<th>Action</th>
</tr>

</thead>

<tbody>
<c:forEach var="temp" items="${printCat}">

<c:url var="tempLink" value="ManagmentServlet">
<c:param name="command" value="Load"></c:param>
<c:param name="spaceCat" value="${temp.space }"></c:param>
</c:url>
<tr>
<td>${temp.space}</td>
<td>${temp.area}</td>
<td>${temp.duration}</td>
<td>${temp.rent_type}</td>
<td>${temp.cost}</td>
<td > <a style="color:#00cc00;" href="${tempLink }">Update</a></td>
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