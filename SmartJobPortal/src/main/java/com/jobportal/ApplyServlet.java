package com.jobportal;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class ApplyServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        int jobId = Integer.parseInt(req.getParameter("jobId"));
        HttpSession session = req.getSession();
        String user = (String) session.getAttribute("user");

        try {
            Connection con = DBConnection.getCon();

            // CHECK IF ALREADY APPLIED
            PreparedStatement check = con.prepareStatement(
                "SELECT * FROM applications WHERE user_email=? AND job_id=?"
            );

            check.setString(1, user);
            check.setInt(2, jobId);

            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                // Already applied
                res.sendRedirect("jobs.jsp?msg=already");
            } else {
                // Apply now
                PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO applications(user_email, job_id) VALUES(?,?)"
                );

                ps.setString(1, user);
                ps.setInt(2, jobId);

                ps.executeUpdate();

                res.sendRedirect("jobs.jsp?msg=success");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}