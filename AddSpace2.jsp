<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Dao.ManagmentHelperClass,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
<title>Insert title here</title>
<% 
ManagmentHelperClass manag=new ManagmentHelperClass();
List<String> list=manag.getCategory();
pageContext.setAttribute("CatList", list, PageContext.PAGE_SCOPE);
%>
</head>
<body>


<div class="container">
<div class="row justify-content-center align-items-center">
<div class="col-lg-6 col-sm-12">
<div class="card mt-5">

    <h5 class="card-header info-color white-text text-center py-4">
        <strong style="color:RED">ADD SPACES</strong>                                                                                   
    </h5>

    <div class="card-body px-lg-5 pt-0">

        <form class="md-form" style="color: #757575;" method="post" action="ManagmentServlet">
        
           <input type="hidden" name="command" value="AddSpaceID" />

         
<label class="control-label " for="Select Space">
       Select Space
         </label>
       <Select style="width: 200px" class="form-control input-lg" name="space" >
       <option>Select Space</option>
       <c:forEach var="temp" items="${CatList}">
       <option value="${temp }">${temp}</option>
       </c:forEach>
       </Select>


     <div class="form-group " style="width:200px">
      <label class="control-label " for="space_id">
       Space_Id
      </label>
      <input class="form-control input-lg" id="name" name="space_id" type="text"/>
     </div>
     
     
     <div class="form-group ">
      <label class="control-label " for="floor">
       Floor
      </label>
       <Select style="width: 200px" class="form-control input-lg" name="floor" >
       <option>Select Floor</option>
       <option value="Ground Floor">Ground Floor</option>
        <option value="1st Floor">1st Floor</option>
         <option value="2nd Floor">2nd Floor</option>
         <option value="3rd Floor">3rd Floor</option>
         <option value="4th Floor">4th Floor</option>
         <option value="Parking">Parking</option>
         <option value="Mall Front">Mall Front</option>
        </Select>
     </div>
     
     <hr>
                 <div class="text-center">
            <input class="btn btn-lg btn-primary" type="submit" value="Add">
                  </div>

        </form>
        
    </div>
</div>
</div>
</div>
</div>


</body>
</html>