<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tutor Login</title>
    <link rel="stylesheet" href="/styles/styles.css?v=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    
</head>
<body>
    <header>
        <div id="logo-container">
            <img src="images/logo.png" alt="Courses Online" id="logo" onclick="location.href='index.jsp';">
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="index.jsp">About Us</a></li>
                <li><a href="index.jsp">Our Courses</a></li>
                <li><a href="index.jsp">Contact Us</a></li>
                <li><a href="login.jsp">Login</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <h1>Tutor Login</h1>

        <!-- Error message section -->
        <% 
            String loginError = (String) session.getAttribute("loginError");
            if (loginError != null) {
        %>
            <p style="color: red;"><%= loginError %></p>
            <% session.removeAttribute("loginError"); %>
        <% } %>

        <form action="login-process.jsp" method="post">
            <label for="phone">Phone Number:</label>
            <input type="text" id="phone" name="phone" required>
        
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        
            <button type="submit">Login</button>
        </form>
        
        <p>Don't have an account? <a href="create-registration.jsp">Register here</a></p>
        
    </main>

    <!-- Back Button at the Bottom -->
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

    <script src="/scripts/script.js"></script>
</body>
</html>

