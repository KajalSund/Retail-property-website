<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.Dao.CustomerHelperClass" %>

<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
 
</head>


<body>




<div class="row justify-content-center align-items-center">
<div class="col-lg-12 ">
<table class="table table-striped table-hover mt-5 mx-4">

<thead style="background:#0000ff">
<tr>

<th> Space Type </th>
<th> Space_ID</th>
<th> Status</th>
<th> Floor</th>
<th>Next Available</th>

</tr>

</thead>

<tbody>

<c:forEach var="temp" items="${book}">
<tr>
<td>${temp.cat }</td>
<td>${temp.num }</td>
<td>${temp.status }</td>
<td>${temp.floor }</td>
<c:set var = "date" scope = "session" value = "${temp.to}"/>
      <c:if test = "${date == null}">
        <td>Currently Available</td>
      </c:if>
      <c:if test = "${date != null}">
        <td>${temp.to}</td>
      </c:if>
</tr>
</c:forEach>
</tbody>

</table>
</div>
</div>


<div class="container">
 <div class="row justify-content-center align-items-center">
 <div class="col-sm-12 col-md-6 ">
 <div class="card">
 <div class="card-header">
 <div class="card-title"><strong>Select Space For Booking</strong></div>
 </div>
 <div class="card-body" >
 <form method="post" action="CustomerServlet">
 
 <input type="hidden" value="CheckBooking" name="command"/>
    
     <div class="form-group ">
      <label class="control-label " for="select">
       Select Space_No
      </label>
      <select name="space_id" class="form-control">
      <c:forEach var="id" items="${book }">
       <option value="${id.num }">${id.num }</option>
      
      </c:forEach>
      </select>
      <small class="form-text text-muted">Please Select Available Spaces</small>
      </div>
     
     
          
<div class="form-group ">
      <label class="control-label " for="date">
       To
      </label>
      <div class="input-group">
       <div class="input-group-addon">
        <i class="fa fa-calendar">
        </i>
       </div>
       <input class="form-control" id="date" name="date" placeholder="MM/DD/YYYY" type="text"/>
      </div>
     </div>
     
     
     <div class="text-center">
     <input style="background:#009900" class="btn btn-lg" type="submit" value="Book"/>
     </div>
    </form>
 </div>
 </div>
</div>
</div>
</div>
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
</body>
</html>