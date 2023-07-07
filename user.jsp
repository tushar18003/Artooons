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
    <script src="addtocartt.js" async=""></script>
    <title>Thanks for Logging in</title>
  </head>
  
   <body style="background-color:linen;">
  
  
         <%
        response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
       
        if(session.getAttribute("username")==null){
            response.sendRedirect("Login.html");
            }
            
           String user = (String)session.getAttribute("username");
           

        %>
       
        
        <div class="card" id="demo1" >
            <div class="card-body text-center" style="font-family:cursive;background-color:linen ;color:red">
                <h1><b>Shop in Art Through Artooons!!</b></h1>
  </div>
            
</div>
   
<div style=" 
     position:fixed;
  top:0;
  width: 100%;" >
  
             <div class="container-fluid my-auto" style="position: absolute ">
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 " style="background-color:linen">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <br>
                <br><br>
                <img src="sss.png" alt="hugenerd" width="200" height="200" class="rounded-circle">
                <br>
                <small style=" text-align:center;color:red;font-family:cursive  "><h5><b>Welcome <%= user %>!!</b></h5></small>
                <hr><!-- comment -->

                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                  
                         
                    
                  
                     <div class="dropdown pb-4">
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                       
                        <span class="d-none d-sm-inline mx-1"> <button class="btn btn-sm " style="background-color: dodgerblue;color:black" > Manage</button></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
                        
                        
                        
                        <li><a class="dropdown-item" href="logmeout">Sign out</a></li>
                      </ul>
                        </div>
                    
                    <li><a href="#" onclick="update()" data-bs-toggle="modal" data-bs-target="#cart"><i class="fa fa-cart-plus" style="font-size: 30px;text-align: center;color: dodgerblue"></i></a><span class="cartlen" id="cart-items"  style="font-size: 20px;margin-left:10px ;color: black ">(0)</span></li>
          
            

   
                    
                    
                    <li>
                        <a href="#" class="nav-link px-0 align-middle">
                             <form action="index.html"> <span class="d-none d-sm-inline mx-1"> <button class="btn btn-sm " style="background-color: dodgerblue;color:black">Home Page</button></span></form>
                    </li>
                    <br>
                    <li class="nav-item">
                        <form action="vieworder.jsp"> <span class="d-none d-sm-inline mx-1"> <button class="btn btn-sm " style="background-color: dodgerblue;color:black">View Orders</button></span></form>
                    </li>
                  
                    
            
                     <div class="dropdown pb-4">
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                        
                        <span class="d-none d-sm-inline mx-1"> <button class="btn btn-sm "style="background-color: dodgerblue;color:black">Select by Categeory</button></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
                             <li><a class="dropdown-item" href="user.jsp">View All</a></li>
<li><a class="dropdown-item" href="select.jsp?cat=indian flok art" name="indian" value"hiii">Indian Flok Art</a></li>
                     
                        <li><a class="dropdown-item" href="select.jsp?cat=Cartoons">Cartoons Art</a></li>
                        <li><a class="dropdown-item" href="select.jsp?cat=Flower">Flowers Art</a></li>
                     
                        <li><a class="dropdown-item" href="select.jsp?cat=Nature">Nature Art</a></li><!-- comment -->
                        <li><a class="dropdown-item" href="select.jsp?cat=Devotional Art">Devotional Art</a></li>
                     
                        <li><a class="dropdown-item" href="select.jsp?cat=Modern Art">Modern Art</a></li>
                      </ul>
                        </div>
                

                </ul>
                

            </div>
        </div>
       
    </div>
        </div>
        
  </div>
      
    
    
      
               <%
               PrintWriter pw = response.getWriter();
          try{
           Class.forName("com.mysql.cj.jdbc.Driver");
          String url="jdbc:mysql://localhost:3306/artooons";
          String dbusername="root";
          String pass="shiv";
          Connection conn= DriverManager.getConnection(url, dbusername, pass);
          
          String query = "select * from products";
             Statement statement;
            statement = conn.createStatement();
            ResultSet rs;
            rs = statement.executeQuery(query);
          
            while(rs.next()){
            
              String descreption = rs.getString(1);
            String product_id = rs.getString(2);
           String tittlep= rs.getString(3);
            String price = rs.getString(4);
            String stock = rs.getString(5);
            String categeory = rs.getString(6);
           String image =rs.getString(7);
  %>     
  
  	
<div class="card text-warning  my-2 mx-2 " style="max-width: 579px;float:left;left:18%;background-color: skyblue">
  <div class="row g-0">
      <div class="col-md-4">
        <img src="uploads/<%=image%>" class="img-fluid rounded-start" alt="..." style="height:290px ">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title" style="color:black"><%=tittlep%></h5>
        <p class="card-text " style="color:blue"><%=descreption%></p>
        <p class="card-text"><small class="text-danger">Amount:&nbsp;<%=price%>   INR  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  Instock: <%=stock%> left</small></p>
      

           <input type="hidden" name="pid" value="<%=product_id%>">
           <button type="submit" style="position:absolute" class="btn btn-success col-3" onclick="add('<%=product_id%>','<%=tittlep%>','<%=price%>','<%=stock%>','<%=image%>');">Add To Cart</button>       
    

      </div>
    </div>
  </div>
</div>
  
          <%
              
          } 
          
          
          
          }catch(Exception e){
          
          pw.print(e);
          
          }

      %>      
      
      <div class="modal fade" id="cart" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Your Cart</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        
        
      <div class="modal-body">
          <div id="cart-body">
              
          </div>
               
      </div>
        
        
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <form action="check.jsp">
         <button type="submit" class="btn btn-primary" id="cart-check" >check out</button>
         </form>
      </div>
    </div>
  </div>
</div>
      
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>