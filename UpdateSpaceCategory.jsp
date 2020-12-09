<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Book.Spaces,com.Book.ManagmentServlet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
    
</head>
<body>

<div class="container">
 <div class="row justify-content-center align-items-center">
 <div class="col-sm-12 col-md-6 col-xs-6">
 <div class="card">
 <div class="card-header bg-info" style="color:#00ff00">
 <div class="card-title"><h3>Update Space</h3></div>
 </div>
 <div class="card-body" >
 <form method="post" action="ManagmentServlet">
 
 <input type="hidden" value="Update" name="command"/>
 
     <div class="form-group ">
      <label class="control-label " for="name">
       Space Name
      </label>
      <input class="form-control" id="name" name="category" type="text" value="${category.space }" readonly/>
     </div>
     
      <div class="form-group ">
      <label class="control-label " for="Area">
       Area
      </label>
      <input class="form-control" name="area" type="text" value="${category.area}" />
     </div>
     
     
      <div class="form-group ">
      <label class="control-label " for="Area">
       Duration
      </label>
      <br>
      <Select style="width:300px;" name="duration">
      <option value="${category.duration }">${category.duration }</option>
      <option value="Hourly Basis">Hourly Basis</option>
      </Select>
     </div>
     
     
     <div class="form-group ">
      <label class="control-label " for="Rent Type">
       Rent Type
      </label>
      <br>
      <Select style="width:300px;" name="rent_type" >
      <option value="${category.rent_type }">${category.rent_type}</option>
      <option value="Day Wise">Day Wise</option>
      <option value="Weekly Wise">Weekly</option>
      <option value="Monthly Wise">Monthly</option>
      </Select>
     </div>
     
      <div class="form-group ">
      <label class="control-label " for="Cost">
       Cost
      </label>
      <input class="form-control" name="cost" type="text" value="${category.cost}" />
     </div>
     
    <div class="text-center">
            <input class="btn btn-lg btn-success" type="submit" value="UPDATE">
                  </div>
    </form>
 </div>
 </div>
</div>
</div>
</div>


<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
</body>
</html>