package servlets.jdbc;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
//import org.*;
//import com.mysql.jdbc.Driver;
import java.sql.*;
import java.util.Properties;


public class SubjectsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();

//        pw.println("<html lang=\"en\">\n" +
//                "<body>\n" +
//                "<h1>Hello from Subject!</h1>\n" +
//                "</body>\n" +
//                "</html>");

        try {
            Class.forName("com.mysql.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            e.printStackTrace();

        }
        
        Properties connectionProperties = new Properties();

        connectionProperties.load(getServletContext().getResourceAsStream("/WEB-INF/properties/db.properties"));

        try {
            Connection connection = DriverManager.getConnection(

                    connectionProperties.getProperty("url"),
                    connectionProperties.getProperty("user"),
                    connectionProperties.getProperty("password")
                    );

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT title from subjects");

            while (resultSet.next()) {
                pw.println(resultSet.getString("title"));
            }
            statement.close();
            connection.close();


        } catch (SQLException throwables) {
            pw.println(throwables);
            throwables.printStackTrace();
        }
    }

}

