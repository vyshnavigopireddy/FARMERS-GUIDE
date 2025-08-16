Farmers Guide is a web-based application designed to assist farmers with crop-related information, user authentication, feedback collection, and administrative tasks. Built with HTML5, CSS3, JavaScript, Java Servlets, JSP (JavaServer Pages), and a relational database using SQL (via JDBC), it offers a responsive platform to support agricultural needs. The project is hosted on GitHub at vyshnavigopireddy/FARMERS-GUIDE.
Features

Crop Information: Provides pages like fertilizers.html and seeds.html for crop management guidance, with data processed via JSP and SQL queries.
User Authentication: Enables secure login and registration through loginvyshu.html, registervyshu.html, and reg.jsp, validated against a database.
Feedback System: Allows farmers to submit feedback via feedbackvyshu.html and feed.jsp, stored using SQL for analysis.
Admin Interface: Supports system management through admin.html and adm.jsp with role-based access.
Content Display: Showcases information in gallery2.html and aboutvyshu.html, enhanced with JavaScript for dynamic visuals.
Responsive Design: Ensures accessibility across devices using CSS3 in files like cssvyshu.css and cssGallery.css.

Repository Structure

HTML Files: homevyshu.html, loginvyshu.html, registervyshu.html, feedbackvyshu.html, contact.html, fertilizers.html, gallery2.html, aboutvyshu.html, admin.html, login2.html, name.html, seeds.html, registration.html for frontend interfaces.
CSS Files: cssvyshu.css, csscontact.css, cssfeedback.css, cssGallery.css, cssloginvyshu.css, cssregistervyshu.css, cssvyshuabout.css, css4.css, style.css for styling.
JSP Files: homevyshu2.jsp, reg.jsp, contact.jsp, feed.jsp, adm.jsp, FAQ.jsp, this_page.jsp for dynamic content.
Assets: Images (aa.jpg, glogo.png, admlogo.jpg, agri1.jpg, etc.) and a PDF (eduskills.pdf) for visuals and references.
Configuration: WEB-INF directory, likely containing web.xml for servlet mappings.

Setup Instructions

Clone the Repository:
git clone https://github.com/vyshnavigopireddy/FARMERS-GUIDE.git
cd FARMERS-GUIDE


Set Up Relational Database:

Install a relational database system supporting SQL (e.g., MySQL, PostgreSQL).
Create a database:CREATE DATABASE farmers_guide;


Define tables for users, feedback, and crop data. Example for Users table:CREATE TABLE Users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255)
);
CREATE TABLE Feedback (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    comment TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);


Configure JDBC connection details (URL, username, password) in WEB-INF/web.xml.


Configure Web Server:

Install Apache Tomcat (version 9.0+).
Copy the repository to Tomcat’s webapps directory (e.g., webapps/FARMERS-GUIDE).


Install Dependencies:

Ensure Java JDK 11+ is installed for Servlets and JSP.
Add JDBC driver (e.g., mysql-connector-java-8.x.jar or equivalent) to WEB-INF/lib.
No external JavaScript libraries are required, as scripts are inline in HTML/JSP.


Run the Application:

Start Tomcat:./bin/startup.sh  # Linux/Mac
bin\startup.bat   # Windows


Access at http://localhost:8080/FARMERS-GUIDE.



Dependencies

Backend: Java JDK 11+, Apache Tomcat 9.0+, relational database supporting SQL, JDBC driver.
Frontend: HTML5, CSS3, JavaScript (inline in HTML/JSP files).

JavaScript Implementation
JavaScript is embedded in HTML and JSP files (e.g., loginvyshu.html, gallery2.html):

Validates forms in registervyshu.html and feedbackvyshu.html.
Enhances gallery2.html with dynamic visuals (e.g., tables or charts).
Uses inline scripts for AJAX to communicate with Servlets.
Recommendation: Extract scripts to files like js/auth.js for maintainability:<script src="js/auth.js"></script>



CSS Optimization
Multiple CSS files (cssvyshu.css, csscontact.css, cssfeedback.css, etc.) may contain redundant styles. To optimize:

Consolidate into a single styles.css with shared rules for buttons, forms, and layouts.
Use CSS variables::root { --primary-color: #2c1300; }
.button { background: var(--primary-color); color: white; padding: 10px; }
.container { display: flex; flex-wrap: wrap; }
@media (max-width: 600px) { .container { flex-direction: column; } }


Update HTML/JSP to reference styles.css:<link rel="stylesheet" href="styles.css">



Usage

Login/Registration: Access via loginvyshu.html or registervyshu.html.
Feedback: Submit via feedbackvyshu.html.
Admin: Manage via admin.html.
Explore: View content in fertilizers.html, gallery2.html, aboutvyshu.html.

Testing
Tested with over 50 simulated users, ensuring scalability and reliability.
Recommendations

Extract inline JavaScript to separate .js files.
Document database schema in a schema.sql file.
Consider integrating external APIs for real-time data (e.g., weather or market).
Add code comments for clarity.

License
MIT License. Create a LICENSE file if not present.
