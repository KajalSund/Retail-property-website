<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.Dao.ManagmentHelperClass,java.util.*,com.Book.BookinStatus" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<%
ManagmentHelperClass manag=new ManagmentHelperClass();
List<String> list2=manag.getCategory();
pageContext.setAttribute("CatList", list2, PageContext.PAGE_SCOPE);
%>

<div class="row justify-content-center align-items-center">
<div class="col-sm-12 col-md-6 col-xs-6">
<div class="card  border-primary">	
<div class="card-header bg-info text-center"><h3>Filter By</h3></div>

<form method="post" action="ManagmentServlet" class="md-form m-2">

<input type="hidden" name="command" value="filter"/>

<label class="control-label " for="Select Space">
       Select Category
         </label>
       <Select style="width: 200px" class="form-control" name="cat" >
       <option value="none">Select Space</option>
       <c:forEach var="temp" items="${CatList}">
       <option value="${temp }">${temp}</option>
       </c:forEach>
       </Select>
       <hr>
       
       <div class="form-group ">
      <label class="control-label " for="date">
       FROM
      </label>
      <div class="input-group">
       <input class="form-control"  name="date" placeholder="MM/DD/YYYY" type="text" value="${from}"/>
      </div>
     </div>
     
      <div class="form-group ">
      <label class="control-label " for="date">
       TO
      </label>
      <div class="input-group">
       <input class="form-control"  name="date2" placeholder="MM/DD/YYYY" type="text" value="${to}"/>
      </div>
     </div>
     
     <div style="text-align:center;">
    <input class="btn-lg btn-secondry" type="submit" value="Go"/>  
         </div>
</form>
</div>
</div>
</div>

<br><br><br>
<table id="first" class="table table-striped table-hover">

<thead style="background:green;">
<tr>

<th> Space Category </th>
<th> User Name</th>
<th> Space_ID</th>
<th> Floor</th>
<th>From</th>
<th>To</th>
<th>Payment</th>
<th>Action</th>
</tr>

</thead>

<tbody>
<c:forEach var="temp" items="${Result}">
<c:url var="tempLink" value="ManagmentServlet">
<c:param name="command" value="Cancel"></c:param>
<c:param name="spaceID" value="${temp.num}"></c:param>
</c:url>
<tr>
<td>${temp.cat}</td>
<td>${temp.uname}</td>
<td>${temp.num}</td>
<td>${temp.floor}</td>
<td>${temp.from}</td>
<td>${temp.to}</td>
<td>${temp.payment}</td>
<td ><a style="color:red" href="${tempLink }">Cancel Booking</a></td>
</tr>
</c:forEach>
</tbody>

</table>


<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>


<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

<script>
    $(document).ready(function(){
        var date_input=$('input[name="date"]'); //our date input has the name "date"
        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
        date_input.datepicker({
            format: 'mm/dd/yyyy',
            container: container,
            todayHighlight: true,
            autoclose: true,
        })
    })
</script>

<script>
    $(document).ready(function(){
        var date_input=$('input[name="date2"]'); //our date input has the name "date"
        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
        date_input.datepicker({
            format: 'mm/dd/yyyy',
            container: container,
            todayHighlight: true,
            autoclose: true,
        })
    })
</script>
</body>
</html>