<%
String user = (String) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
<title>Job Portal</title>

<style>
body {
    font-family: 'Segoe UI';
    background: linear-gradient(to right, #667eea, #764ba2);
    text-align: center;
    color: white;
}

.container {
    margin-top: 100px;
}

.card {
    background: white;
    color: black;
    display: inline-block;
    padding: 20px;
    margin: 15px;
    border-radius: 12px;
    width: 200px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}

button {
    padding: 10px;
    width: 100%;
    background: #667eea;
    color: white;
    border: none;
    border-radius: 5px;
}

a {
    text-decoration: none;
}
</style>

</head>

<body>

<h1>SMART JOB PORTAL</h1>

<div class="container">

<%
if (user == null) {
%>

    <!-- NOT LOGGED IN -->

    <div class="card">
        <h3>Register</h3>
        <a href="register.jsp"><button>Go</button></a>
    </div>

    <div class="card">
        <h3>Login</h3>
        <a href="login.jsp"><button>Go</button></a>
    </div>

<%
} else {
%>

    <!-- LOGGED IN -->

    <h2>Welcome, <%= session.getAttribute("name") %></h2>
    
    <div class="card">
    <h3>My Applications</h3>
    <a href="myApplications.jsp"><button>View</button></a>
	</div>

    <div class="card">
        <h3>View Jobs</h3>
        <a href="jobs.jsp"><button>Explore</button></a>
    </div>

    <div class="card">
        <h3>Post Job</h3>
        <a href="postJob.jsp"><button>Post</button></a>
    </div>

    <div class="card">
        <h3>Logout</h3>
        <a href="LogoutServlet"><button>Logout</button></a>
    </div>

<%
}
%>

</div>

</body>
</html>