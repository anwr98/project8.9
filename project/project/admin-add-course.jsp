<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Course</title>
    <link rel="stylesheet" href="/styles/styles.css?v=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <header>
        <div id="logo-container">
            <img src="images/logo.png" alt="Courses Online" id="logo" onclick="location.href='admin-dashboard.jsp';">
        </div>
        <nav>
            <ul>
                <li><a href="admin-dashboard.jsp">Dashboard</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <h1>Add New Course</h1>
        <form action="add-course-process.jsp" method="post" enctype="multipart/form-data">
            <label for="name">Course Name:</label>
            <input type="text" id="name" name="name" required>
        
            <label for="image">Course Image:</label>
            <input type="file" id="image" name="image" accept="image/*" required>
        
            <button type="submit">Add Course</button>
        </form>
        
        
        
    </main>

    <div style="text-align: center; margin-top: 20px;">
        <%
            // Retrieve the referer (previous page) from the HTTP header
            String referer = request.getHeader("referer");
        %>
        <% if (referer != null) { %>
            <a href="<%= referer %>">
                <button class="back-button">Back</button>
            </a>
        <% } else { %>
            <button class="back-button" onclick="history.back()">Back</button>
        <% } %>
    </div>
    

    <footer>
        <div class="footer-content">
            <p>Follow us:</p>
            <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook"></i></a>
            <a href="https://twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
            <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
        </div>
    </footer>
</body>
</html>
