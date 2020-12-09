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
<div class="row justify-content-center align-items-center">
<div class="col-lg-6 col-sm-12">
<div class="card mt-5">

    <h5 class="card-header info-color white-text text-center py-4">
        <strong>ADD SPACE CATEGORY</strong>                                                                                   
    </h5>

    <div class="card-body px-lg-5 pt-0">

        <form class="md-form" style="color: #757575;" method="post" action="ManagmentServlet">
        <input type="hidden" name="command" value="AddSpaceCat"/>



            <label for="input">Add Space Category</label>
            <input type="text" name="space_id" class="form-control" placeholder="">

            <label for="input">Area</label>
            <input type="text" name="area" class="form-control" placeholder="In sqft">

            <label for="input">Rent</label>
            <input type="text" name="cost" class="form-control" placeholder="In Rs">
            <br>

            
             <label for="input">Choose Duration Type</label>
                <select class="mdb-select md-form mb-4 initialized" name="duration" required>
                    <option value="" disabled selected>Choose your option</option>
                    <option value="All Days">All Days</option>
                    <option value="Hourly Basis">Hourly Basis</option>
                </select>
            
                     
                    
            
             <label for="input">Choose Rent Type  </label>
                <select class="mdb-select md-form mb-4 initialized ml-3" name="renttype" required>
                    <option value="" disabled selected>Choose your option</option>
                    <option value="Day Wise">Day Wise</option>
                    <option value="Weekly Wise">Weekly</option>
                    <option value="Monthly Wise">Monthly</option>
                </select>
            

                 <div class="text-center">
            <input class="btn btn-lg btn-primary" type="submit" value="Add">
                  </div>
                  
                  <hr>
                  <div class="text-center">
                  <a href="AddSpace2.jsp">Add Existing Category Spaces</a>
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
</body>
</html>