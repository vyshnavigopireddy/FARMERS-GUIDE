import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class register extends HttpServlet
{
public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
{
PrintWriter out=res.getWriter();
String fname=req.getParameter("t1");
String lname=req.getParameter("t2");
String uname=req.getParameter("t3");
String pass=req.getParameter("t4");
String address=req.getParameter("t5");
long contact=Long.parseLong(req.getParameter("t6"));
res.setContentType("text/html");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","vyshu");
PreparedStatement pst=con.prepareStatement("insert into register1 values(?,?,?,?,?,?)");
pst.setString(1,fname);
pst.setString(2,lname);
pst.setString(3,uname);
pst.setString(4,pass);
pst.setString(5,address);
pst.setLong(6,contact);
int i=pst.executeUpdate();
if(i==1)
out.println("registered successfully");
}
catch(Exception e)
{
 out.println(e);
}
}
}