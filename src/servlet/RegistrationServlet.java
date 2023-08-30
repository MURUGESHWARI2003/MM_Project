package servlet;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet implements Serializable {
    private static final long serialVersionUID = 1L; // SerialVersionUID

    private static final String DB_URL = "jdbc:mysql://localhost:3306/Events";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Amu@2023";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String events = request.getParameter("event");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String place = request.getParameter("place");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String phone = request.getParameter("phone");
        System.out.println(name);

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String insertQuery = "INSERT INTO registration (events,name,email,gender,place,address,city,phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = conn.prepareStatement(insertQuery);
            preparedStatement.setString(1,events);
            preparedStatement.setString(2, name);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, gender);
            preparedStatement.setString(5, place);
            preparedStatement.setString(6, address);
            preparedStatement.setString(7, city);
            preparedStatement.setString(8, phone);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            conn.close();

            // Redirect to the success page
            response.sendRedirect("Weddingpage.html");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception and redirect to an error page if needed
        }
    }
}