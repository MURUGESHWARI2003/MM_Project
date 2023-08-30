<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String review = request.getParameter("review");
    
    // Database connection parameters
    String jdbcURL = "jdbc:mysql://localhost:3306/events";
    String dbUser = "root";
    String dbPassword = "Amu@2023";
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        
        String insertQuery = "INSERT INTO reviews (username, review) VALUES (?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, review);
        preparedStatement.executeUpdate();
        
        preparedStatement.close();
        connection.close();
        
        response.sendRedirect("review_page.jsp"); // Redirect back to the review page
    } catch (Exception e) {
        e.printStackTrace();
        out.println("An error occurred.");
    }
%>
