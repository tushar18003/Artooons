<%@page import="java.sql.PreparedStatement"%>
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>update inventory !!</title>
  </head>
  <body>
    <%
        
     PrintWriter pw = response.getWriter();
       String desc = request.getParameter("desc");
        String productid = request.getParameter("productid");
       String tittle = request.getParameter("tittle");
       String price = request.getParameter("price");
       String stock = request.getParameter("stock");
       String category = request.getParameter("category");
    
    try{
        
        Class.forName("com.mysql.cj.jdbc.Driver");
          String url="jdbc:mysql://localhost:3306/artooons";
          String dbusername="root";
          String pass="shiv";
          Connection conn= DriverManager.getConnection(url, dbusername, pass);
          
          String query = "update products set descp=?, tittle=?, price=?, stock=?, categeory=? where productid=? ";
          PreparedStatement ps = conn.prepareStatement(query);
         ps.setString(1,desc);
           ps.setString(6, productid);
           ps.setString(2, tittle);
           ps.setString(3, price);
           ps.setString(4,stock);
           ps.setString(5, category);
           
        
        ps.executeUpdate();
        
        
        
        
        response.sendRedirect("manage.jsp");
        
        
        }catch(Exception e){
        
        pw.print(e);
        
        }
    %>
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