import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig

public class addproductServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        String desc = request.getParameter("desc");
       String productid = request.getParameter("productid");
       String tittle = request.getParameter("tittle");
       String price = request.getParameter("price");
       String stock = request.getParameter("stock");
       String category = request.getParameter("category");
       Part file = request.getPart("img");
       String imgname= file.getSubmittedFileName();
       //pw.print(imgname);
       

       /* pw.print(desc);
        pw.print(productid);
        pw.print(tittle);
        pw.print(price);
        pw.print(stock);
        pw.print(category);*/
       
       
       try{
        Class.forName("com.mysql.cj.jdbc.Driver");
          String url="jdbc:mysql://localhost:3306/artooons";
          String dbusername="root";
          String pass="shiv";
          Connection conn= DriverManager.getConnection(url, dbusername, pass);
          
           String query="insert into products(descp,productid,tittle,price,stock,categeory,image)values(?,?,?,?,?,?,?);";
           PreparedStatement ps = conn.prepareStatement(query);
           ps.setString(1,desc);
           ps.setString(2, productid);
           ps.setString(3, tittle);
           ps.setString(4, price);
           ps.setString(5,stock);
           ps.setString(6, category);
           ps.setString(7, imgname);
           
       ps.executeUpdate(); 
       

          String uploadpath ="C:/Users/Asus/OneDrive/Documents/NetBeansProjects/artooons/web/uploads/"+imgname;
          try{
          FileOutputStream fs =new FileOutputStream(uploadpath);
          InputStream is = file.getInputStream();
          byte[] data=new byte[is.available()];
          is.read(data);
          fs.write(data);
          fs.close();
          
 
          
          } 
          
          
          catch(Exception e){
           pw.print(e);
       }
         // pw.print(uploadpath);

          response.sendRedirect("admin.jsp");
          
       //ps.executeUpdate(); 
       }catch(Exception e){
           pw.print(e);
       }
      
       
    }

 
}
