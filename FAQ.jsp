<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQs</title>
    <script type="text/javascript">
        function alertName(){
            alert("Question has been submitted");
        } 
    </script>
    <style>
        /* Your CSS styles */
.{
margin:0;
padding:0;
box-sizing:border-box;
}
body{
font-family:"Quicksand",sans-serif;
background:#1c1c1c;
color:#fff;
}
section{
min-height:100vh;
width:84%;
margin:0 auto;
display:flex;
flex-direction:column;
align-items:center;
}
.title{
font-size:3rem;
margin:2rem 0rem;
}
.faq{
max-width: 700px;
margin-top:2rem;
padding-bottom:1rem;
border-bottom:2px solid #fff;
cursor:pointer;
}
.question {
display: flex;
justify-content:space-between;
align-items:center;
}
.question h3{
font-size:1.8rem;
}
.answer{
max-height:0;
overflow:hidden;
transition:max-height;
}
.answer p{
padding-top:1rem;
line-height:1.6;
font-size:1.4rem;
}
.faq {
  max-height: 300px; /* Adjust as needed */
}

.active {
  max-height: 300px; /* Adjust as needed */
}
.main
{
  max-width: 700px;
margin-top:2rem;
padding-bottom:1rem;
border-bottom:2px solid #fff;
cursor:pointer;
   }
.ab{
display: flex;
justify-content:space-between;
align-items:center;
}
.ab h3{
font-size:1.8rem;
}

label
 {    
      color:white;
      font-weight: bold;
 }
input
 {
      width: 200%;
      padding: 20px;
      box-sizing: border-box;
    color:black;
   
    }
.button
{
 border: none;
    outline: none;
    height: 50px;
    background: #98FF98;
    color: #fff;
    font-size: 18px;
    border-radius: 20px;
}
.button:hover
 {
      background-color: aqua;
    }
.tt{

    width: 100%; /* Ensure the section spans the full width */
    min-height: 100vh;
    margin: 0 auto;
    display: flex;
    flex-direction: column;
    align-items: center;
	margin-right:150px;

}
table {
margin-top:20px;
    width: 400px;
    border-collapse: collapse;
    
}

th, td {
    border: 1px solid #fff;
    padding: 8px;
}

th {
    background-color: green;
    color: black;
}


    </style>
</head>
<body>
    <section>
        <h2 class="title">FAQs</h2>
        <div class="faq">
            <!-- FAQs here -->
<div class="question" id="question1">
<h3>How do we signup?</h3>
<svg width="15" height="10" viewBox="0 0 42 25">
<path
d="M3 3L21 21L39 3"
stroke="white"
stroke-linecap="round"
/>
</svg>
</div>
<div class="answer" id="answer1">
<p>
Create your account on FarmersGuide to advertise for free as a private farmer. You’ll need your personal details including, email, phone and address.
</p>
</div>
</div>
<div class="faq">
<div class="question" id="question2">
<h3>What are methods of farming?</h3>
<svg width="15" height="10" viewBox="0 0 42 25">
<path
d="M3 3L21 21L39 3"
stroke="white"
stroke-linecap="round"
/>
</svg>
</div>
<div class="answer" id="answer2">
<p>
The farming systems that significantly contribute to the agriculture of India are subsistence farming, organic farming, industrial farming.
</p>
</div>
</div>
<div class="faq">
<div class="question" id="question3">
<h3> How can I get a Used Tractor in India?</h3>
<svg width="15" height="10" viewBox="0 0 42 25">
<path
d="M3 3L21 21L39 3"
stroke="white"
stroke-linecap="round"
/>
</svg>
</div>
<div class="answer" id="answer3">
<p>
You can buy a best used tractor in India with complete details on Tractor Junction.</p>
</div>
</div>
<div class="faq">
<div class="question" id="question4">
<h3>What are the benefits of organic farming?</h3>
<svg width="15" height="10" viewBox="0 0 42 25">
<path
d="M3 3L21 21L39 3"
stroke="white"
stroke-linecap="round"
/>
</svg>
</div>
<div class="answer" id="answer4">
<p>
 Organic farming prevents the use of pesticides, herbicides and other harmful chemicals. Due to organic farming, plants and insects will survive..</p>
</div>
</div>

        </div>
        <div class="main">
            <div class="ab">
                <form method="POST">
                    <p>Name</p>
                    <input type="text" name="name" placeholder="Enter your name" required><br> <!-- Added name field -->
                    <p>Question</p>
                    <input type="text" name="ques" placeholder="Enter a Question" required><hr>
                    <input type="submit" value="Submit" class="button" onclick="alertName()">
                </form>
            </div>
        </div>
        <%
            String name = request.getParameter("name");
            String question = request.getParameter("ques");

            if (name != null && question != null) {
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection c1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "vyshu");
                    PreparedStatement pst = c1.prepareStatement("INSERT INTO faq (name, question) VALUES (?, ?)");
                    pst.setString(1, name);
                    pst.setString(2, question);
                    int i = pst.executeUpdate();
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        %>

                        <%
                String uname = (String) session.getAttribute("username");
                if (uname == null || uname.isEmpty()) {
            %>
            <div id="bookingdetails">
                
            </div>
            <%
                } else {
                    try {
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "vyshu");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from Ans");
                        boolean hasBookings = false; // Flag to check if there are any bookings
            %>
	<section class="tt">
            <div id="bookingdetails">
                <table id="bookingdetails">
                    <tr>
                        <th>Name</th>
                        <th>Answer</th>
                                           
		</tr>
                    <% while (rs.next()) {
                        if (uname.equals(rs.getString(1))) {
                            hasBookings = true; // Set flag to true if there are bookings
                    %>
                    <tr>
                        <td><%= rs.getString(1) %></td>
                        <td><%= rs.getString(2) %></td>
                        
                    </tr>
                    <% } } %>
                </table>
                <% if (!hasBookings) { %>
                    <p>No Questions asked.</p> <!-- Display message if no bookings -->
                <% } %>
            </div>
            <%
                    rs.close();
                    st.close();
                    con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            %>
        
    </section>
</section>
    <script>
        // Your JavaScript code
    </script>
</body>
</html>
