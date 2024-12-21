<%@ page import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    String answer = request.getParameter("answer");

    // Check if name and answer parameters are not null or empty
    if (name != null && !name.isEmpty() && answer != null && !answer.isEmpty()) {
        try {
            // Establish a connection to the database
            String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
            String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
            String USER = "system";
            String PASS = "vyshu";
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // Prepare SQL statement to insert data into the table
            String sql = "INSERT INTO Ans (name, answer) VALUES (?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, answer);

            // Execute the SQL statement
            pstmt.executeUpdate();

            // Close resources
            pstmt.close();
            conn.close();

            // Optionally, display a success message
            out.println("<script>alert('Answer submitted successfully');</script>");
        } catch (SQLException se) {
            // Handle SQL exceptions
            se.printStackTrace();
        }
    }
%>
