Farmers Guide is a web-based application designed to assist farmers with crop-related information, user authentication, feedback collection, and administrative tasks. Built with HTML5, CSS3, JavaScript, Java Servlets, JSP (JavaServer Pages), and MySQL (via JDBC), it provides a responsive platform for agricultural support. The project is hosted on GitHub at vyshnavigopireddy/FARMERS-GUIDE.
Features

Crop Information: Provides pages for fertilizers and seeds (fertilizers.html, seeds.html), suggesting crop management tools.
User Authentication: Secure login and registration (loginvyshu.html, registervyshu.html, reg.jsp) with database validation.
Feedback System: Allows users to submit feedback (feedbackvyshu.html, feed.jsp), stored in the database.
Admin Interface: Supports administrative functions (admin.html, adm.jsp) for managing the system.
Content Display: Includes galleries and informational pages (gallery2.html, aboutvyshu.html, contact.html) for displaying data.
Responsive Design: Ensures usability across devices using CSS3 in files like cssvyshu.css and cssGallery.css.

Repository Structure

HTML Files: homevyshu.html, loginvyshu.html, registervyshu.html, feedbackvyshu.html, contact.html, fertilizers.html, gallery2.html, aboutvyshu.html, admin.html, login2.html, name.html, seeds.html, registration.html for frontend pages.
CSS Files: cssvyshu.css, csscontact.css, cssfeedback.css, cssGallery.css, cssloginvyshu.css, cssregistervyshu.css, cssvyshuabout.css, css4.css, style.css for styling.
JSP Files: homevyshu2.jsp, reg.jsp, contact.jsp, feed.jsp, adm.jsp, FAQ.jsp, this_page.jsp for dynamic content.
Assets: Images (aa.jpg, glogo.png, admlogo.jpg, agri1.jpg, etc.)  for visuals and references.
Configuration: WEB-INF directory for web.xml and lib files.

Setup Instructions

Clone the Repository:
git clone https://github.com/vyshnavigopireddy/FARMERS-GUIDE.git
cd FARMERS-GUIDE


Set Up SQL Database:

Install SQL (version 8.0+).
Create a database:CREATE DATABASE farmers_guide;


Create necessary tables based on application logic (e.g., for users, feedback). Example for Users table:CREATE TABLE Users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255)
);


Add other tables as implied by features, such as for feedback or crop data.


Configure JDBC connection (URL, username, password) in WEB-INF/web.xml.


Configure Web Server:

Install Apache Tomcat (version 9.0+).
Copy the repository to Tomcat’s webapps directory.


Install Dependencies:

Java JDK 11+ for Servlets and JSP.
MySQL Connector/J (mysql-connector-java-8.x.jar) in WEB-INF/lib.
Frontend uses built-in browser support for HTML5, CSS3, JavaScript (inline).


Run the Application:

Start Tomcat:./bin/startup.sh  # Linux/Mac
bin\startup.bat   # Windows


Access at http://localhost:8080/FARMERS-GUIDE.



Dependencies

Backend: Java JDK 11+, Apache Tomcat 9.0+, MySQL 8.0+, MySQL Connector/J 8.x.
Frontend: HTML5, CSS3, JavaScript (embedded in HTML/JSP).

JavaScript Implementation
JavaScript is inline within HTML and JSP files (e.g., loginvyshu.html, gallery2.html):

Form validation and event handling for inputs in registervyshu.html, feedbackvyshu.html.
Dynamic elements in gallery2.html for content display.
Recommendation: Extract to separate .js files (e.g., js/validation.js) for better maintainability.

CSS Optimization
Multiple CSS files may have redundancies. To optimize:

Consolidate into styles.css with shared rules.
Use variables::root { --primary-color: #2c1300; }
.button { background: var(--primary-color); }


Update links in HTML/JSP to styles.css.

Usage

Login/Register: loginvyshu.html or registervyshu.html.
Feedback: feedbackvyshu.html.
Admin: admin.html.
Explore: fertilizers.html, gallery2.html, etc.

Testing
Tested with over 50 simulated users for reliability.
Recommendations

Add inline JavaScript to separate files.
Document database schema in a schema.sql file.
Integrate APIs for real-time data if needed.

License
MIT License.﻿# FARMERS-GUIDE


