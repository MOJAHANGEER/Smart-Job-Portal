<%@ page import="java.sql.*, com.jobportal.DBConnection" %>

<%
String user = (String) session.getAttribute("user");

if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>My Applications</title>

<style>
body {
    font-family: 'Segoe UI';
    background: linear-gradient(to right, #ff9966, #ff5e62);
    margin: 0;
}

.wrapper {
    width: 80%;
    margin: auto;
    margin-top: 50px;
}

h2 {
    text-align: center;
    color: white;
}

.grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
}

.card {
    background: white;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}

button {
    padding: 8px 12px;
    margin-top: 10px;
    background: red;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.back {
    margin-top: 20px;
}

@media (max-width: 768px) {
    .grid {
        grid-template-columns: 1fr;
    }
}
</style>

</head>

<body>

<div class="wrapper">

<h2>My Applications</h2>

<div class="grid">

<%
Connection con = DBConnection.getCon();

PreparedStatement ps = con.prepareStatement(
    "SELECT j.id, j.title, j.description FROM jobs j " +
    "JOIN applications a ON j.id = a.job_id " +
    "WHERE a.user_email=?"
);

ps.setString(1, user);

ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<div class="card">
    <h3><%= rs.getString("title") %></h3>
    <p><%= rs.getString("description") %></p>

    <a href="WithdrawServlet?jobId=<%=rs.getInt("id")%>">
        <button>Withdraw</button>
    </a>
</div>

<%
}
%>

</div>

<div class="back">
    <a href="home.jsp" style="color:white;">Back</a>
</div>

</div>

</body>
</html>