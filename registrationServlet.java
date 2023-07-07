import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("register")
public class registrationServlet extends HttpServlet {
    
    public void  service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    try {
          PrintWriter pw = response.getWriter();
        
          String name = request.getParameter("name");
          String username = request.getParameter("username");
          String email = request.getParameter("email");
          String password = request.getParameter("password");
          String mobile = request.getParameter("mobile");
             
          
         // pw.print("my detalis"+name+username);
          
          Class.forName("com.mysql.cj.jdbc.Driver");
          String url="jdbc:mysql://localhost:3306/artooons";
          String dbusername="root";
          String pass="shiv";
          Connection conn= DriverManager.getConnection(url, dbusername, pass);
          
          
          String query="insert into register(name,email,username,mobile,password,type)values(?,?,?,?,?,?);";
           PreparedStatement ps = conn.prepareStatement(query);
           ps.setString(1,name);
           ps.setString(2, email);
           ps.setString(3, username);
           ps.setString(4, mobile);
           ps.setString(5,password);
           ps.setInt(6, 2);
           
           //ps.executeUpdate();
           int res = ps.executeUpdate();  
         if(res>0)
         {
             
            

                response.sendRedirect("Login.html");
         }
         else
         {
             pw.print("not registered try again");
         }
          
          
          ps.close();
          conn.close();
          
          
    
    }catch(Exception e){
        System.out.print(e);
    }
}
}

