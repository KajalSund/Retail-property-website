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
<body>


<div class="container">
<div class="row justify-content-center align-items-center">
<div class="col-lg-6 col-sm-12">
<div class="card mt-5">

    <h5 class="card-header info-color white-text text-center py-4">
        <strong>Contact Us</strong>                                                                                   
    </h5>

    <div class="card-body px-lg-5 pt-0">


<form class="text-center p-5" action="#!">

    <input type="text" class="form-control mb-4" placeholder="Name" required>

    <input type="email"  class="form-control mb-4" placeholder="E-mail">

    
    <label>Subject</label>
    <select class="browser-default custom-select mb-4" required>
        <option value="" disabled>Choose option</option>
        <option value="1" selected>Feedback</option>
        <option value="2">Report a bug</option>
        <option value="3">Feature request</option>
        <option value="4">Other</option>
    </select>

    
    <div class="form-group">
        <textarea class="form-control rounded-0" id="exampleFormControlTextarea2" rows="3" placeholder="Message"></textarea>
    </div>

  
    <div class="custom-control custom-checkbox mb-4">
        <input type="checkbox" class="custom-control-input" id="defaultContactFormCopy">
        <label class="custom-control-label" for="defaultContactFormCopy">Send me a copy of this message</label>
    </div>

   
    <button class="btn btn-info btn-block" type="submit">Send</button>

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
</html>