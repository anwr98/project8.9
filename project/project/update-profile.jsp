<%@ page import="java.sql.*, java.io.*, javax.servlet.http.Part" %>

<%
    // Ensure the tutor is logged in by checking session
    String tutorId = (String) session.getAttribute("tutorId");
    String notes = request.getParameter("notes");
    Part profilePic = request.getPart("profilePic");

    // Initialize variables
    String profilePicPath = null;

    // If a profile picture was uploaded
    if (profilePic != null && profilePic.getSize() > 0) {
        // Extract the filename from the content-disposition header
        String header = profilePic.getHeader("content-disposition");
        String fileName = header.substring(header.indexOf("filename=\"") + 10, header.lastIndexOf("\""));
        profilePicPath = "images/" + fileName;

        // Save the uploaded file
        File fileSaveDir = new File(application.getRealPath("/") + profilePicPath);
        profilePic.write(fileSaveDir.getAbsolutePath());
    }

    try {
        // Load MySQL JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

        // Establish connection to the database
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coding_courses?enabledTLSProtocols=TLSv1.2", "root", "0503089535a")) {

            StringBuilder sql = new StringBuilder("UPDATE tutors SET ");
            boolean updateNotes = (notes != null && !notes.trim().isEmpty());
            boolean updateProfilePic = (profilePicPath != null);

            if (updateNotes) {
                sql.append("notes = ?");
            }
            if (updateProfilePic) {
                if (updateNotes) {
                    sql.append(", ");
                }
                sql.append("profilePic = ?");
            }
            sql.append(" WHERE id = ?");

            try (PreparedStatement stmt = con.prepareStatement(sql.toString())) {
                int paramIndex = 1;

                // Set the note value if it's provided
                if (updateNotes) {
                    stmt.setString(paramIndex++, notes);
                }

                // Set the profile picture path if it's provided
                if (updateProfilePic) {
                    stmt.setString(paramIndex++, profilePicPath);
                }

                // Set the tutor ID for the update
                stmt.setString(paramIndex, tutorId);

                // Execute the update statement
                int n = stmt.executeUpdate();
                out.println(n + " rows updated.");
            }
        }

        // Redirect to the tutor dashboard page after update
        response.sendRedirect("tutor-dashboard.jsp");

    } catch (SQLException e) {
        e.printStackTrace();
        out.println("SQL Error: " + e.getMessage());
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        out.println("Error: MySQL Driver not found");
    } catch (IOException e) {
        e.printStackTrace();
        out.println("File Upload Error: " + e.getMessage());
    }
%>
