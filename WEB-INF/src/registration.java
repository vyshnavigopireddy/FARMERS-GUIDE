import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class registration extends HttpServlet
{
public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
{
PrintWriter out=res.getWriter();
String uname=req.getParameter("name");
String email=req.getParameter("email");
long phoneno=Long.parseLong(req.getParameter("phonenumber"));
String pass=req.getParameter("password");
String conpass=req.getParameter("confirmpassword");
String gender=req.getParameter("gender");
res.setContentType("text/html");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","vyshu");
PreparedStatement pst=con.prepareStatement("insert into users values(?,?,?,?,?,?)");
pst.setString(1,uname);
pst.setString(2,email);
pst.setLong(3,phoneno);
pst.setString(4,pass);
pst.setString(5,conpass);
pst.setString(6,gender);
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