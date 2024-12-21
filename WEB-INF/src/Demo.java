import java.sql.*;
import java.io.*;
import java.util.*;
public class Demo
{
public static void main(String args[])
{
try
{
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "vyshu");
Statement st=con.createStatement();
st.executeUpdate("create table fsd(name varchar2(20),branch varchar2(10))");
System.out.println("table created");
}
catch(Exception e)
{
System.out.println(e);
}
}
}