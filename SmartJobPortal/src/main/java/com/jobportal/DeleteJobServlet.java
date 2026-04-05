package com.jobportal;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class DeleteJobServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        int jobId = Integer.parseInt(req.getParameter("jobId"));

        try {
            Connection con = DBConnection.getCon();

            PreparedStatement ps = con.prepareStatement(
                "DELETE FROM jobs WHERE id=?"
            );

            ps.setInt(1, jobId);
            ps.executeUpdate();

            res.sendRedirect("jobs.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}