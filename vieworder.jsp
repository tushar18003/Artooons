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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Hello, world!</title>
  </head>
  <body style="background-color:linen">
      
           <div class="card" id="demo1" >
            <div class="card-body text-center" style="font-family:cursive;background-color:linen ;color:red">
                <h1><b>Your Orders!!</b></h1>
  </div>
    
       <%
               PrintWriter pw = response.getWriter();
          try{
           Class.forName("com.mysql.cj.jdbc.Driver");
          String url="jdbc:mysql://localhost:3306/artooons";
          String dbusername="root";
          String pass="shiv";
          Connection conn= DriverManager.getConnection(url, dbusername, pass);
          
          String query = "select * from products where productid <=4";
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
  
  	
<div class="card text-warning  my-2  " style="max-width: 579px;position:relative; left:30%; background-color: black">
  <div class="row g-0">
      <div class="col-md-4">
        <img src="uploads/<%=image%>" class="img-fluid rounded-start" alt="..." style="height:290px ">
    </div>
    <div class="col-md-8">
      <div class="card-body">
          <p class="card-text " style="color:yellowgreen">order id : <%=product_id%></p>
        <h5 class="card-title" style="color:yellowgreen"><%=tittlep%></h5>
        <p class="card-text " style="color:yellowgreen"><%=descreption%></p>
        <p class="card-text"><small class="text-danger">Amount:&nbsp;<%=price%> INR  Paid via Stripe</small></p>
      

           <input type="hidden" name="pid" value="<%=product_id%>">
             
    

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
 
      
      
      
      
      
   
            
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

   
  </body>
</html>