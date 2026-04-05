package com.jobportal;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class RoleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        String role = req.getParameter("role");

        if ("seeker".equals(role)) {
            res.sendRedirect("jobs.jsp");
        } else if ("poster".equals(role)) {
            res.sendRedirect("postJob.jsp");
        }
    }
}