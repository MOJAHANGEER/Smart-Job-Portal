package com.jobportal;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class WithdrawServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        int jobId = Integer.parseInt(req.getParameter("jobId"));
        HttpSession session = req.getSession();
        String user = (String) session.getAttribute("user");

        try {
            Connection con = DBConnection.getCon();

            PreparedStatement ps = con.prepareStatement(
                "DELETE FROM applications WHERE user_email=? AND job_id=?"
            );

            ps.setString(1, user);
            ps.setInt(2, jobId);

            ps.executeUpdate();

            res.sendRedirect("myApplications.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}