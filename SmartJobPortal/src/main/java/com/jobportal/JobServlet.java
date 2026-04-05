package com.jobportal;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class JobServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {
    	try {
    	String title = req.getParameter("title");
    	String desc = req.getParameter("description");

    	HttpSession session = req.getSession();
    	String user = (String) session.getAttribute("user");

    	Connection con = DBConnection.getCon();

    	PreparedStatement ps = con.prepareStatement(
    	    "INSERT INTO jobs(title, description, posted_by) VALUES(?,?,?)"
    	);

    	ps.setString(1, title);
    	ps.setString(2, desc);
    	ps.setString(3, user);

    	ps.executeUpdate();

    	res.sendRedirect("jobs.jsp");

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
