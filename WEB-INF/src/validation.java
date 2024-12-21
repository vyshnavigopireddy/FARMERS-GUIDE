import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class validation extends GenericServlet
{
public void service(ServletRequest req,ServletResponse res) throws ServletException,IOException
{
PrintWriter out=res.getWriter();
String name=req.getParameter("t1");
out.println("Welcome :"+name);
}
}