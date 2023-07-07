<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
  response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
        <%
        response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
       
        if(session.getAttribute("username")==null){
            response.sendRedirect("Login.html");
            }
            else if(session.getAttribute("admin").equals("1")){
            response.sendRedirect("admin.jsp");
            }    
            else{
            response.sendRedirect("user.jsp");
            }
        %>
                
                <form action="logmeout">
                <button type="submit">logout</button>  
                </form>
        
    </body>
</html>
