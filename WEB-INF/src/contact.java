import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class contact extends HttpServlet
{
public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
{
PrintWriter out=res.getWriter();

String fname=req.getParameter("name");
String email=req.getParameter("email");
long phoneno=Long.parseLong(req.getParameter("phno"));
String message=req.getParameter("message");

res.setContentType("text/html");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","vyshu");
PreparedStatement pst=con.prepareStatement("insert into contact values(?,?,?,?)");
pst.setString(1,fname);
pst.setString(2,email);
pst.setLong(3,phoneno);
pst.setString(4,message);
int i=pst.executeUpdate();
if(i==1)
{
          
                RequestDispatcher rd=req.getRequestDispatcher("contact us vyshu.html");
 rd.include(req,res);
}

  }      
        catch(Exception e)
{
 out.println(e);
}
}
}