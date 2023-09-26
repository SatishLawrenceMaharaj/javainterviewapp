import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String fname = request.getParameter("fname");
    	String lname = request.getParameter("lname");
    	String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Initialize connection and prepared statement
        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/interview", "root", "maharaj123454321");

            // Use a prepared statement to insert user registration data into the database
            ps = con.prepareStatement("INSERT INTO users (f_name, l_name, email, password) VALUES (?, ?, ?, ?)");
            ps.setString(1, fname);
            ps.setString(2, lname);
            ps.setString(3, email);
            ps.setString(4, password);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                // Registration successful, forward to a success page
            	request.setAttribute("name", fname);
                RequestDispatcher rd = request.getRequestDispatcher("HomePage.jsp");
                rd.forward(request, response);
            } else {
                // Registration failed, display an error message
                response.getWriter().println("<font color=\"red\" size=\"18\">Registration failed</font>");
            }
        } catch (ClassNotFoundException e) {
            // Handle ClassNotFoundException (e.g., log the error)
            e.printStackTrace();
            response.getWriter().println("<font color=\"red\">Internal error: Database driver not found</font>");
        } catch (SQLException e) {
            // Handle SQLException (e.g., log the error)
            e.printStackTrace();
            response.getWriter().println("<font color=\"red\">Internal error: Database error</font>");
        } finally {
            // Close resources in a finally block
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                // Handle SQLException while closing resources (e.g., log the error)
                e.printStackTrace();
            }
        }
    }
}
