import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;

public class login2 extends GenericServlet {
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        String us = req.getParameter("t1");
        String pass = req.getParameter("t2");
        res.setContentType("text/html");

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "vyshu");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from users");
            int flag = 0;
            while (rs.next()) {
                if (us.equals(rs.getString(1)) && pass.equals(rs.getString(4))) {
                    flag = 1;
                    // Store the username in session
                    HttpSession session = ((HttpServletRequest) req).getSession();
                    session.setAttribute("username", us);
                    break;
                }
            }
            if (flag == 1) {
                RequestDispatcher rd = req.getRequestDispatcher("homevyshu2.jsp");
                rd.forward(req, res);
            } else {
                out.println("<h3>Sorry! username and password details are not found</h3>");
                RequestDispatcher rd = req.getRequestDispatcher("login2.html");
                rd.include(req, res);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}