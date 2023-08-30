<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Event Reviews</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Event Reviews</h1>
    <div class="reviews">
        <% 
            String jdbcURL = "jdbc:mysql://localhost:3306/events";
            String dbUser = "root";
            String dbPassword = "Amu@2023";
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                
                String selectQuery = "SELECT * FROM reviews";
                PreparedStatement preparedStatement = connection.prepareStatement(selectQuery);
                ResultSet resultSet = preparedStatement.executeQuery();
                
                while(resultSet.next()) {
                    String username = resultSet.getString("username");
                    String userReview = resultSet.getString("review");
        %>
                    <div class="review">
                        <h3><%= username %></h3>
                        <p><%= userReview %></p>
                    </div>
        <%
                }
                
                resultSet.close();
                preparedStatement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
                out.println("An error occurred.");
            }
        %>
    </div>
</body>
</html>
