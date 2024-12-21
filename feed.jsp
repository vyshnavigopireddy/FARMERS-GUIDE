<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transportation Admin Dashboard</title>
    <style>
        /* Basic styling for demonstration purposes */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        header {
            background-color:  #66CDAA;
            color: #fff;
            padding: 10px;
            text-align: center;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 0 20px;
        }
        .dashboard {
            background-color: #f4f4f4;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        h2 {
            margin-top: 0;
        }
        .city-options {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .city-option {
            margin: 0 10px;
            cursor: pointer;
            padding: 5px 10px;
            border: 1px solid #333;
            border-radius: 5px;
            background-color: #fff;
            transition: background-color 0.3s ease;
        }
        .city-option:hover {
            background-color: black;
            color: white;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid  #fff;
        }
        th {
            background-color:  #66CDAA;
            color: black;
        }
        tr:hover {
            background-color: #f9f9f9;
        }
    </style>

</head>
<body>
    <header>
        <h1>Feedback Details</h1>
    </header>
    <div class="container">
        <div class="dashboard">
            <h2>Feedback Details</h2>
            <%
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "vyshu");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from feedback");
            %>
            <div id="registrationdetails">
                <table id="registrationdetails">
                    <tr>
                        <th>Name</th>
                        <th>Mail-id</th>
                        <th>Phoneno</th>
                        <th>Message</th>
                    </tr>
                    <% while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getString(1) %></td>
                        <td><%= rs.getString(2) %></td>
                        <td><%= rs.getString(3) %></td>
                        <td><%= rs.getString(4) %></td>
                       </tr>
                    <% } %>
                </table>
            </div>

            <% 
                rs.close();
                st.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </div>
    </div>
</body>
</html>
