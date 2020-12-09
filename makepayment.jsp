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

<div class="container">
 <div class="row justify-content-center">
 <div class="col-sm-12 col-md-6 ">
 <div class="card">
 <div class="card-header">
 <div style="font-size:35px" class="card-title">CONFIRM BOOKING</div>
 </div>
 <div class="card-body" >
 
<form method="post" action="CustomerServlet">
      
     
      <input type="hidden" value="MakePayment" name="command">
      
      <div class="form-group">
      <label class="control-label " for="Space_ID">
       Space_ID
      </label>
      <div class="input-group">
        <input  class="form-control" name="ID" type="text" value="<%=request.getAttribute("space_id")%>" readonly/>
       </div>
      </div>
   
      <div class="form-row">
    <div class="form-group col-md-6">
      <label >From:</label>
      <input  class="form-control" name="from" type="date" value="<%=request.getAttribute("fromdate")%>" readonly/>
    </div>
    <div class="form-group col-md-6">
      <label >To</label>
      <input  class="form-control" name="to" type="date" value="<%=request.getAttribute("todate")%>" readonly/>
    </div>
  </div>
      
      
      
      <div class="form-group">
      <label class="control-label " for="days">
       Total Days You are Booking For:
      </label>
      <div class="input-group">
        <input  class="form-control" name="days" type="text" value="<%=request.getAttribute("days")%>" readonly/>
       </div>
      </div>
    
      
      <div class="form-group ">
      <label class="control-label " for="days">
       Total Cost:
      </label>
      <div class="input-group">
        <input  class="form-control" name="cost" type="text" value="<%= request.getAttribute("cost")%> Rs" readonly/>
       </div>
      </div>
         
         <div class="text-center"> 
          <input style="background:#66ffff" class="btn btn-large" type="submit" value="PAY">
         </div> 
         
          <small class="form-text text-muted">Note: Booking will be active from Todays 12.00 AM IST </small>
    </form> 
    
    </div>
    </div>
    </div>
    </div>
    </div>
   
     
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>


<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
      
</body>
</html>