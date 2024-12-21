<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <style>
        /* Your CSS styles here */
        body {
            background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfX3nAbt6u_ie6THheN8Rzd3DO1p-PGhFbwA&usqp=CAU');
            background-size: cover;
            text-align: center;
            margin: 0;
            padding: 0;
            background-attachment: fixed;
        }

        h1 {
            color: #333;
        }

        header {
            background-color: #66CDAA;
            color: #fff;
            font-family: "Apple Chancery", cursive;
            padding: 20px 0;
            text-align: center;
        }

        table {
            max-width: 800px; /* Increased width */
            margin: 2rem auto;
            border-collapse: collapse;
            width: 100%;
        }

        table, th, td {
            border: 1px solid #fff;
            padding: 8px;
        }

        th {
            background-color: #66CDAA;
            color: black;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        input[type="text"] {
            width: 150%; /* Adjust input field width */
        }

        .main {
            max-width: 500px;
            margin: 2rem auto; /* Center align */
            padding-bottom: 1rem;
            border-bottom: 2px solid #fff;
            cursor: pointer;
            text-align: center; /* Center align */
        }

        .ab {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            margin-bottom: 20px; /* Add margin below buttons */
        }

        .ab form {
            display: flex; /* Ensure forms are displayed horizontally */
        }

        .ab input[type="submit"] {
            margin: 0 10px;
            padding: 5px 10px;
            border: 1px solid #333;
            border-radius: 5px;
            background-color: #fff;
            transition: background-color 0.3s ease;
            cursor: pointer;
        }

        .ab input[type="submit"]:hover {
            background-color: black;
            color: white;
        }

        label {
            color: white;
            font-weight: bold;
        }

        input {
            width: 200%;
            padding: 20px;
            box-sizing: border-box;
            color: black;
        }

        .button {
            border: none;
            outline: none;
            height: 50px;
            background: #98FF98;
            color: #fff;
            font-size: 18px;
            border-radius: 10px;
            margin-top: 10px;
            width: 350px;
            padding: 10px;
        }

        .button:hover {
            background-color: aqua;
        }

    </style>
</head>
<body>
<%@page import="java.sql.*" %>
<%
String username = (String) session.getAttribute("username"); // Removed duplicate 'session' variable declaration
%>

<header>
    <h1>Admin Dashboard</h1>
</header>

<div class="ab">
    <form action="homevyshu.html" method="post">
        <input type="submit" value="Logout">
    </form>
    <form action="reg.jsp">
        <input type="submit" value="Registration" id="register" name="button"></form>
     <form action="contact.jsp">   <input type="submit" value="contact" id="contact" name="button"></form>
      <form  action="feed.jsp"><input type="submit" value="feedback" id="feedback" name="button">
    </form>
</div>

<table>
    <tr>
        <th>Names</th>
        <th>Questions</th>
        <th>Send</th> <!-- New column for Send button -->
    </tr>
    <% 
    Connection conn = null; // Moved connection declaration outside the loop
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
        String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
        String USER = "system";
        String PASS = "vyshu";

        // Register JDBC driver
        Class.forName(JDBC_DRIVER);

        // Open a connection
        conn = DriverManager.getConnection(DB_URL, USER, PASS);

        // Prepare SQL query to retrieve questions from the database table
        String sql = "SELECT * FROM faq";
        pstmt = conn.prepareStatement(sql);

        // Execute the query
        rs = pstmt.executeQuery();

        // Loop through the result set and generate table rows dynamically
        while (rs.next()) {
            String name = rs.getString(1);
            String question = rs.getString(2);
    %>
    <tr>
        <td><%= name %></td>
        <td><%= question %></td>
        <td>
            <button onclick="sendAnswer('<%= name %>')">Send</button> <!-- Button to send answer -->
        </td>
    </tr>
    <% 
        }
    } catch (SQLException se) {
        // Handle errors for JDBC
        se.printStackTrace();
    } catch (Exception e) {
        // Handle errors for Class.forName
        e.printStackTrace();
    } finally {
        // Finally block used to close resources
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } // end finally try
    } // end try
    %>
</table>

<script>
    function sendAnswer(name) {
        var answer = prompt("Enter answer for " + name);
        if (answer) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "this_page.jsp", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        var response = xhr.responseText;
                        console.log("Response from server:", response); // Log the response
                        if (response == "success") {
                            
                        } else {
                            
                        }
                    } else {
                        console.error("Error:", xhr.status);
                    }
                }
            };
            xhr.send("name=" + name + "&answer=" + encodeURIComponent(answer));
        }
    }
</script>

<%
    String name = request.getParameter("name");
    String answer = request.getParameter("answer");
    if (name != null && !name.isEmpty() && answer != null && !answer.isEmpty()) {
        Connection con = null;
        PreparedStatement pst = null;
        try {
            String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
            String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
            String USER = "system";
            String PASS = "vyshu";

            // Register JDBC driver
            Class.forName(JDBC_DRIVER);

            // Open a connection
            con = DriverManager.getConnection(DB_URL, USER, PASS);

            // Prepare SQL query to insert answer into the database table Ans
            String insertSQL = "INSERT INTO Ans VALUES (?, ?)";
            pst = con.prepareStatement(insertSQL);
            pst.setString(1, name);
            pst.setString(2, answer);

            // Execute the insert query
            int rowsAffected = pstmt.executeUpdate();

            // Print response to AJAX request
            if (rowsAffected > 0) {
                out.print("success");
            } else {
                out.print("error");
            }
        } catch (SQLException se) {
            // Handle errors for JDBC
            se.printStackTrace();
            out.print("error");
        } catch (Exception e) {
            // Handle errors for Class.forName
            e.printStackTrace();
            out.print("error");
        } finally {
            // Finally block used to close resources
            try {
                if (pst != null) pstmt.close();
                if (con != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
%>

</body>
</html>
