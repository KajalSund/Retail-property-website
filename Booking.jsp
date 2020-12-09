<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.Book.Spaces,com.Dao.CustomerHelperClass" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
  <title>Bootstrap Theme</title>
  <style>
 #first
{
    width:50%;
	margin-left: 25%;
	margin-top:10%;
}	  
  
  </style>
  <% 
  CustomerHelperClass customer=new CustomerHelperClass();
  List list=customer.Booking();
  pageContext.setAttribute("booking", list, PageContext.PAGE_SCOPE);
   %>
</head>


<body>

<table id="first" class="table table-striped table-hover">

<thead style="background:green;">
<tr>

<th> Space Type </th>
<th> Area</th>
<th> Duration</th>
<th> Rent Type </th>
<th>Cost</th>
<th>Book</th>
</tr>

</thead>

<tbody>
<c:forEach var="temp" items="${booking}">
<tr>
<td>${temp.space}</td>
<td>${temp.area}</td>
<td>${temp.duration}</td>
<td>${temp.rent_type}</td>
<td>${temp.cost}</td>
<td><form action="Userdetails.jsp" method="post">
<input type="submit" value="Book Now" >
</form></td>
</tr>
</c:forEach>
</tbody>

</table>
	

	 <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  
  </body>