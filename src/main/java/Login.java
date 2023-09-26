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
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password"); 

        // Initialize connection, prepared statement, and result set
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/interview", "root", "maharaj123454321");

            // Use a prepared statement to prevent SQL injection
            ps = con.prepareStatement("SELECT id, f_name FROM users WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, password);

            rs = ps.executeQuery();

            if (rs.next()) {
                // Successful login, forward to HomePage.jsp
            	String firstName = rs.getString("f_name");

                request.setAttribute("name", firstName);
                RequestDispatcher rd = request.getRequestDispatcher("HomePage.jsp");
                rd.forward(request, response);
            } else {
                // Login failed, display an error message
                response.getWriter().println("<font color=\"red\" size=\"18\">Login failed</font>");
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
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                // Handle SQLException while closing resources (e.g., log the error)
                e.printStackTrace();
            }
        }
    }

}
