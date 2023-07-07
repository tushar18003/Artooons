<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
    <style>
       <style> * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body {
        height: 100vh;
        width: 100%;   
             background-color: lightgreen;

        background-size: cover;
        background-position: center;
        position: relative;
    }
    
    .container {
        height: 500px;
        width: 500px;
        position: absolute;
        top: 1%;
        left: 550px;
          
    }
    
    .container h1 {
        font-size: 3rem;
        color: #0c6f96;
        margin: 0 0 10px 0;
    }
    
    .container .form-group {
        margin: 30px 0 30px 0;
    }
    
    .container .form-group label {
        font-size: 1.5rem;
        font-weight: 500;
        color: red;
    }
    
    .container .form-group input {
        margin: 5px 0;
        padding-left: 5px;
        height: 40px;
        width: 80%;
        border: 0;
        outline: none;
        background: transparent;
        border-bottom: 2px solid #050404;
        color: #053345;
        transition: 0.5s ease;
    }
    
    .container .form-group input:focus {
        border-bottom: 2px solid #0c6f96;
    }
    
    ::placeholder {
        color: #0c6f96;
    }
    
    .container a {
        color: #0c6f96;
        text-decoration: none;
        font-size: 18px;
    }
    
    .container button {
        margin: 20px 0;
        padding: 10px 40px;
        display: inline-block;
        border: 0;
        outline: none;
        background: linear-gradient(to left,brown,gold);
        font-size: 18px;
        color: #111;
        font-weight: 400;
        cursor: pointer;
        transition: 0.5s ease;
        

    }
    
    .container button:hover {
        background: linear-gradient(to right,green,black);
    }
    
    @media (max-width:600px) {
        .container {
            left: 0px;
            padding: 50px;
        }
    }
    </style>
    
    
    <title>Update inventory!!</title>
  </head>
  <body>
<%
     PrintWriter pw = response.getWriter();
   
     String id = request.getParameter("pid");
     
try{

Class.forName("com.mysql.cj.jdbc.Driver");
          String url="jdbc:mysql://localhost:3306/artooons";
          String dbusername="root";
          String pass="shiv";
          Connection conn= DriverManager.getConnection(url, dbusername, pass);
          
          String query = "select * from products where productid=?";
          PreparedStatement ps = conn.prepareStatement(query);
           ps.setString(1,id);
   
           
          ResultSet rs=ps.executeQuery();
          
while(rs.next()){
            
              String descreption = rs.getString(1);
            String product_id = rs.getString(2);
           String tittlep= rs.getString(3);
            String price = rs.getString(4);
            String stock = rs.getString(5);
            String categeory = rs.getString(6);
           String image =rs.getString(7);
    %>
    
    <form action="update.jsp">
            <div class="container">
        <h1>Updation Page</h1>
         <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Product Id</label>
            <input type="text" class="form-control" name="productid" value="<%=product_id%>" readonly="">
          </div>
            
        
          <div class="mb-3">
            <label for="message-text" class="col-form-label">Description:</label>
            <textarea class="form-control" id="message-text" name="desc"><%=descreption%></textarea>
          </div>
            
            
            
            
              <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Tittle</label>
            <input type="text" class="form-control" name="tittle" value="<%=tittlep%>" >
          </div>
            
            
              <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Price</label>
            <input type="text" class="form-control" name="price" value="<%=price%>" >
          </div>
            
                          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Stock</label>
            <input type="text" class="form-control" name="stock" value="<%=stock%>" >
          </div>
            
                          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Category</label>
            <input type="text" class="form-control" name="category" value="<%=categeory%>" >
            
          </div>
            
            <small class="text-muted">***Note: You cannot update image and product id***</small>
                  <div class="modal-footer">
        <button type="reset" class="btn btn-secondary" >Reset</button>
         &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;
        <button type="submit" class="btn btn-secondary modal-content-center">Update Inventory</button>
      </div>
            
    </form>
    
     </div>
    <%
        
        
        }
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