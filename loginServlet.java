
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class loginServlet extends HttpServlet {

     public void  service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    PrintWriter pw = response.getWriter();
   try{
   String username = request.getParameter("username");
   String password = request.getParameter("password");
   
   pw.print(username);
   
   
   Class.forName("com.mysql.cj.jdbc.Driver");
          String url="jdbc:mysql://localhost:3306/artooons";
          String dbusername="root";
          String pass="shiv";
          Connection conn= DriverManager.getConnection(url, dbusername, pass);
          
          String query = "select * from register where username=? &&password=?";
          PreparedStatement ps = conn.prepareStatement(query);
           ps.setString(1,username);
           ps.setString(2, password);
   
           
          ResultSet rs=ps.executeQuery();
          
        
          
          
          if(rs.next()){
              String isadmin = rs.getString("type");
              HttpSession session = request.getSession();
              session.setAttribute("username",username);
              session.setAttribute("admin",isadmin);                                
            // response.sendRedirect("home.jsp");
             
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
             
   }
          else{
          
          pw.print("you have entered wrong id or password");
          }
   
   }
   catch(Exception e){
    
   pw.print(e);
   }
    
}
}
