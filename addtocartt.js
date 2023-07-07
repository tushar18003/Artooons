

update();
      function add(pid,ptitle,price,stock,image){
      console.log(pid,ptitle,price,stock,image);
    
    
      let cart= localStorage.getItem("cart");
   
   
      if(cart===null){
       
       let products=[];
       let product={
           productid:pid,
           producttittle:ptitle,
           productprice:price,
           productstock:stock,
           productimage:image,
           productquantity:1
       };
           products.push(product);
           localStorage.setItem("cart",JSON.stringify(products));
           
           
       }
       
       else{
           
           
           let pcart = JSON.parse(cart);
           
        let oldproduct =   pcart.find((item)=> item.productid == pid);
        
        if(oldproduct){
            oldproduct.productquantity = oldproduct.productquantity+1
            pcart.map((item)=>{
                if(item.productid == oldproduct.productid){
                    item.productquantity = oldproduct.productquantity
                }
            }
               )     
     localStorage.setItem("cart",JSON.stringify(pcart));
    alert("Quantity increased")
                         
        }
        
        else{
            
                  let product={
           productid:pid,
           producttittle:ptitle,
           productprice:price,
           productstock:stock,
           productimage:image,
           productquantity:1
       };
           
                  pcart.push(product)
                  localStorage.setItem("cart", JSON.stringify(pcart));
            
            
        }
           
           
       }
       

 update();
    
}
  

update();



function update(){
    
    let cartstring = localStorage.getItem("cart");
    let cart = JSON.parse(cartstring);
    
    if(cart==null||cart.length == 0){
       
        console.log("empty");
     document.getElementById("cart-body").innerHTML = "<small>Your Cart Is Empty : Please add items</small>"
   
     document.getElementById("cart-check").classList.add("disabled")
     
 
    }
    else{
        
       document.getElementById("cart-items").innerText = `(`+ cart.length +`)`;
        console.log("no")
         document.getElementById("cart-check").classList.remove("disabled");
        
        
        let neww = `

<table class="table">
  <thead>
    <tr>
        <th scope="col">Product</th>
      <th scope="col">Product Id</th>
      <th scope="col">Product Name</th>
      <th scope="col">Price</th>  
       <th scope="col">Quantity</th>
      <th scope="col"> Total Price</th>
         <th scope="col">Add</th>
        <th scope="col">Action</th> 
      
    </tr>
  </thead>
 

` ;
       
        cart.map((item)=>(
                
                neww+=`

<tr>
     
      <td><img src="uploads/${item.productimage}" style="width:50px;height:50px"></img></td>
      <td>${item.productid}</td>
      <td>${item.producttittle}</td>
        <td>${item.productprice}</td>
        <td>${item.productquantity}</td>
        <td>${item.productprice*item.productquantity}</td>
         <td><button onclick="iin(${item.productid})" type="submit" class="btn btn-success">+1</button></td>
        <td><button onclick="deletecart(${item.productid})" type="submit" class="btn btn-success">-1</button></td>
        <td><button onclick="deletecartall(${item.productid})" type="submit" class="btn btn-danger">Remove</button></td>
       
    </tr>


`
         
       
               
          ))
  
          let totalprice=0;
   cart.map((item)=>(

         totalprice = totalprice + (item.productquantity * item.productprice)   
                
                ))
  
   
 
        
     neww = neww + `

<tr><td colspan='6' style=" text-align:center;color:black;font-weight:bold">Total Price:${totalprice}</td></tr>

</table>`
     document.getElementById("cart-body").innerHTML = neww;

    
     
 
       
    }
    
 
}


function deletecart(pid){
    
   let pcart = JSON.parse(localStorage.getItem("cart"));
           
        let oldproduct =   pcart.find((item)=> item.productid == pid);
        
        if(oldproduct){
            oldproduct.productquantity = oldproduct.productquantity-1;
            pcart.map((item)=>{
                if(item.productid == oldproduct.productid){
                    item.productquantity = oldproduct.productquantity
                }
            }
               )     
     localStorage.setItem("cart",JSON.stringify(pcart));
}
update();
    
}


function iin(pid){
        let pcart = JSON.parse(localStorage.getItem("cart"));
           
        let oldproduct =   pcart.find((item)=> item.productid == pid);
        
        if(oldproduct){
            oldproduct.productquantity = oldproduct.productquantity+1
            pcart.map((item)=>{
                if(item.productid == oldproduct.productid){
                    item.productquantity = oldproduct.productquantity
                }
            }
               )     
     localStorage.setItem("cart",JSON.stringify(pcart));
}
update();
}

 function deletecartall(pid){
     
     let pcart = JSON.parse(localStorage.getItem("cart"));
           
        let oldproduct =   pcart.filter((item)=> item.productid != pid);
     
     localStorage.setItem("cart",JSON.stringify(oldproduct));
     
     update();
 }