<html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>FARMERS GUIDE</title>
	<link rel="stylesheet" type="text/css" href="cssvyshu.css">
<script src="https://kit.fontawesome.com/97dc0469ce.js" crossorigin="anonymous"></script>

<style>
.video-background{
position: absolute;
bottom: 0;
max-width: 100vw;
max-height: 120vh;
margin: 0 auto;
width: auto;
height: auto;
z-index: -1;
float:left;
width:100%;
overflow:hidden;
}
body{
text-overflow: hidden;
}
</style>
</head>
<body>
<section>
<video class="video-background" autoplay loop muted>
<source src="test.mp4" type="video/mp4">
</video>
 
<div class="img1">
<img src="glogo.png"></div>	
<div class="dropdownmenu">
			<ul>
				<li><a href="#"><strong>Home</strong></a></li>
                             <li><a href="#"><strong>Gallery</strong></a>    
                          <div class="s">
   				<ul>
                                        <li><a href="gallery2.html">machinery</a></li><br>  
					 <li><a href="fertilizers.html">fertilizers&pesticides</a></li><br> 
					 <li><a href="seeds.html">seeds</a></li><br>  
				</ul>
			   </div>
			   </li>  
				<li><a href="aboutvyshu.html"><strong>About Us</strong></a></li>
				<li><a href="contact us vyshu.html"><strong>Contact Us</strong></a></li>
				<li><a href="feedbackvyshu.html"><strong>Feedback</strong></a></li>
                                <li><a href="FAQ.jsp"><strong>FAQs</strong></a></li>   
				 <%
        String uname = (String) session.getAttribute("username");
         if(uname != null) {
    %><li><strong>welcome:<%= uname %></strong></li>
<%
        } 
    %>
	<li><a href="homevyshu.html"><strong>Logout</strong></a></li>
          
          </ul>     
             </div>

		<div class="title">
		 	<h1>FARMERS GUIDE</h1>
		</div>
		</section>

<section class="s4">
<div class="down">
  <div class="row">
   <div class="col">
   <img src="https://www.thefarmersguideug.com/wp-content/uploads/2017/06/The-Farmers-Guide-UG.png">
     <h1>Farmers Guide</h1>
  </div>
    <div class="col">
    <h3>office</h3>
     <p>One Town</p>
     <p>Vijayawada</p>
     <p>Andhra Pradesh,PIN 502355,India</p>
    <p class="email-id">farmersguide@gmail.com</p>
     <h4>+91-9876543210</h4>
    </div>
    <div class="col">
    <h3>Links</h3>
    <ul>
     <li><a href="homevyshu.html">Home</a></li>
     <li><a href="aboutvyshu.html">About Us</a></li>
     <li><a href="contact us vyshu.html">ContactUs</a></li>
     <li><a href="login2.html">Login</a></li>
     <li><a href="#">Gallery</a></li>
     <li><a href="registration.html">Register</a></li>
    <li><a href="feedbackvyshu.html">Feedback</a></li>
    <li><a href="FAQ.jsp">FAQs</a></li>
     </div>
     <div class="social">
    <i class="fab fa-facebook-f"></i>
    <i class="fab fa-twitter"></i>
    <i class="fab fa-whatsapp"></i>
    <i class="fab fa-pinterest"></i>
   </div>
</div>
</div>
</section>
</body>
</html>