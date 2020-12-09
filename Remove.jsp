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

<%
ManagmentHelperClass manag=new ManagmentHelperClass();

List<String> list2=manag.getCategory();
pageContext.setAttribute("CatList", list2, PageContext.PAGE_SCOPE);
%>
<body>


<div class="row justify-content-center align-items-center">
<div class="col-sm-12 col-md-6 col-xs-6">
<div class="card  border-primary">	
<div class="card-header bg-info text-center"><h3>Filter By</h3></div>

<form method="post" action="ManagmentServlet" class="md-form m-2">

<input type="hidden" name="command" value="RemoveSpace"/>

<label class="control-label " for="Select Space">
       Select Category
         </label>
       <Select style="width: 200px" class="form-control" name="cat" >
       <option value="none">Select Space</option>
       <c:forEach var="temp" items="${CatList}">
       <option value="${temp }">${temp}</option>
       </c:forEach>
       </Select>
       <br>
       <div style="text-align:center;">
    <input class="btn-md btn-primary" type="submit" value="Continue"/>  
         </div>
       </form>
       
       </div>
       </div>
       </div>
       


<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>


</body>
</html>