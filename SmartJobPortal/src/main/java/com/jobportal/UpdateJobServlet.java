package com.jobportal;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class UpdateJobServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        int jobId = Integer.parseInt(req.getParameter("jobId"));
        String title = req.getParameter("title");
        String desc = req.getParameter("description");

        try {
            Connection con = DBConnection.getCon();

            PreparedStatement ps = con.prepareStatement(
                "UPDATE jobs SET title=?, description=? WHERE id=?"
            );

            ps.setString(1, title);
            ps.setString(2, desc);
            ps.setInt(3, jobId);

            ps.executeUpdate();

            res.sendRedirect("jobs.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}