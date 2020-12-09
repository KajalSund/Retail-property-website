<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.Dao.CustomerHelperClass" %>

<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
 
</head>

<% 
  CustomerHelperClass customer=new CustomerHelperClass();
  List<String> list=customer.CategoryPrint();
  pageContext.setAttribute("catogry", list, PageContext.PAGE_SCOPE);
 %>

<body>
<div class="container">
 <div class="row">
 <div class="col-sm-12 col-md-6 ">
 <div class="card">
 <div class="card-header">
 <div class="card-title">Registartion form</div>
 </div>
 <div class="card-body" >
 <form method="post" action="CustomerServlet">
 
 <input type="hidden" value="RegisterUser" name="command"/>
 
     <div class="form-group ">
      <label class="control-label " for="name">
       Name
      </label>
      <input class="form-control" id="name" name="name" type="text"/>
     </div>
     <div class="form-group ">
      <label class="control-label requiredField" for="email">
       Email
       <span class="asteriskField">
        *
       </span>
      </label>
      <input class="form-control" id="email" name="email" type="email"/>
     </div>
     
     <div class="form-group ">
      <label class="control-label " for="Profession">
       Profession
      </label>
      <input class="form-control"  name="prof" type="text"/>
     </div>
     <div class="form-group ">
      <label class="control-label " for="textarea">
       Address
      </label>
      <textarea class="form-control" cols="40" id="textarea" name="adress" rows="8"></textarea>
     </div>
     <div class="form-group ">
      <label class="control-label " for="tel">
       Telephone 
      </label>
      <input class="form-control" id="tel" name="tel" type="text"/>
     </div>
     <div class="form-group ">
      <label class="control-label ">
       Gender
      </label>
      <div class="">
       <div class="radio">
        <label class="radio">
         <input name="radio" type="radio" value="male"/>
         Male
        </label>
       </div>
       <div class="radio">
        <label class="radio">
         <input name="radio" type="radio" value="female"/>
         Female
        </label>
       </div>
      </div>
     </div>
     <div class="form-group ">
      <label class="control-label " for="date">
       Date Of Birth
      </label>
      <div class="input-group">
       <div class="input-group-addon">
        <i class="fa fa-calendar">
        </i>
       </div>
       <input class="form-control" id="date" name="date" placeholder="MM/DD/YYYY" type="text"/>
      </div>
     </div>
	  <div class="form-group ">
      <label class="control-label " for="Select Space">
       Select Space
         </label>
       <Select class="form-control" name="space" >
       <option>Select Space</option>
       <c:forEach var="temp" items="${catogry}">
       <option value="${temp }">${temp}</option>
       </c:forEach>
       </Select>
    </div>
    
     
     <div class="form-group">
      <div>
       <button class="btn btn-primary " name="submit" type="submit">
        Submit
       </button>
      </div>
     </div>
    </form>
 </div>
 </div>
</div>



<div class="col-sm-12 col-md-6 col-xs-6">
 <div class="card">
 <div class="card-header">
 <div class="card-title">Already a Registered User</div>
 </div>
 <div class="card-body" >
 <form method="post" action="CustomerServlet">
 
 <input type="hidden" value="CheckRegisterUser" name="command"/>
 
 <div class="form-group ">
      <label class="control-label " for="Select Space">
       Select Space
         </label>
       <Select class="form-control" name="space" >
       <option>Select Space</option>
       <c:forEach var="temp" items="${catogry}">
       <option value="${temp }">${temp}</option>
       </c:forEach>
       </Select>
    </div>
    <div class="form-group">
      <div>
       <button class="btn btn-primary " name="submit" type="submit">
        Submit
       </button>
      </div>
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