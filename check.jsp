<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://js.stripe.com/v3/"></script>
   

    <script src="checkout.js" async=""></script>
    <script src="payment.js" async="" ></script>
    <title>check out!</title>
  </head>
  
   <body style="background-color:whitesmoke;">
  
  <div class="card my-3" id="demo1" >
            <div class="card-body text-center" style="font-family:Monaco;background-color:black;color:red">
                <h1><b>Lookout Your Details !!</b></h1>
  </div>
            
</div>
         <%
        response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
       
        if(session.getAttribute("username")==null){
            response.sendRedirect("Login.html");
            }
            
           String user = (String)session.getAttribute("username");
           

        %>
       
        
        <div class="container my-9" >
            <div id="checkbody" style="color:red;">
            
        </div>
</div>
  

                          <div class="col-12 text-center">
                     <button onclick="pay()"  class="btn btn-primary stripe-button">Pay now</button> 
  </div>
           
                  <form action="user.jsp">
                     <div class="col-12 text-center my-3">
                         <button type="submit" class="btn btn-primary">Continue Shopping</button>
  </div>
                </form>
            
        </div>    
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>