<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.Dao.ManagmentHelperClass,java.util.*,com.Book.BookinStatus" %>
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
<body>


<div class="container">
<div class="row justify-content-center align-items-center">
<div class="col-lg-10 col-sm-12">

<table class="table table-striped table-hover mt-5">

<thead style="background:#0066ff" >
<tr>

<th> Space ID </th>
<th> Status</th>
<th> Floor</th>
<th>Action</th>
</tr>

</thead>

<tbody>
<c:forEach var="temp" items="${spaces}">

<c:url var="tempLink" value="ManagmentServlet">
<c:param name="command" value="DeleteSpace"></c:param>
<c:param name="spaceID" value="${temp.num }"></c:param>
<c:param name="spaceStatus" value="${temp.status }"></c:param>
</c:url>
<tr>
<td>${temp.num}</td>
<td>${temp.status}</td>
<td>${temp.floor}</td>
<td > <a style="color:RED;" href="${tempLink }">Remove Space</a></td>
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