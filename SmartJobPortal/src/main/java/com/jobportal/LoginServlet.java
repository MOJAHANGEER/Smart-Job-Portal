package com.jobportal;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {

        String email = req.getParameter("email");
        String pass = req.getParameter("password");

        try {
            Connection con = DBConnection.getCon();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE email=? AND password=?"
            );

            ps.setString(1, email);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = req.getSession();
                session.setAttribute("user", rs.getString("email"));  // for DB
                session.setAttribute("name", rs.getString("name"));   // for display

                res.sendRedirect("home.jsp");
            } else {
                res.getWriter().println("WRONG EMAIL OR PASSWORD");
            }

        } catch (Exception e) {
            res.getWriter().println("Error: " + e.getMessage());
        }
    }
}