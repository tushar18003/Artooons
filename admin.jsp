<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <style>
         body {
      background-color:dodgerblue
          ;
    }
    </style>
    <title>Hello,admin!</title>
  </head>
  <body>
   
       <%
  

response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
       
        if(session.getAttribute("username")==null){
            response.sendRedirect("Login.html");
            }
            
           String user = (String)session.getAttribute("username");

        %>
        
      
      <div style=" position: fixed;
  top: 0;
  width: 100%;">
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
          <a class="navbar-brand" href="#"><b style="font-size: 26px; color:gold;">Artooons</b></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          
          &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; 
           <h1 style="color:white;font-family: fantasy"><%=user%> Welcome to Artist Panel !!</h1>

            &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
            
            <form action="logmeout"> <button class="btn btn-outline-warning">Logout</button></form>
          </div>
     
      </nav>
      
      </div>
      
      <div style="top:25%;right: 65%;position:absolute;">
          <div class="card" style="width:19rem;">
  <img src="aa.png" class="card-img-top" alt="...">
  <div class="card-body">
      <h5 class="card-title" >Add Products</h5>
      <p class="card-text">Add your products through Artoons.</p>
    <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#addproduct" >Add Your Art</button>
  </div>
</div>
 </div>
      
        
        

        <div class="modal fade" id="addproduct" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  <div class="modal-dialog ">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Art</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          
          
          <form action="addproductServlet"  method="POST" 
                enctype="multipart/form-data">
            
            <div class="mb-3">
  <label for="formFile" class="form-label">Add  Art Image</label>
  <input class="form-control" type="file" id="formFile" name="img">
</div>
        
          <div class="mb-3">
            <label for="message-text" class="col-form-label">Description:</label>
            <textarea class="form-control" id="message-text" name="desc"></textarea>
          </div>
            
             <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Product Id</label>
            <input type="text" class="form-control" name="productid">
          </div>
            
            
              <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Tittle</label>
            <input type="text" class="form-control" name="tittle">
          </div>
            
            
              <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Price</label>
            <input type="text" class="form-control" name="price">
          </div>
            
                          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Stock</label>
            <input type="text" class="form-control" name="stock">
          </div>
            
                          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">Category</label>
            <input type="text" class="form-control" name="category">
            
          </div>
                  <div class="modal-footer">
        <button type="reset" class="btn btn-secondary" >Reset</button>
        <button type="submit" class="btn btn-secondary modal-content-center">Add into Artooons</button>
      </div>
        </form>
          
          
      </div>
    </div>
  </div>
</div>
        
     
        
      
          
      <div style="top:25%;right:40%;position:absolute;">
   <div class="card" style="width: 19rem;">
  <img src="pm.png" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Manage Products</h5>
    <p class="card-text">Customize and Manage your Art here!</p>
    <form action="manageServlet"> <button class="btn btn-outline-danger">Manage Your Art</button></form>
  </div>
</div>
 </div>
           
           
           <div style="top:25%;right:15%;position:absolute">
   <div class="card" style="width: 19rem;">
  <img src="6384191.png" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">View orders</h5>
    <p class="card-text">view your orders here!</p>
    <a href="vieworder.jsp"> <button class="btn btn-outline-danger">View order</button></a>
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