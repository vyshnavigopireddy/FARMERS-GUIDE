import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class age extends HttpServlet
{
   public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
   {
PrintWriter out=res.getWriter();
	try
	{
	
	Cookie ck[]=req.getCookies(); 
	String name=new String();  
	for(int i=0;i<ck.length;i++)
	{
	   name= ck[i].getName();
	}
	String age=req.getParameter("age");
	
    res.addCookie(new Cookie("name",name));
	res.addCookie(new Cookie("age",age));
	 RequestDispatcher rd=req.getRequestDispatcher("finall");
        rd.forward(req,res);
	}
     catch(Exception ex)
{
  out.println(ex);
}
}
}
