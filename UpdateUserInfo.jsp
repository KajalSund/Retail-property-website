<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,com.Book.*,com.Dao.CustomerHelperClass" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
</head>
<%
String uname=(String)request.getSession(false).getAttribute("username");
CustomerHelperClass customer=new CustomerHelperClass();
UserType user=customer.UserInfo(uname);
pageContext.setAttribute("Info", user, PageContext.PAGE_SCOPE);
%>

<body>


<div class="container">
<div class="row justify-content-center align-items-center">
<div class="col-lg-6 col-sm-12">
<div class="card mt-5">

    <h5 class="card-header info-color white-text text-center py-4">
        <strong>User Details</strong>                                                                                   
    </h5>

    <div class="card-body px-lg-5 pt-0">


<form method="post" action="CustomerServlet">

<input type="hidden" name="command" value="EditUser">

<div class="form-group">
    <label>User Name</label>
    <input type="text" class="form-control" value="${Info.getUname()}" name="uname " readonly>
  </div>
  
  <div class="form-group">
    <label>Name</label>
    <input type="text" class="form-control" value="${Info.getName()}" name="name">
  </div>

<div class="form-group">
    <label>Email</label>
    <input type="email" class="form-control" value="${Info.getEmail()}" name="email">
  </div>
  
   <div class="form-group">
    <label>D.O.B</label>
    <input type="text" class="form-control" value="${Info.getDob()}" name="dob">
  </div>
  
  <div class="form-group">
    <label>Address</label>
    <input type="text" class="form-control" value="${Info.getAdress()}" name="adress">
  </div>
  
  <div class="form-group">
    <label>Contact Number</label>
    <input type="text" class="form-control" value="${Info.getTel()}" name="tel">
  </div>
  
  <div class="form-group">
    <label>Profession</label>
    <input type="text" class="form-control" value="${Info.getProf()}" name="prof">
  </div>
  
  <input type="submit" value="Edit" class="btn btn-lg btn-success" >
</form>

</div>
</div>
</div>
</div>
</div>

<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  
</body>