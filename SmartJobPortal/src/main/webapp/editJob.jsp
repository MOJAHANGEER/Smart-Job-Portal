<%@ page import="java.sql.*, com.jobportal.DBConnection" %>

<%
int jobId = Integer.parseInt(request.getParameter("jobId"));

Connection con = DBConnection.getCon();
PreparedStatement ps = con.prepareStatement("SELECT * FROM jobs WHERE id=?");
ps.setInt(1, jobId);

ResultSet rs = ps.executeQuery();
rs.next();
%>

<h2>Edit Job</h2>

<form action="UpdateJobServlet" method="post">
    <input type="hidden" name="jobId" value="<%=jobId%>">

    Title:
    <input type="text" name="title" value="<%=rs.getString("title")%>"><br><br>

    Description:
    <textarea name="description"><%=rs.getString("description")%></textarea><br><br>

    <button type="submit">Update</button>
</form>