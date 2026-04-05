<%@ page import="java.sql.*, com.jobportal.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<title>Jobs</title>

<style>
body {
    font-family: 'Segoe UI';
    background: linear-gradient(to right, #00c6ff, #0072ff);
    margin: 0;
}

/* WRAPPER */
.wrapper {
    width: 80%;
    margin: auto;
    margin-top: 50px;
}

/* HEADING */
h2 {
    text-align: center;
    color: white;
}

/* GRID */
.jobs-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

/* CARD */
.card {
    width: 48%;
    background: white;
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}

/* BUTTONS */
button {
    padding: 8px 12px;
    margin: 5px;
    background: #0072ff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.editBtn {
    background: orange;
}

.deleteBtn {
    background: red;
}

/* BACK BUTTON */
.back {
    margin-top: 20px;
}

/* TOAST */
#toast {
    position: fixed;
    top: 20px;
    right: 20px;
    color: white;
    padding: 15px 20px;
    border-radius: 8px;
    display: none;
    z-index: 1000;
}

/* RESPONSIVE */
@media (max-width: 768px) {
    .card {
        width: 100%;
    }
}
</style>

</head>

<body>

<!-- TOAST -->
<div id="toast"></div>

<script>
function showToast(message, color) {
    var toast = document.getElementById("toast");
    toast.innerText = message;
    toast.style.background = color;
    toast.style.display = "block";

    setTimeout(function () {
        toast.style.display = "none";
    }, 3000);
}
</script>

<%
String msg = request.getParameter("msg");

if ("success".equals(msg)) {
%>
<script>
showToast("Applied Successfully!", "#28a745");
window.history.replaceState(null, null, "jobs.jsp");
</script>
<%
} else if ("already".equals(msg)) {
%>
<script>
showToast("Already Applied!", "#dc3545");
window.history.replaceState(null, null, "jobs.jsp");
</script>
<%
}
%>

<div class="wrapper">

<h2>Available Jobs</h2>

<div class="jobs-grid">

<%
Connection con = DBConnection.getCon();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM jobs");

String currentUser = (String) session.getAttribute("user");

while(rs.next()){

    String desc = rs.getString("description");
    if (desc != null && desc.length() > 50) {
        desc = desc.substring(0, 50) + "...";
    }

    String jobOwner = rs.getString("posted_by");
%>

<div class="card">
    <h3><%= rs.getString("title") %></h3>
    <p><%= desc %></p>

    <!-- VIEW DETAILS -->
    <a href="jobDetails.jsp?jobId=<%=rs.getInt("id")%>">
        <button>View Details</button>
    </a>

    <!-- OWNER CONTROLS -->
    <% if (currentUser != null && currentUser.equals(jobOwner)) { %>

        <a href="editJob.jsp?jobId=<%=rs.getInt("id")%>">
            <button class="editBtn">Edit</button>
        </a>

        <a href="DeleteJobServlet?jobId=<%=rs.getInt("id")%>">
            <button class="deleteBtn">Delete</button>
        </a>

    <% } %>
</div>

<%
}
%>

</div>

<!-- BACK BUTTON -->
<div class="back">
    <a href="home.jsp" style="color:white;">Back</a>
</div>

</div>

</body>
</html>