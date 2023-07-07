<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        .j{
            background-color: burlywood;
        }
    </style>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Manage Products!!</title>
  </head>
  <body class="j">
      
      
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
          <a class="navbar-brand" href="#"><b style="font-size: 26px; color:gold;">Artooons</b></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          
          &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; 
          <h1 style="color:wheat">Managements Panel !!</h1>

            &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
            
            <form action="logmeout"> <button class="btn btn-outline-warning">Logout</button></form>
          </div>
     
      </nav>
    
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
  
        	
<div class="card text-warning bg-dark my-3 mx-3 " style="max-width: 579px;float:left;left:8%">
  <div class="row g-0">
      <div class="col-md-4">
        <img src="uploads/<%=image%>" class="img-fluid rounded-start" alt="..." style="height:290px ">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title"><%=tittlep%></h5>
        <p class="card-text text-danger"><%=descreption%></p>
        <p class="card-text"><small class="text-light">Amount:&nbsp;<%=price%>   INR  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  Instock: <%=stock%></small></p>
       <form action="edit.jsp">
           <input type="hidden" name="pid" value="<%=product_id%>">
           <button type="submit" style="position:absolute" class="btn btn-success col-3">Edit</button></form>        
        <form action="delete.jsp">  
                       <input type="hidden" name="ppid" value="<%=product_id%>">
            <button type="submit" style="position: absolute ;left:390px" class="btn btn-success col-3 ">Delete</button></form>
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
      
      
     
        
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>
