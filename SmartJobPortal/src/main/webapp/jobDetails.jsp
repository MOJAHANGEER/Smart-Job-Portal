<%@ page import="java.sql.*, com.jobportal.DBConnection" %>

<%
int jobId = Integer.parseInt(request.getParameter("jobId"));

Connection con = DBConnection.getCon();
PreparedStatement ps = con.prepareStatement("SELECT * FROM jobs WHERE id=?");
ps.setInt(1, jobId);

ResultSet rs = ps.executeQuery();
rs.next();
%>

<!DOCTYPE html>
<html>
<head>
<style>
body {
    font-family: Arial;
    background: linear-gradient(to right, #ff9966, #ff5e62);
}

.container {
    width: 50%;
    margin: 100px auto;
    background: white;
    padding: 30px;
    border-radius: 10px;
    text-align: center;
}

button {
    padding: 10px 20px;
    background: #ff5e62;
    color: white;
    border: none;
    border-radius: 5px;
}
</style>
</head>

<body>

<div class="container">
    <h2><%= rs.getString("title") %></h2>
    <p><%= rs.getString("description") %></p>

    <a href="ApplyServlet?jobId=<%=jobId%>">
        <button>Apply Now</button>
    </a>

    <br><br>
    <a href="jobs.jsp">Back</a>
</div>

</body>
</html>