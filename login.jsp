<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" >
<style>
 .container-fluid
        {
            padding: 60px 50px;
        }
       
        .panel
        {
            border: 1px solid #f4511e;
            border-radius: 0px !important;
            transition: box-shadow 0.5s;
        }
        
        .panel:hover
        {
            box-shadow: 5px 0px 40px rgba(0,0,0,0.2);
            
        }
        .panel-footer .btn:hover
        {
            border: 1px solid #f4511e;
            background-color: #fff !important;
            color: #f4511e;
        }
        .panel-heading
        {
            color: #fff !important;
            background-color: #f4511e !important;
            padding: 25px;
            border-bottom: 1px solid transparent;
            border-top-left-radius: 0px;
            border-top-right-radius: 0px;
            border-bottom-left-radius: 0px;
            border-bottom-right-radius: 0px;
            
        }
        
</style>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
  <div class="container">
  <a href="#" class="navbar-brand" >LOGIN</a>
  <button class="navbar-toggler" data-toggle="collapse" data-target="#navbar"><span class="navbar-toggler-icon"></span></button>
  <div class="collapse navbar-collapse" id="navbar">
  <ul class="navbar-nav ml-auto">
  <li class="nav-item">
  <a class="nav-link" href="#">HOME</a>
  </li>
  <li class="nav-item">
  <a class="nav-link" href="#">EXPLORE</a>
  </li>
  <li class="nav-item">
  <a class="nav-link" href="#">CREATE</a>
  </li>
  <li class="nav-item">
  <a class="nav-link" href="#">SHARE</a>
  </li>
  </ul>
  </div>
  </div>
  </nav>
  
  <div class="container-fluid">
        <div class="row text-center">
            
            <div class="col-sm-6 col-md-6">
            <div class="panel panel-default text-center">
                <div class="panel-heading">
                <h1>LoginPanel</h1>
                </div>
                <div class="panel-body">
                <form action="Login" method="post" class="form-horizontal col-sm-12 col-md-12" autocomplete="off">
                    <div class="form-group">
                    <label for="email">UserName</label>
                        <input type="text" class="form-control" name="uname" placeholder="Enter Username" required>
                    </div>
                    <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control"  name="password" placeholder="Enter Password" required>    
                    </div>
                    <div class="form-group">
                    <a href="forgot-password.jsp">forgot password?</a>
                    </div>
                    <div class="form-group">
                    <input type="submit" value="Login" class="btn btn-lg">
                    </div>
                    </form>
                </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-6">
            <div class="panel panel-default text-center">
                <div class="panel-heading">
                <h1>SignUp Panel</h1>
                </div>
                <div class="panel-body">
                <form action="UserSignIn" method="post"  class="form-horizontal col-sm-12 col-md-12" autocomplete="off">
                    <div class="form-group">
                    <label for="name">UserName</label>
                    <input type="text" name="uname" class="form-control" placeholder="Enter UserName" required>
                    </div>
                    <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="Enter Email" required>    
                    </div>
                    <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Enter Password" required>    
                    </div>
                    <div class="form-group">
                    <label for="Confirm password">Confirm Password</label>
                    <input type="password" name="Cpassword" id="password" class="form-control" placeholder="Confirm Password" required>    
                    </div>
                    <div class="form-group">
                    <input type="submit" value="SignUp" class="btn btn-lg">
                    </div>
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
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
    crossorigin="anonymous"></script>
</body>
</html>